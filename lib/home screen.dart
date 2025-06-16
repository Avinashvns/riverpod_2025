import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// create a State Provider because change the state
final counter = StateProvider<int>((ref){
  return 0;
});

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context , WidgetRef ref) {
    final count = ref.watch(counter);
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter App"),
      ),
      body: Column(
        children: [
          Center(
            child: Text(count.toString() , style: TextStyle(fontSize: 30, color: Colors.red),),
          ),
          Row(
            children: [
              ElevatedButton(onPressed: (){
                ref.read(counter.notifier).state++;
              }, child: Text("+", style: TextStyle(fontSize: 30, color: Colors.red),)),
              SizedBox(width: 10,),
              ElevatedButton(onPressed: (){
                ref.read(counter.notifier).state--;
              }, child: Text("-", style: TextStyle(fontSize: 30, color: Colors.green),))
            ],
          )
        ],
      ),
    );
  }
}
