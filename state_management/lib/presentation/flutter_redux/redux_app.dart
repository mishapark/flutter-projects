import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:state_management/business/flutter_redux/middleware.dart';
import 'package:state_management/business/flutter_redux/reducer.dart';
import 'package:state_management/business/flutter_redux/state.dart';
import 'package:state_management/business/flutter_redux/view_model.dart';

import '../components/item_card.dart';

class ReduxApp extends StatelessWidget {
  final store = Store<ItemAppState>(
    itemsReducer,
    initialState: ItemAppState.initial(),
    middleware: [thunkMiddleware],
  );

  ReduxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'Simple State Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Simple State App'),
        actions: [
          IconButton(
              onPressed: () => _scaffoldKey.currentState!.openEndDrawer(),
              icon: const Icon(Icons.shopping_cart))
        ],
      ),
      endDrawer: Drawer(
        child: StoreConnector<ItemAppState, ViewModel>(
          converter: ViewModel.fromStore,
          builder: (context, vm) => ListView(
            children: vm.state.cartItems
                .map(
                  (item) => Card(
                    child: ListTile(
                      leading: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 80),
                        child: Image.asset(item.image),
                      ),
                      title: Text(item.title),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          vm.onRemove(item);
                        },
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
      body: Center(
        child: StoreConnector<ItemAppState, ViewModel>(
          onInit: (store) => store.dispatch(fetchItems),
          converter: ViewModel.fromStore,
          builder: (context, vm) => ListView(
            children: vm.state.allItems
                .map(
                  (item) => ListTile(
                    title: ItemCard(
                      id: item.id,
                      title: item.title,
                      description: item.description,
                      image: item.image,
                      onTap: () {
                        vm.onAdd(item);
                      },
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
