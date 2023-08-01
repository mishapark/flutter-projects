import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_management/business/flutter_riverpod/item_state_notifier.dart';
import 'package:state_management/presentation/components/item_card.dart';

class HooksApp extends StatelessWidget {
  const HooksApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
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

class MyHomePage extends HookConsumerWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(allItemsProvider);
    final itemsController = ref.watch(allItemsProvider.notifier);

    final allItems = items[ItemType.allItems]!;
    final cartItems = items[ItemType.cartItems]!;

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
        child: Consumer(
          builder: (context, ref, _) => ListView(
            children: cartItems
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
                        onPressed: () => itemsController.removeItem(item),
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
          children: allItems
              .map(
                (item) => ListTile(
                  title: ItemCard(
                    id: item.id,
                    title: item.title,
                    description: item.description,
                    image: item.image,
                    onTap: () {
                      itemsController.addItem(item);
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
