import 'dart:async';

import 'package:flutter/material.dart';
import 'package:forgor/repositories/database.dart';
import 'package:forgor/services/bullet_service.dart';
import 'package:forgor/util/text_editing_controller.dart';
import 'package:signals/signals_flutter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Forgor',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Forgor'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => bulletServiceRef().newNote(),
        child: Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Watch((context) {
          final notes = bulletServiceRef().allNotes.value;
          return notes.map(
            data: (notes) => Column(children: notes.map(Bullet.new).toList()),
            error: (error) => Text('$error'),
            loading: () => CircularProgressIndicator(),
          );
        }),
      ),
    );
  }
}

class Bullet extends StatefulWidget {
  final BulletNoteData initData;
  const Bullet(this.initData, {super.key});

  @override
  State<Bullet> createState() => _BulletState();
}

class _BulletState extends State<Bullet> {
  // TODO: Only insert the character when there's no text
  // https://stackoverflow.com/a/71803796/7115678
  late final controller = DebouncedTextEditingController(
    text: widget.initData.content,
    onDebouncedChange: _onChange,
  );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _onChange(String text) async {
    final bullet = widget.initData.copyWith(content: text);
    await bulletServiceRef().updateNote(bullet);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onSubmitted: (text) => print('enter pressed'),
      textInputAction: TextInputAction.newline,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(0),
        isDense: true,
        border: InputBorder.none,
        prefixIconConstraints: const BoxConstraints(),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Text(
            '•',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
