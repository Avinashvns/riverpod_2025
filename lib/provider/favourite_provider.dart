

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_2025/model/myitem.dart';
import 'package:riverpod_2025/provider/favourite_states.dart';

final favouriteProvider = StateNotifierProvider<FavouriteNotifier, FavouriteState>((ref){
  return FavouriteNotifier();
});

class FavouriteNotifier extends StateNotifier<FavouriteState>{
  FavouriteNotifier() : super(FavouriteState(allItems: [], filterItems: [], search: ''));

  void addMyItem(){
    List<MyItem> item = [
      MyItem(name: "MacBook" , favourite: true , id: 1),
      MyItem(name: "iPhone" , favourite: false , id: 2),
      MyItem(name: "G-force 3060" , favourite: false , id: 3),
      MyItem(name: "Samsung Ultra" , favourite: true , id: 4),
      MyItem(name: "Google Pixel 9" , favourite: false , id: 5),
      MyItem(name: "iPad Pro 13" , favourite: true , id: 6),
    ];
  state= state.copyWith(allItems: item.toList(), filterItems: item.toList());
  }

  void filterList(String search){
    state= state.copyWith(filterItems: _filterItems(state.allItems, search));
  }

  List<MyItem> _filterItems(List<MyItem> items, String search){
    if(search.isEmpty){
      return items;
    }
    return items.where((MyItem)=>MyItem.name.toLowerCase().contains(search.toLowerCase())).toList();
  }

  void favourite(String option){
    state= state.copyWith(filterItems: _favouriteItems(state.allItems, option));
  }
  List<MyItem> _favouriteItems(List<MyItem> items, String option){
    if(option == "All"){
      return items;
    }
    return items.where((MyItem)=>MyItem.favourite == true).toList();
  }

}