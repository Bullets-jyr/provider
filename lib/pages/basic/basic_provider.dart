// 먼저 basic_provider.dart파일 내에 flutter_riverpod패키지를 import하겠습니다.
// dispose는 저절로 되는 것이 아니고 Provider를 사용하는 사용자가 의사를
// 표시해야한 dispose됩니다.

// 이렇게 했더니 flutter_riverpod package Import에 warning이 발생했습니다.
// 내용을 보겠습니다. Unused import warning이 발생했습니다.
// flutter_riverpod package import를 comment 처리하겠습니다.
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// 이제 Provider를 generate하기위한 code template를 다 만들었으니,
// build_runner를 실행시켜 code를 generate하겠습니다.
// command line에서 dart run build_runner build를 실행시키면
// code가 generate됩니다.
// 옵션으로는 --delete-conflicting-outputs라는 옵션을 추가하겠습니다.
// dart run build_runner build --delete-conflicting-outputs
// dart run build_runner build -d (축약형)
// 이 옵션은 build_runner에게 이전 build에서 만들어진 output과
// 이번 build에서 만들어질 output사이에 충돌이 발생하면
// 사용자에게 확인하는 과정을 거치지말고 build를 하라는 옵션입니다.
// 처음으로 code generation할 경우에는 보통 시간이 좀 소요됩니다.
part 'basic_provider.g.dart';

final helloProvider = Provider<String>((ref) {
  ref.onDispose(() {
    print('[helloProvider] disposed');
  });
  return 'Hello';
});

// final worldProvider = Provider<String>((ref) {
//   ref.onDispose(() {
//     print('[worldProvider] disposed');
//   });
//   return 'World';
// });

// 우선 riverpod_annotation import하고,
// generate된 코드가 저장될 파일을 part directive를 이용해서 지정해야합니다.
// 방금 말씀드린 part directive는
// part이후에 파일이름 닷 g 닷 다트형태를 가지는데
// riverpod part code snippets generator를 이용해서 손쉽게 만들 수 있습니다.

// code generation으로 Provider를 만들경우, 기본이 autodispose 입니다.
// 그런데 basic_proider.dart에서 우리가 만들었던 Provider는 dispose되지 않는 Provider였습니다.
// dispose되지 않는 Provider를 만들기 위해서는... (@Riverpod(keepAlive: true)를 사용해야합니다.)
// 여기서 @Riverpod는 riverpod generator에게 해당 코드는 provider 코드를 generator하도록
// annotation된 코드라는 걸 알려주는 역할을 합니다.
// 다음으로 괄호안에는 provider 코드를 generate할 때, 적용할 옵션들을 표시합니다.
@Riverpod(keepAlive: true)
// keepAlive: true 옵션은 riverpod generator에게 Provider를 generate할 때,
// autodispose modifier를 적용하지 말라는 옵션입니다.
// default는 false 입니다. 그러니까 default로는 Provider가 더 이상
// 필요없어지면 즉, 더 이상 listen할 위젯이나 Provider가 없으면 dispose된다는 의미입니다.
// 다음으로 function의 return 타입을 주겠습니다.
// 이전에 수동으로 Provider를 만들 때, 타입으로 String을 주었습니다.
// return 타입으로 String을 주겠습니다.
// 다음으로 function name을 주겠습니다.
// function 이름으로는 hello를 주겠습니다.
// function 이름으로 hello를 주면 generate된 Provider는
// helloProvider라는 이름을 가지게 됩니다.
// 다음으로 ref를 HelloRef로 수정하겠습니다.
// code generation을 사용할 경우, ref argument의 타입은
// capitalized된 function이름을 ref앞에 붙인 타입이 됩니다.
// 즉, 대문자 H, HelloRef가 ref argumnet의 타입이 됩니다.
String hello(HelloRef ref) {
  // 다음으로 comment 처리했던, helloProvider의 function body를 copy한 후 붙여넣기 하겠습니다.
  // world Provider도 동일하게 만들 수 있습니다.
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

// 이렇게해서 기본 Provider와 modifier에 대해 알아봤습니다.
// 벌써 이것만해도 개발자가 제어할 수 있는 범위가 Provider package에 비해
// 크게 늘었습니다. 동일한 타입을 가지는 Provider를 제약없이 만들 수 있고
// 필요없어진 Provider를 쉽게 dispose할 수 있게 되었습니다.
// 또한 family modifier를 사용하면 function을 이용해 코드를 재사용하는 것처럼
// Provider를 쉽게 재활용할 수 있습니다.
// 그런데 몇개 Provider를 만들어보면서 비슷한 코드가 반복된다는 걸 느끼셨을
// 겁니다. 이 반복된 코드를 쉽게 만들 수 있도록 code snippet을 제공해주는
// riverpod vscode extension이 있습니다. 또 최근 Riverpod의 저자인 Remi는
// riverpod_generator라는 Provider코드를 generate해주는 패키지를 만들어서
// 사용할 것을 권장하고 있습니다. rivepod vscode extension은
// riverpod generator용 코드 snippet도 제공합니다.

// ===

// 이제 Provider를 generator하기 위한 code template를 다 만들었으니,
// build_runner를 실행시켜 code를 generator하겠습니다.
// command line에서 dart run build_runner build를 실행시키면 code가 generate됩니다.

// 처음으로 code generation을 할 경우에는 보통 시간이 좀 소요됩니다.
// 정상적으로 code가 build되었습니다.

// file explorer에 보면 basic_provider.g.dart 파일이 생성된 걸 볼 수 있습니다.

// 비교
// 여기서 수동으로 만드는 방식과 code generation방식을 잠시 비교해보겠습니다.

// 수동방식에서는 helloProvider라는 final 변수에 Provider instance를 저장했습니다.
// 반면 code generation 방식에서는 function 이름으로 hello를 주었습니다.
// riverpod generator는 이 function 이름 hello를 이용해서
// helloProvider 변수를 만들어줍니다.

// 다음으로 수동방식에서는 사용하는 Provider의 종류를 명시했는데,
// code generation 방식에서는 사용하는 Provider의 종류를 지정하는 code가 없습니다.
// code generation 방식에서는 return value를 이용해서
// 사용하는 Provider의 종류를 riverpod generator가 지정해줍니다.

// 다음으로 수동방식에서는 state 타입을 제네릭을 이용해서 지정했었는데
// code generation 방식에서는 annotate된 function의 return타입으로
// state 타입을 지정합니다.

// 다음으로 ref argumnet의 타입을 알아볼 차례인데
// 수동방식의 ref argument의 타입은 String타입의 ProviderRef 타입입니다.
// 그런데 code generation 방식에서는 ref의 타입이 HelloRef입니다.

// HelloRef가 뭔지 알아보기 위해서 basic_provider.g.dart파일을 열어보겠습니다.
// 맨 위에 보니 // GENERATED CODE - DO NOT MODIFY BY HAND라고 되어있습니다.
// 이 파일은 edit할 목적으로 만들어진 파일이 아니니 수정하지 마시기 바랍니다.
// 파일을 아래로 스크롤하니 helloProvider라는 final 변수가 보이네요
// 그리고 그 밑에 HelloRef typedef가 있는데 보니까 String타입의 ProviderRef를
// typedef한 것임을 알 수 있습니다. 수동방식과 동일한 ref argument 입니다.

// 그런데 generator를 이용해서 만들어야할 Provider가 많거나 할 경우
// 매번 command line에서 명령을 실행시키기가 번거롭습니다.
// 이럴 경우를 대비해서 변화를 watch해서 변화가 있을 때,
// 자동적으로 build runner가 실행되게 할 수 있습니다.
// dart run build_runner build -d 대신에
// dart run build_runner build watch -d를 실행시키면 됩니다.