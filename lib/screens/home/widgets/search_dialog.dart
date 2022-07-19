import 'package:flutter/material.dart';

class SearchDialog extends StatelessWidget {
  SearchDialog({required this.currentSearch, Key? key}) : textController = TextEditingController(
    text: currentSearch,
    ), super(key: key);

  final String currentSearch;
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget> [
        Positioned(
          top: 2,
          left: 2,
          right: 2,
          child: Card(
            child: TextField(
              controller: textController,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 15),
                border: InputBorder.none,
                prefixIcon: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.arrow_back),
                ),
                suffixIcon: IconButton(
                  onPressed: () => textController.clear(),
                  icon: const Icon(Icons.close),
                )
              ),
              textInputAction: TextInputAction.search,
              autofocus: true,
              onSubmitted: (value) {
                Navigator.of(context).pop(value);
              },
            ),
          ),
        ),
      ],
    );
  }
}