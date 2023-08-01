import 'package:flutter/material.dart';
import 'package:state_management/data/index.dart';

@immutable
class ItemAppState {
  final List<ItemData> allItems;
  final List<ItemData> cartItems;

  const ItemAppState({
    this.allItems = const [],
    this.cartItems = const [],
  });

  factory ItemAppState.initial() => const ItemAppState();

  ItemAppState copyWith({
    List<ItemData>? allItems,
    List<ItemData>? cartItems,
  }) {
    return ItemAppState(
      allItems: allItems ?? this.allItems,
      cartItems: cartItems ?? this.cartItems,
    );
  }
}
