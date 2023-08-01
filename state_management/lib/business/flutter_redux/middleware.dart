import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:state_management/business/flutter_redux/state.dart';
import 'package:state_management/data/index.dart';

import 'actions.dart';

void fetchItems(Store<ItemAppState> store) async {
  late final ItemService itemService =
      ServiceProvider.instance.get<ItemService>();

  List<ItemData> allItems = await itemService.getItems();
  List<ItemData> cartItems = await itemService.getCartItems();

  store.dispatch(LoadItemsAction(allItems, cartItems));
}

ThunkAction<ItemAppState> addItem(ItemData item) {
  late final ItemService itemService =
      ServiceProvider.instance.get<ItemService>();

  return (Store<ItemAppState> store) async {
    await itemService.addItemToCart(item: item);

    store.dispatch(AddItemToCartAction(item));
  };
}

ThunkAction<ItemAppState> removeItem(ItemData item) {
  late final ItemService itemService =
      ServiceProvider.instance.get<ItemService>();

  return (Store<ItemAppState> store) async {
    await itemService.removeItemFromCart(item: item);

    store.dispatch(RemoveItemFromCartAction(item));
  };
}
