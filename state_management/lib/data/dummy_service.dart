import 'package:state_management/data/model/item_data.dart';
import 'package:state_management/data/services/item_service.dart';

class DummyService implements ItemService {
  static const List<ItemData> _allItems = [
    ItemData(
        id: 0,
        title: 'Laptop',
        description: 'Powerful laptop',
        image: 'assets/images/0.jpg'),
    ItemData(
        id: 1,
        title: 'Phone',
        description: 'Latest model',
        image: 'assets/images/1.jpg'),
    ItemData(
        id: 2,
        title: 'Monitor',
        description: 'Super wide monitor',
        image: 'assets/images/2.jpg'),
    ItemData(
        id: 3,
        title: 'Headset',
        description: 'Headset with noise cancelling',
        image: 'assets/images/3.jpg'),
    ItemData(
        id: 4,
        title: 'Mouse',
        description: 'Gaming mouse',
        image: 'assets/images/4.jpeg'),
    ItemData(
        id: 5,
        title: 'Microphone',
        description: 'Microphone for ASMR',
        image: 'assets/images/5.jpg'),
    ItemData(
        id: 6,
        title: 'Webcam',
        description: 'Streamers top choice',
        image: 'assets/images/6.jpg'),
    ItemData(
        id: 7,
        title: 'Gamepad',
        description: 'Compatible with Xbox and PS5',
        image: 'assets/images/7.jpg'),
    ItemData(
        id: 8,
        title: 'Speaker',
        description: 'Best audio quality',
        image: 'assets/images/8.jpg'),
  ];
  static final List<ItemData> _cartItems = [];

  @override
  Future<List<ItemData>> getItems() async {
    return _allItems;
  }

  @override
  Future<List<ItemData>> getCartItems() async {
    return _cartItems;
  }

  @override
  Future<void> addItemToCart({required ItemData item}) async {
    _cartItems.add(item);
  }

  @override
  Future<void> removeItemFromCart({required ItemData item}) async {
    _cartItems.remove(item);
  }
}
