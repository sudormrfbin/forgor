import 'dart:async';
import 'package:flutter/widgets.dart';

class DebouncedTextEditingController extends TextEditingController {
  final Duration debounceDuration;
  final void Function(String) onDebouncedChange;
  Timer? _debounceTimer;

  DebouncedTextEditingController({
    this.debounceDuration = const Duration(milliseconds: 700),
    required this.onDebouncedChange,
    super.text,
  }) {
    addListener(_onTextChanged);
  }

  void _onTextChanged() {
    if (_debounceTimer?.isActive ?? false) {
      _debounceTimer?.cancel();
    }
    _debounceTimer = Timer(debounceDuration, () {
      onDebouncedChange(text);
    });
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    super.dispose();
  }
}
