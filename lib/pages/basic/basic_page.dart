import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'basic_provider.dart';

// ConsumerStatefulWidget == StatefulWidget
// 위젯에서 다뤄야 할 state나 변수가 있을 때, StatefulWidget을 사용하는 것 처럼
// 핸들링해야 할 state나 변수가 있을 경우, ConsumerStatefulWidget을 사용합니다.
class BasicPage extends ConsumerStatefulWidget {
  const BasicPage({super.key});

  @override
  ConsumerState<BasicPage> createState() => _BasicPageState();
}

class _BasicPageState extends ConsumerState<BasicPage> {
  // ConsumerStatefulWidget에서는 ref는 state object의 property이기 때문입니다.
  @override
  Widget build(BuildContext context) {
    final hello = ref.watch(helloProvider);
    final world = ref.watch(worldProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider'),
      ),
      body: Center(
        child: Text(
          '$hello $world',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}
