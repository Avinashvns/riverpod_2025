class MyItem {
  final String name ;
  final int id;
  final bool favourite ;

  MyItem({required this.name, required this.id, required this.favourite});

  MyItem copyWith({
    String? name,
    int? id,
    bool? favourite
}){
    return MyItem(
        name: name ?? this.name,
        id: id ?? this.id,
        favourite: favourite ?? this.favourite
    );
  }
}