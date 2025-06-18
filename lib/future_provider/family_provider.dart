


import 'package:flutter_riverpod/flutter_riverpod.dart';

final multiplierProvider = StateProvider.family<int, Map<String, dynamic>>((ref, number){
  return number['id'] * 10;
});