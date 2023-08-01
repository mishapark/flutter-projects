import 'dart:async';

import 'package:state_management/data/index.dart';

import 'events.dart';
import 'state.dart';

class ItemBloc {
  late final ItemService _itemService;

  var _currentState = ItemState();

  final _stateController = StreamController<ItemState>.broadcast();
  final _eventController = StreamController<ItemEvent>();

  Stream<ItemState> get state => _stateController.stream;
  Sink<ItemEvent> get action => _eventController.sink;

  ItemBloc() {
    _itemService = ServiceProvider.instance.get<ItemService>();

    _eventController.stream.asBroadcastStream().listen(_handleEvent);
  }

  void _handleEvent(ItemEvent event) async {
    if (event is LoadAllItems) {
      final items = await _itemService.getItems();
      final cartItems = await _itemService.getCartItems();

      _currentState =
          _currentState.copyWith(items: items, cartItems: cartItems);
    }
    if (event is AddItemToCart) {
      await _itemService.addItemToCart(item: event.item);
      final cartItems = await _itemService.getCartItems();

      _currentState = _currentState.copyWith(cartItems: cartItems);
    }
    if (event is RemoveItemFromCart) {
      await _itemService.removeItemFromCart(item: event.item);
      final cartItems = await _itemService.getCartItems();

      _currentState = _currentState.copyWith(cartItems: cartItems);
    }
    _stateController.add(_currentState);
  }

  void dispose() {
    _eventController.close();
    _stateController.close();
  }
}
