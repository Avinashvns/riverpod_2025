import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_2025/item_provider.dart';
import 'package:riverpod_2025/provider/favourite_provider.dart';
import 'package:riverpod_2025/search_provider.dart';
import 'package:riverpod_2025/slider_provider.dart';

// create a State Provider because change the state
final counter = StateProvider<int>((ref) {
  return 0;
});

final myswitch = StateProvider<bool>((ref) {
  return false;
});

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favouriteList = ref.watch(favouriteProvider);
    print("build");
    return Scaffold(
      appBar: AppBar(title: const Text("Counter App"),
      actions: [
        PopupMenuButton<String>(
          onSelected: (value){
            ref.read(favouriteProvider.notifier).favourite(value);
          },
            itemBuilder: (BuildContext context){
            return const [
              PopupMenuItem(child: Text("All"), value: 'All',),
              PopupMenuItem(child: Text("Favourite"), value: 'Favourite',),
            ];
            }
        )
      ],),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(favouriteProvider.notifier).addMyItem();
        },
        child: const Icon(Icons.add),
      ),
      body:
          Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  border: OutlineInputBorder()
                ),
                onChanged: (value){
                  ref.read(favouriteProvider.notifier).filterList(value);
                },
              ),
              Expanded(child: ListView.builder(
                itemCount: favouriteList.filterItems.length,
                  itemBuilder: (context, index){
                    final item = favouriteList.filterItems[index];
                    return ListTile(
                      title: Text(item.name),
                      trailing: Icon(item.favourite ? Icons.favorite : Icons.favorite_border),
                    );
                  }
              ))
            ],
          ),
    );
  }
}
