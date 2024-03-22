import 'package:equatable/equatable.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auto_dispose_family_provider.g.dart';

class Counter extends Equatable {
  final int count;

  // Equatable
  const Counter({
    required this.count,
  });

  @override
  String toString() => 'Counter(count: $count)';

  // Equatable
  // equality operator, hashCode override
  @override
  List<Object> get props => [count];
}

final counterProvider = Provider.autoDispose.family<int, Counter>((ref, c) {
  ref.onDispose(() {
    print('[counterProvider($c)] disposed');
  });
  return c.count;
});

//<String, String: argument로 전달하는 데이터 타입>
// 파라미터로 positional argument로 하나만 추가할 수 있습니다.
// final autoDisposeFamilyHelloProvider = Provider.autoDispose.family<String, String>((ref, name) {
//   ref.onDispose(() {
//     print('[autoDisposeFamilyHelloProvider($name)] disposed');
//   });
//   return 'Hello $name';
// });

// 즉 파라미터를 달리하면 완전히 별도의 Provider가 생성이 됩니다.
// 즉 같은 파라미터에 대해서는 다시 Provider가 만들어지지 않았습니다.
// 그런데 familyProvider에는 한계가 있습니다.
// 파라미터로 positional argument하나만 추가할 수 있다는 점입니다.
// 만약 여러 개의 파라미터를 전달하고 싶으면 어떻게 해야할까요?
final autoDisposeFamilyHelloProvider = Provider.autoDispose.family<String, String>((ref, name) {
  ref.onDispose(() {
    print('[autoDisposeFamilyHelloProvider($name)] disposed');
  });
  return 'Hello $name';
});

@riverpod
String autoDisposeFamilyHello(AutoDisposeFamilyHelloRef ref, {required String there}) {
  ref.onDispose(() {
    print('[autoDisposeFamilyHelloProvider($there)] disposed');
  });
  return 'Hello $there';
}