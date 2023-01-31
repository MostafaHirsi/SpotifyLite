import 'package:flutter/material.dart';

class CircleIconButton extends StatelessWidget {
  final IconData icon;
  final void Function() onPress;
  const CircleIconButton({
    super.key,
    required this.icon,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: const ButtonStyle(
        elevation: MaterialStatePropertyAll(0),
        padding: MaterialStatePropertyAll(EdgeInsets.all(10)),
        shape: MaterialStatePropertyAll(
          CircleBorder(),
        ),
      ),
      onPressed: onPress,
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
