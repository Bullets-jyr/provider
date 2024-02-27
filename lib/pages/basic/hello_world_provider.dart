import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hello_world_provider.g.dart';

// ProviderRef<String> ref
// Type: ProviderRef<String>
final helloWorldProvider = Provider<String>((ref) {
  return 'HelloWorld';
});

@Riverpod(keepAlive: true)
String helloWorld(HelloWorldRef ref) {
  return 'HelloWorld';
}