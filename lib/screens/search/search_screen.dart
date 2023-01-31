import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:spotify_lite/widgets/textfields/search_textfield.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 14,
        ),
        child: Column(
          children: const [SearchTextField()],
        ),
      ),
    );
  }
}
