import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/data/index.dart';

enum ItemType { allItems, cartItems }

final allItemsProvider =
    StateNotifierProvider<ItemsNotifier, Map<ItemType, List<ItemData>>>(
        (ref) => ItemsNotifier());

class ItemsNotifier extends StateNotifier<Map<ItemType, List<ItemData>>> {
  late final ItemService _itemService;

  ItemsNotifier()
      : super({
          ItemType.allItems: [],
          ItemType.cartItems: [],
        }) {
    _itemService = ServiceProvider.instance.get<ItemService>();
    _initItems();
  }

  void _initItems() async {
    state = {
      ...state,
      ItemType.allItems: await _itemService.getItems(),
    };
  }

  void addItem(ItemData item) async {
    _itemService.addItemToCart(item: item);
    state = {...state, ItemType.cartItems: await _itemService.getCartItems()};
  }

  void removeItem(ItemData item) async {
    _itemService.removeItemFromCart(item: item);
    state = {...state, ItemType.cartItems: await _itemService.getCartItems()};
  }
}
