
import 'package:riverpod_2025/model/myitem.dart';

class FavouriteState {
  final List<MyItem> allItems;
  final List<MyItem> filterItems;
  final String search;

  FavouriteState({required this.allItems, required this.filterItems, required this.search});

  FavouriteState copyWith({
    List<MyItem>? allItems,
    List<MyItem>? filterItems,
    String? search
}){
    return FavouriteState(
        allItems: allItems ?? this.allItems,
        filterItems: filterItems ?? this.filterItems,
        search: search ?? this.search
    );
  }
}