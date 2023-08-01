import 'package:state_management/data/index.dart';

class LoadItemsAction {
  final List<ItemData> allItems;
  final List<ItemData> cartItems;

  LoadItemsAction(this.allItems, this.cartItems);
}

class AddItemToCartAction {
  final ItemData item;

  AddItemToCartAction(this.item);
}

class RemoveItemFromCartAction {
  final ItemData item;

  RemoveItemFromCartAction(this.item);
}
