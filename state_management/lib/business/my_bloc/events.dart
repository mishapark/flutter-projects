import 'package:equatable/equatable.dart';
import 'package:state_management/data/index.dart';

abstract class ItemEvent extends Equatable {}

class LoadAllItems extends ItemEvent {
  @override
  List<Object?> get props => [];
}

class LoadCartItems extends ItemEvent {
  @override
  List<Object?> get props => [];
}

class AddItemToCart extends ItemEvent {
  final ItemData item;

  AddItemToCart(this.item);

  @override
  List<Object?> get props => [];
}

class RemoveItemFromCart extends ItemEvent {
  final ItemData item;

  RemoveItemFromCart(this.item);

  @override
  List<Object?> get props => [];
}
