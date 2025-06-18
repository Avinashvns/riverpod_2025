


import 'package:flutter_riverpod/flutter_riverpod.dart';

final multiplierProvider = StateProvider.family<int, int>((ref, number){
  return number * 2;
});