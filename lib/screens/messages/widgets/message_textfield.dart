import 'package:flutter/material.dart';

import '../../../stores/message_store.dart';

class MessageTextField extends StatefulWidget {
  const MessageTextField({required this.controller, Key? key}) : super(key: key);

  final MessageStore controller;

  @override
  State<MessageTextField> createState() => _MessageTextFieldState();
}

class _MessageTextFieldState extends State<MessageTextField> {

  late MessageStore controller;
  final TextEditingController textController = TextEditingController();
  bool isComposing = false;

  @override
  void initState() {
    controller = widget.controller;
    super.initState();
  }

  void reset() {
    textController.clear();
    setState(() {
      isComposing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Theme.of(context).primaryColor),
          borderRadius: BorderRadius.circular(4.0)
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
          child: Row(
            children: <Widget> [
              Expanded(
                flex: 8,
                child: TextField(
                  controller: textController,
                  maxLines: null,
                  decoration: const InputDecoration.collapsed(
                    hintText: 'Digite uma mensagem...'
                  ),
                  onChanged: (String text) {
                    setState(() {
                      isComposing = text.trim().isNotEmpty;
                    });
                  },
                  onSubmitted: (String text) {
                    controller.sendMessage(textController.text);
                    reset();
                  },
                ),
              ),
              IconButton(
                onPressed: isComposing ? 
                  () {
                    controller.sendMessage(textController.text);
                    reset();
                  } : null, 
                icon: const Icon(Icons.send)
              ),
            ],
          ),
        ),
      ),
    );
  }
}