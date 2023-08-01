import 'package:redux/redux.dart';
import 'package:state_management/business/flutter_redux/actions.dart';
import 'package:state_management/business/flutter_redux/state.dart';

class ViewModel {
  final ItemAppState state;
  final Function onAdd;
  final Function onRemove;

  ViewModel({
    required this.state,
    required this.onAdd,
    required this.onRemove,
  });

  static ViewModel fromStore(Store<ItemAppState> store) => ViewModel(
        state: store.state,
        onAdd: (item) => store.dispatch(AddItemToCartAction(item)),
        onRemove: (item) => store.dispatch(RemoveItemFromCartAction(item)),
      );
}
