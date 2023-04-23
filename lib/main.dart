import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pickProvider = StateProvider<String>((ref) => 'rock');
final resultProvider = StateProvider<String>((ref) => 'draw');

void main() {
  runApp(
    // For widgets to be able to read providers, we need to wrap the entire
    // application in a "ProviderScope" widget.
    // This is where the state of our providers will be stored.
    ProviderScope(
      child: MyApp(),
    ),
  );
}

// Extend ConsumerWidget instead of StatelessWidget, which is exposed by Riverpod
class MyApp extends ConsumerWidget {
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String pick = ref.watch(pickProvider);
    final String result = ref.watch(resultProvider);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Riverpod Example')),
        body: Column(children: <Widget>[
          ElevatedButton(
           child: Text('Change the choice to scissors'),
           onPressed: () => ref.read(pickProvider.notifier).state = 'scissors' ,
          ),
          Text(style: TextStyle(fontSize: 20), pick),
          Text(style: TextStyle(fontSize: 20), result)
        ]),
      ),
    );
  }
}
