import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_2025/slider_provider.dart';


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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Consumer(
            builder: (context , ref, child){
              print("showPassword");
              final slider = ref.watch(sliderProvider.select((state)=>state.showPassword));
              return InkWell(
                onTap: (){
                  final stateProvider = ref.read(sliderProvider.notifier);
                  stateProvider.state = stateProvider.state.copyWith(showPassword: !slider);
                },
                child: Container(
                  height: 200,
                  width: 200,
                  child: slider ? Icon(Icons.remove_red_eye) : Icon(Icons.image),
                ),
              );
            },

          ),

          Consumer(
            builder: (context , ref, child){
              print("sliders");
              final slider = ref.watch(sliderProvider.select((state)=>state.slider));
              return Container(
                height: 200,
                width: 200,
                color: Colors.red.withOpacity(slider),
              );
            },

          ),
          Consumer(
            builder: (context , ref, child){
              final slider = ref.watch(sliderProvider.select((state)=>state.slider));
              return Slider(value: slider, onChanged: (value){
                final stateProvider = ref.read(sliderProvider.notifier);
                stateProvider.state = stateProvider.state.copyWith(slider: value);
              },);
            },

          ),

        ],
      ),
    );
  }
}
