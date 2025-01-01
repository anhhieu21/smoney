import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'nav_provider.g.dart';

@riverpod
class NavNotifier extends _$NavNotifier {
  @override
  int build() {
    return 0;
  }

  void changeIndex(int index) {
    state = index;
  }
}
