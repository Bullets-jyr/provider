import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'basic_provider.dart';

// ConsumerWidget == StatelessWidget
class BasicPageConsumerWidget extends ConsumerWidget {
  const BasicPageConsumerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hello = ref.watch(helloProvider);
    final world = ref.watch(worldProvider);

    // 위젯이 커질 경우, 작은 위젯으로 리팩토링하면 rebuild 범위를 줄일 수 있습니다.
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
