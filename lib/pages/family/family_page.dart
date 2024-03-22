import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'family_provider.dart';

class FamilyPage extends ConsumerWidget {
  const FamilyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // familyProvider를 사용하기 위해서는 추가적인 parameter를 전달해야합니다.
    // final helloJohn = ref.watch(familyHelloProvider('john'));
    // final helloJane = ref.watch(familyHelloProvider('jane'));

    // 그런데 family_page에서 에러가 발생했습니다. 왜냐하면 이제 named argument를 넘겨줘야하기 때문입니다.
    // named argument로 수정하겠습니다.
    // final helloJohn = ref.watch(familyHelloProvider(name: 'john'));
    // final helloJane = ref.watch(familyHelloProvider(name: 'jane'));

    // family page도 수정을 해야합니다. 이제 더이상 named argument가 아니기 때문에 name을 삭제하겠습니다.
    final helloJohn = ref.watch(familyHelloProvider('john'));
    final helloJane = ref.watch(familyHelloProvider('jane'));

    return Scaffold(
      appBar: AppBar(
        title: const Text('FamilyProvider'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              helloJohn,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 10),
            Text(
              helloJane,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ],
        ),
      ),
    );
  }
}