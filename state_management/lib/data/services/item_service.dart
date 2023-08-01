import 'dart:async';

import 'package:state_management/data/model/item_data.dart';

abstract class ItemService {
  Future<List<ItemData>> getItems();
  Future<List<ItemData>> getCartItems();
  Future<void> addItemToCart({required ItemData item});
  Future<void> removeItemFromCart({required ItemData item});
}
