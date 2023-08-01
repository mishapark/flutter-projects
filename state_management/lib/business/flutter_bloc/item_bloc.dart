import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/business/flutter_bloc/state.dart';
import 'package:state_management/data/index.dart';

import 'events.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  late final ItemService _itemService;

  ItemBloc() : super(ItemLoadingState()) {
    _itemService = ServiceProvider.instance.get<ItemService>();

    on<LoadAllItems>((event, emit) async {
      emit(ItemLoadingState());
      try {
        final items = await _itemService.getItems();
        final cartItems = await _itemService.getCartItems();
        emit(ItemLoadedState(items, cartItems));
      } catch (e) {
        emit(ItemErrorState(e.toString()));
      }
    });

    on<AddItemToCart>((event, emit) async {
      emit(ItemLoadingState());
      try {
        _itemService.addItemToCart(item: event.item);
        final items = await _itemService.getItems();
        final cartItems = await _itemService.getCartItems();
        emit(ItemLoadedState(items, cartItems));
      } catch (e) {
        emit(ItemErrorState(e.toString()));
      }
    });

    on<RemoveItemFromCart>((event, emit) async {
      emit(ItemLoadingState());
      try {
        _itemService.removeItemFromCart(item: event.item);
        final items = await _itemService.getItems();
        final cartItems = await _itemService.getCartItems();
        emit(ItemLoadedState(items, cartItems));
      } catch (e) {
        emit(ItemErrorState(e.toString()));
      }
    });
  }
}
