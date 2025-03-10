import 'package:flutter/material.dart';

// This is the app bar for the ContactScreen
// It will display the current active letter
class ContactScreenAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ContactScreenAppBar({super.key, required this.titleNotifier});

  final ValueNotifier<String> titleNotifier;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: ValueListenableBuilder<String>(
        valueListenable: titleNotifier,
        builder: (context, value, _) {
          return RichText(
            text: TextSpan(
              children: [
                const TextSpan(
                  text: 'Current Active Letter: ',
                  style: TextStyle(color: Colors.black, fontSize: 22),
                ),
                TextSpan(
                  text: value,
                  style: const TextStyle(
                    color: Colors.teal,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}