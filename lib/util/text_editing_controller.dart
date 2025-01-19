import 'dart:async';
import 'package:flutter/widgets.dart';

const String zeroWidthSpace = '\u200d';

String trimZeroWidthSpace(String text) {
  if (text.startsWith(zeroWidthSpace)) {
    return text.substring(1);
  }
  return text;
}

enum TextState {
  empty,
  hasText,
  hasZws;

  factory TextState.from(String text) {
    if (text.isEmpty) {
      return TextState.empty;
    }
    if (text == zeroWidthSpace) {
      return TextState.hasZws;
    }
    return TextState.hasText;
  }
}

class DebouncedTextEditingController extends TextEditingController {
  final Duration debounceDuration;
  final void Function(String) onDebouncedChange;
  final void Function()? onBackspaceWhileEmpty;
  Timer? _debounceTimer;

  TextState contentState;

  DebouncedTextEditingController({
    this.debounceDuration = const Duration(milliseconds: 700),
    required this.onDebouncedChange,
    this.onBackspaceWhileEmpty,
    String text = '',
  })  : contentState = text.isEmpty ? TextState.hasZws : TextState.hasText,
        super(text: text.isEmpty ? zeroWidthSpace : text) {
    addListener(_onTextChanged);
  }

  void _onTextChanged() {
    _computeTextState();

    if (_debounceTimer?.isActive ?? false) {
      _debounceTimer?.cancel();
    }
    _debounceTimer = Timer(debounceDuration, () {
      onDebouncedChange(trimZeroWidthSpace(text));
    });
  }

  /// Handles state transition based on the current text value.
  /// On devices with only an onscreen keyboard, the backspace key
  /// will not trigger a text change event when the textfield is empty
  /// (refer [1]). Therefore we insert a zero width space character
  /// into the textfield when it becomes empty so that the next
  /// backspace event can be considered as hitting backspace on an
  /// empty textfield.
  ///This functionality is relied upon to for eg. to delete a bullet
  /// point when the user hits backspace on an empty bullet.
  ///
  ///
  /// []: https://github.com/flutter/flutter/issues/50587
  void _computeTextState() {
    final currentTextState = TextState.from(text);
    final previousTextState = contentState;

    switch ((previousTextState, currentTextState)) {
      case (TextState.hasText, TextState.empty):
        text = zeroWidthSpace;
        contentState = TextState.hasZws;
      case (TextState.hasZws, TextState.empty):
        // Pressed backspace on empty textbox
        text = zeroWidthSpace;
        contentState = TextState.hasZws;
        onBackspaceWhileEmpty?.call();
      case (TextState.hasZws, TextState.hasText):
        text = trimZeroWidthSpace(text);
        contentState = TextState.hasText;
      case (TextState.empty, _):
        assert(
          false,
          "invalid state transition for text state: "
          "previous text should never be empty, it should at least"
          "have a zero width space character",
        );
        contentState = currentTextState;
      default:
        contentState = currentTextState;
    }
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    super.dispose();
  }
}
