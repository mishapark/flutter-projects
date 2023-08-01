import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:state_management/business/flutter_mobx/state.dart';
import 'package:state_management/presentation/components/item_card.dart';

class MobxApp extends StatelessWidget {
  const MobxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => AppState(),
      child: MaterialApp(
        title: 'Simple State Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final AppState state;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    state = Provider.of<AppState>(context);
    state.loadItems();
  }

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
        child: Observer(builder: (context) {
          if (state.isLoading) {
            return const CircularProgressIndicator();
          } else {
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
                            onPressed: () {
                              state.removeItemFromCart(item);
                            }),
                      ),
                    ),
                  )
                  .toList(),
            );
          }
        }),
      ),
      body: Center(
        child: Observer(builder: (context) {
          if (state.isLoading) {
            return const CircularProgressIndicator();
          } else {
            return ListView(
              children: state.items
                  .map(
                    (item) => ListTile(
                      title: ItemCard(
                        id: item.id,
                        title: item.title,
                        description: item.description,
                        image: item.image,
                        onTap: () {
                          state.addItemToCart(item);
                        },
                      ),
                    ),
                  )
                  .toList(),
            );
          }
        }),
      ),
    );
  }
}
