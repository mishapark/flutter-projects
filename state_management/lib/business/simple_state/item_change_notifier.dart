import 'package:flutter/material.dart';
import 'package:state_management/data/index.dart';

class CartAppState with ChangeNotifier {
  late final ItemService _itemService;
  List<ItemData> allItems = [];
  List<ItemData> cartItems = [];

  CartAppState() {
    _itemService = ServiceProvider.instance.get<ItemService>();
    _initItems();
  }

  void _initItems() async {
    allItems = await _itemService.getItems();
    notifyListeners();
  }

  void addItem(ItemData item) async {
    await _itemService.addItemToCart(item: item);
    cartItems = await _itemService.getCartItems();
    notifyListeners();
  }

  void removeItem(ItemData item) async {
    await _itemService.removeItemFromCart(item: item);
    cartItems = await _itemService.getCartItems();
    notifyListeners();
  }
}
