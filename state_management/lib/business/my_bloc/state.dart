import 'package:state_management/data/index.dart';

class ItemState {
  final List<ItemData> items;
  final List<ItemData> cartItems;

  ItemState({
    this.items = const [],
    this.cartItems = const [],
  });

  ItemState copyWith({
    List<ItemData>? items,
    List<ItemData>? cartItems,
  }) {
    return ItemState(
      items: items ?? this.items,
      cartItems: cartItems ?? this.cartItems,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemState &&
          runtimeType == other.runtimeType &&
          items == other.items &&
          cartItems == other.cartItems;

  @override
  int get hashCode => items.hashCode ^ cartItems.hashCode;

  @override
  String toString() => 'SpeakersState{speakers: $items, filter: $cartItems}';
}
