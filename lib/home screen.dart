import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// create a State Provider because change the state
final counter = StateProvider<int>((ref){
  return 0;
});

final myswitch = StateProvider<bool>((ref){
  return false;
});

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context , WidgetRef ref) {

    print("build");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter App"),
      ),
      body: Column(
        children: [

          Consumer(builder: (context , ref , child){
            print("build 2");
            final count = ref.watch(counter);
            return Center(
              child: Text(count.toString() , style: TextStyle(fontSize: 30, color: Colors.red),),
            );
          }),

          Consumer(builder: (context , ref , child){
            print("build 3 switch");
            final count = ref.watch(myswitch);
            return Switch(value: count, onChanged: (value){
              ref.read(myswitch.notifier).state = value;
            });
          }),

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
