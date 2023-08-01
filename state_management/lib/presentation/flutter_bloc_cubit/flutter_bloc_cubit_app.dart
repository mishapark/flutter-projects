import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/business/flutter_bloc_cubit/state.dart';
import 'package:state_management/business/flutter_bloc_cubit/item_cubit.dart';
import 'package:state_management/presentation/components/item_card.dart';

class FlutterBlocCubitApp extends StatelessWidget {
  const FlutterBlocCubitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple State Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => ItemCubit()..loadItems(),
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
        child: BlocBuilder<ItemCubit, ItemState>(
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
                            onPressed: () => context
                                .read<ItemCubit>()
                                .removeItemFromCart(item),
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
        child: BlocBuilder<ItemCubit, ItemState>(
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
                          onTap: () =>
                              context.read<ItemCubit>().addItemToCart(item),
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
