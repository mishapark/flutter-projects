import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:state_management/data/index.dart';

@immutable
abstract class ItemState extends Equatable {}

class ItemLoadingState extends ItemState {
  @override
  List<Object?> get props => [];
}

class ItemLoadedState extends ItemState {
  final List<ItemData> items;
  final List<ItemData> cartItems;

  ItemLoadedState(this.items, this.cartItems);

  @override
  List<Object?> get props => [items, cartItems];
}

class ItemErrorState extends ItemState {
  final String error;

  ItemErrorState(this.error);
  @override
  List<Object?> get props => [error];
}
