// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auto_dispose_provider.g.dart';

// final autoDisposeHelloProvider = Provider.autoDispose<String>((ref) {
//   print('[autoDisposeHelloProvider] created');
//   ref.onDispose(() {
//     print('[autoDisposeHelloProvider] disposed');
//   });
//   return 'Hello';
// });

@riverpod
String autoDisposeHello(AutoDisposeHelloRef ref) {
  print('[autoDisposeHelloProvider] created');
  ref.onDispose(() {
    print('[autoDisposeHelloProvider] disposed');
  });
  return 'Hello';
}

// 이번에는 대문자 R이 아닌 소문자 r로 어노테이션되었습니다.
// 소문자 riverpod와 capitallized된 riverpod의 차이점은 뭘까요?
// riverpod에는 다음과 같이 정의되어 있습니다.
// 소문자 riverpod는 argument가 없는 대문자 Riverpod의 인스턴스입니다.
// 그런데 riverpod construcor는 다음과 같이 정의가 되어있습니다.
// 즉, R이 소문자인 riverpod는 keepAlive가 false고, dependencies가 null인 default constructor와 동일합니다.
// 즉, 더 이상 앱에서 필요치 않을 경우, dispose가 되고, 이 provider가 의존하는 다른 provider가 없다는 의미입니다.
// 이 dependencies에 대해서는 뒤에서 다시 말씀드릴 예정입니다.

// return 타입으로는 String을 function 이름으로는 autoDisposeHello를 그리고 ref는 AutoDisposeHelloRef로 수정하고
// 수동으로 만들었던 autoDisposeHelloProvider에 function body를 copy한 후 기존 autoDisposeHelloProvider는 comment 처리하겠습니다.
// 그리고 flutter_riverpod import를 comment 처리하겠습니다.