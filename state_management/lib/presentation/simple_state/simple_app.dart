import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/business/simple_state/item_change_notifier.dart';
import 'package:state_management/presentation/components/item_card.dart';

class SimpleApp extends StatelessWidget {
  const SimpleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CartAppState(),
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
        child: Consumer<CartAppState>(
          builder: (context, value, child) => ListView(
            children: value.cartItems
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
                        onPressed: () =>
                            context.read<CartAppState>().removeItem(item),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
      body: Center(
        child: ListView(
          children: context
              .watch<CartAppState>()
              .allItems
              .map(
                (item) => ListTile(
                  title: ItemCard(
                    id: item.id,
                    title: item.title,
                    description: item.description,
                    image: item.image,
                    onTap: () {
                      context.read<CartAppState>().addItem(item);
                    },
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
