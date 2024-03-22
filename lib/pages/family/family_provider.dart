// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'family_provider.g.dart';

// 저는 이 상태에서 Hello john과 Hello jane을 return하는 Provider를 만들고
// 싶습니다. 가장 쉬운 방법은 완전히 새로운 Provider를 2개 만드는 방법이 되겠습니다.
// 그런데 이렇게 하는 방법은 유사한 Provider만 많아지는 별로 바람직한 방법이
// 아닌거 같습니다. Riverpod에서는 이러한 경우에 대비해 family modifer를
// 제공합니다. family modifer를 이용하면 Provider를 만들 때, 추가적인 argument를
// 전달할 수 있습니다.
// fmaily modifer를 적용하기 위해서는 Provider뒤에 .family를 입력하고,
// argument로 전달하는 data 타입을 추가로 명시해야합니다.
// 그리고 Provider의 콜백에서도 ref외에 argument를 명시해야합니다.

// 그러면 이런 의문을 가질 수 있습니다.
// dispose되지도 않는 Provider에 onDispose함수가 왜 있는가?
// Provider가 dispose되는 경우의 수는 여러가지가 있습니다.
// 페이지를 빠져나가는 것과 같이 특정 Provider를 필요로하는
// 위젯이 없어지는 경우일 수도 있습니다.
// 그런데 autoDispose를 사용하지 않으면 필요로 하는 페이지가 없어져도
// Provider가 dispose되지 않습니다.
// 그런데 ref.invalidate 또는 ref.refresh라는 메서드가 있는데
// 이런 메소드들은 Provider를 강제로 dispose 시킵니다.
// 그렇기 때문에 autoDispose Provider가 아니라 하더라도
// onDispose 메서드는 필요합니다.
// Provider의 기본동작방식에 영향을 미치는 autoDispose modifier와
// family modifier에 대해 알아봤습니다. 그런데 당연하게도
// autoDispose와 family modifier는 함께 사용할 수 있습니다.
final familyHelloProvider = Provider.family<String, String>((ref, name) {
  ref.onDispose(() {
    print('[familyHelloProvider($name)] disposed');
  });
  return 'Hello $name';
});

@Riverpod(keepAlive: true)
// String familyHello(FamilyHelloRef ref, {required String name}) {
// String familyHello(FamilyHelloRef ref, String name) {
String familyHello(FamilyHelloRef ref, String name) {
  ref.onDispose(() {
    print('[familyHelloProvider($name)] disposed');
  });
  return 'Hello $name';
}

// 마찬가지로 riverpod annotation을 import하고
// riverpod part를 이용해 part directive를 만들겠습니다.
// 이유는 추가적인 argument만 주면 자동적으로 family Provider를
// generate해주기 때문입니다. 지금의 familyHello Provider는
// dispose되지 않는 Provider 입니다.
// 그렇기 때문에 riverpod keepAlive를 선택하겠습니다.
// return 타입으로는 String을 이름으로는 familyHello를 주고
// ref는 FamilyHelloRef로 수정한 후 추가 argument를 주겠습니다.
// 아까 generate를 이용할 경우, named parameter를 사용할 수도 있다고 했습니다.
// 이번에는 named parameter를 사용해보겠습니다.
// ref argument 다음에 컬리브레이스를 만든 후
// String 타입의 required named parameter name을 추가하겠습니다.
// 다음으로 기존에 만들었던 Provider의 body를 copy한 후
// 붙여넣기 하고 기존 Provider는 comment 처리하고
// flutter_riverpod import는 commemt처리하겠습니다.
// watch command 덕택에 build_runner가 자동으로 실행되었습니다.

// ... 그런데

// 그랬더니 에러가 표시되어있습니다. 그럼에도 불구하고
// 화면에는 정상적으로 결과가 표시된 걸 보니 fatal error가 아닌거 같습니다.
// 에러는 duplicated named argument 'name' 이라고 되어있습니다.
// 에러가 발생한 파일이 family_provider.g.dart 입니다. 클릭해보겠습니다.

// name argument의 value로 name이 assgin되어있습니다.
// 그런데 위에보니까 name이라는 argument가 또 있습니다.
// 그러니까 duplicated된 named argument가 주어졌네요.
// 그러면 혹시 name을 named argument로 주지 않고,
// unnamed argument로 주면 어떨까요?
// named argument name을 unnamed argument name으로 수정하고 테스트 해보겠습니다.

// 여전히 동일한 error가 발생했습니다.
// famliy_provier.g.dart를 다시 열어 보겠습니다.
// 우리는 unnamed argument를 줬지만 generator된 코드에서는
// named argument로 변환해서 사용하고 있네요
// riverpod generate를 사용해서 family provider를 만들 때는
// argumnet이름이 name인 argument를 사용하지 마시기 바랍니다.
// argument의 이름을 name에서 there로 수정하고 function body에 있는 name도
// 다 there로 수정하겠습니다.

// family_provier.g.dart를 다시 열어 보겠습니다.
// 우리가 there를 unnamed argumnet로 줬는데
// generate된 파일에는 there가 named argument로 변환되어있습니다.
