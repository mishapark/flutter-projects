import 'package:mobx/mobx.dart';
import 'package:state_management/data/index.dart';

part 'state.g.dart';

class AppState = _AppState with _$AppState;

abstract class _AppState with Store {
  late final ItemService _itemService =
      ServiceProvider.instance.get<ItemService>();

  @observable
  List<ItemData> items = [];

  @observable
  List<ItemData> cartItems = [];

  @observable
  bool isLoading = false;

  @action
  Future loadItems() async {
    isLoading = true;
    items = await _itemService.getItems();
    cartItems = await _itemService.getCartItems();
    isLoading = false;
  }

  @action
  Future addItemToCart(ItemData item) async {
    isLoading = true;
    await _itemService.addItemToCart(item: item);
    isLoading = false;
  }

  @action
  Future removeItemFromCart(ItemData item) async {
    isLoading = true;
    await _itemService.removeItemFromCart(item: item);
    isLoading = false;
  }
}
