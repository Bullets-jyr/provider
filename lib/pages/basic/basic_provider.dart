// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// dart run build_runner build --delete-conflicting-output
// dart run build_runner build -d (축약형)
// dart run build_runner watch -d
part 'basic_provider.g.dart';

// final helloProvider = Provider<String>((ref) {
//   ref.onDispose(() {
//     print('[helloProvider] disposed');
//   });
//   return 'Hello';
// });

// final worldProvider = Provider<String>((ref) {
//   ref.onDispose(() {
//     print('[worldProvider] disposed');
//   });
//   return 'World';
// });

// code generation으로 Provider를 만들경우, 기본이 autodispose 입니다.
// dispose되지 않는 Provider를 만들기 위해서는 @Riverpod(keepAlive: true)를 사용해야합니다.
@Riverpod(keepAlive: true)
String hello(HelloRef ref) {
  ref.onDispose(() {
    print('[helloProvider] disposed');
  });
  return 'Hello';
}

@Riverpod(keepAlive: true)
String world(WorldRef ref) {
  ref.onDispose(() {
    print('[worldProvider] disposed');
  });
  return 'World';
}