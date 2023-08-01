import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/business/flutter_bloc/item_bloc.dart';
import 'package:state_management/business/flutter_bloc/events.dart';
import 'package:state_management/business/flutter_bloc/state.dart';
import 'package:state_management/presentation/components/item_card.dart';

class FlutterBlocApp extends StatelessWidget {
  const FlutterBlocApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple State Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => ItemBloc()..add(LoadAllItems()),
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  MyHomePage({super.key});

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
        child: BlocBuilder<ItemBloc, ItemState>(
          builder: (context, state) {
            if (state is ItemLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ItemErrorState) {
              return const Center(child: Text("Error"));
            }
            if (state is ItemLoadedState) {
              return ListView(
                children: state.cartItems
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
                            onPressed: () => context.read<ItemBloc>().add(
                                  RemoveItemFromCart(item),
                                ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              );
            }
            return Container();
          },
        ),
      ),
      body: Center(
        child: BlocBuilder<ItemBloc, ItemState>(
          builder: (context, state) {
            if (state is ItemLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ItemErrorState) {
              return const Center(child: Text("Error"));
            }
            if (state is ItemLoadedState) {
              return ListView(
                children: state.items
                    .map(
                      (item) => ListTile(
                        title: ItemCard(
                          id: item.id,
                          title: item.title,
                          description: item.description,
                          image: item.image,
                          onTap: () => context.read<ItemBloc>().add(
                                AddItemToCart(item),
                              ),
                        ),
                      ),
                    )
                    .toList(),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
