import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get_it/get_it.dart';

import '../../../stores/page_store.dart';

class CreateAdButton extends StatefulWidget {
  const CreateAdButton({required this.scrollController, Key? key}) : super(key: key);

  final ScrollController scrollController;

  @override
  State<CreateAdButton> createState() => _CreateAdButtonState();
}

class _CreateAdButtonState extends State<CreateAdButton> with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation<double> buttonAnimation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1)
    );

    buttonAnimation = Tween<double>(
      begin: 0,
      end: 66
    ).animate(
      CurvedAnimation(
        parent: controller, 
        curve: const Interval(
          0.4, 
          0.6
        )
      )
    );

    widget.scrollController.addListener(scrollChanged);

    super.initState();
  }

  void scrollChanged() {
    final position = widget.scrollController.position;

    if (position.userScrollDirection == ScrollDirection.forward) {
      controller.forward();
    } else {
      controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller, 
      builder: (_,  __) {
        return Container(
          height: 50,
          margin: EdgeInsets.only(bottom: buttonAnimation.value),
          child: ElevatedButton.icon(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.orange),
              elevation: MaterialStateProperty.all(0),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(26)
                )
              )
            ),
            label: const Text(
              'Anunciar agora',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              ),
            icon: const Icon(Icons.camera_alt),
            onPressed: () {
              GetIt.I.get<PageStore>().setPage(1);
            },
          ),
        );
      },
    );
  }
}