// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppState on _AppState, Store {
  late final _$itemsAtom = Atom(name: '_AppState.items', context: context);

  @override
  List<ItemData> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(List<ItemData> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  late final _$cartItemsAtom =
      Atom(name: '_AppState.cartItems', context: context);

  @override
  List<ItemData> get cartItems {
    _$cartItemsAtom.reportRead();
    return super.cartItems;
  }

  @override
  set cartItems(List<ItemData> value) {
    _$cartItemsAtom.reportWrite(value, super.cartItems, () {
      super.cartItems = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_AppState.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$loadItemsAsyncAction =
      AsyncAction('_AppState.loadItems', context: context);

  @override
  Future<dynamic> loadItems() {
    return _$loadItemsAsyncAction.run(() => super.loadItems());
  }

  late final _$addItemToCartAsyncAction =
      AsyncAction('_AppState.addItemToCart', context: context);

  @override
  Future<dynamic> addItemToCart(ItemData item) {
    return _$addItemToCartAsyncAction.run(() => super.addItemToCart(item));
  }

  late final _$removeItemFromCartAsyncAction =
      AsyncAction('_AppState.removeItemFromCart', context: context);

  @override
  Future<dynamic> removeItemFromCart(ItemData item) {
    return _$removeItemFromCartAsyncAction
        .run(() => super.removeItemFromCart(item));
  }

  @override
  String toString() {
    return '''
items: ${items},
cartItems: ${cartItems},
isLoading: ${isLoading}
    ''';
  }
}
