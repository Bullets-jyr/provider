import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'basic_provider.dart';

class BasicPageConsumer extends StatelessWidget {
  const BasicPageConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider'),
      ),
      body: Center(
        // Consumer위젯은 WidgetRef를 위젯에서 사용할 수있게 해주는 것 외에
        // Performance optimization용도로 자주 사용됩니다.
        // 특정 위젯을 Consumer로 감싸면, Provider의 값이 변했을 때,
        // 감싸진 위젯만 rebuild가 됩니다.
        child: Consumer(
          // Widget? child: Provider값이 변경되더라도 rebuild되지 않을 위젯을 지정합니다.
          builder: (context, ref, child) {
            final hello = ref.watch(helloProvider);
            final world = ref.watch(worldProvider);

            return Text(
              '$hello $world',
              style: Theme.of(context).textTheme.headlineLarge,
            );
          },
        ),
      ),
    );
  }
}
