import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/data/index.dart';

import 'state.dart';

class ItemCubit extends Cubit<ItemState> {
  late final ItemService _itemService;

  ItemCubit() : super(ItemLoadingState()) {
    _itemService = ServiceProvider.instance.get<ItemService>();
  }

  void loadItems() async {
    try {
      final items = await _itemService.getItems();
      final cartItems = await _itemService.getCartItems();
      emit(ItemLoadedState(items, cartItems));
    } catch (e) {
      emit(ItemErrorState(e.toString()));
    }
  }

  void addItemToCart(ItemData item) async {
    emit(ItemLoadingState());
    try {
      _itemService.addItemToCart(item: item);
      final items = await _itemService.getItems();
      final cartItems = await _itemService.getCartItems();
      emit(ItemLoadedState(items, cartItems));
    } catch (e) {
      emit(ItemErrorState(e.toString()));
    }
  }

  void removeItemFromCart(ItemData item) async {
    emit(ItemLoadingState());
    try {
      _itemService.removeItemFromCart(item: item);
      final items = await _itemService.getItems();
      final cartItems = await _itemService.getCartItems();
      emit(ItemLoadedState(items, cartItems));
    } catch (e) {
      emit(ItemErrorState(e.toString()));
    }
  }
}
