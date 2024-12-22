import 'package:flutter_riverpod/flutter_riverpod.dart';

final navProvider = NotifierProvider<NavProvider, int>(NavProvider.new);

class NavProvider extends Notifier<int> {
  @override
  int build() {
    return 0;
  }

  void changeIndex(int index) {
    state = index;
  }
}
