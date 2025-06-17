

class Item{
  String id;
  String name;

  Item({required this.id, required this.name});

  Item copyWith({String? id , String? name}){
    return Item(id: id ?? this.id, name: name ?? this.name);
  }
}