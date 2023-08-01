import 'package:state_management/business/flutter_redux/actions.dart';
import 'package:state_management/business/flutter_redux/state.dart';

ItemAppState itemsReducer(ItemAppState prev, dynamic action) {
  if (action is LoadItemsAction) {
    return ItemAppState(allItems: action.allItems, cartItems: action.cartItems);
  }
  if (action is AddItemToCartAction) {
    return prev.copyWith(cartItems: prev.cartItems..add(action.item));
  }
  if (action is RemoveItemFromCartAction) {
    return prev.copyWith(cartItems: prev.cartItems..remove(action.item));
  }
  return ItemAppState.initial();
}
