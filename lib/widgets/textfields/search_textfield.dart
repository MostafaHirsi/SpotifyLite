import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_lite/blocs/authentication/authentication_bloc.dart';
import 'package:spotify_lite/blocs/search/search_bloc.dart';

class SearchTextField extends StatefulWidget {
  final void Function(String) onSubmit;
  const SearchTextField({super.key, required this.onSubmit});

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  late FocusNode _focusNode;
  final ValueNotifier<bool> _focusNotifier = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();

    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    _focusNotifier.dispose();

    super.dispose();
  }

  void _onFocusChange() {
    _focusNotifier.value = _focusNode.hasFocus;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ValueListenableBuilder(
        valueListenable: _focusNotifier,
        builder: (_, isFocus, child) {
          return TextField(
            focusNode: _focusNode,
            onSubmitted: widget.onSubmit,
            style: TextStyle(
              color: !isFocus ? const Color(0xFF191414) : Colors.white,
            ),
            decoration: InputDecoration(
              hintText: "What are you looking for?",
              hintStyle: TextStyle(
                color: !isFocus ? const Color(0xFF191414) : Colors.white,
                fontWeight: FontWeight.w500,
              ),
              prefixIcon: Icon(
                Icons.search_rounded,
                color: !isFocus ? const Color(0xFF191414) : Colors.white,
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    6,
                  ),
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    6,
                  ),
                ),
              ),
              fillColor: isFocus ? const Color(0xFF242424) : Colors.white,
              filled: true,
            ),
          );
        },
      ),
    );
  }
}
