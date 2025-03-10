import 'dart:ui';

import 'package:flutter/material.dart';

class ScrollIndicator extends StatelessWidget {
  const ScrollIndicator({
    super.key,
    required this.scrollController,
    required this.offsetBarNotifier,
    required this.titleNotifier,
    required this.onDragging,
  });

  final ScrollController scrollController;

  final ValueNotifier<double> offsetBarNotifier;
  final ValueNotifier<String> titleNotifier;

  final void Function(bool onDragging) onDragging;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    //* This function will be called when the user drags the bar
    void onVerticalDragUpdate(DragUpdateDetails details) {
      final y = details.globalPosition.dy;

      double interval = ((y - size.height / 4) / (size.height / 2)).clamp(0, 1);

      scrollController.animateTo(
        lerpDouble(0, scrollController.position.maxScrollExtent, interval)!,
        duration: Durations.short1,
        curve: Curves.easeInOut,
      );

      offsetBarNotifier.value = (offsetBarNotifier.value +
              details.primaryDelta!)
          .clamp(0, (size.height / 2) - 20);
    }

    return Stack(
      children: [
        Positioned(
          top: size.height / 3,
          right: 10,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              //? Background
              Container(
                height: size.height / 2,
                width: 20,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),

              //? Bar
              ValueListenableBuilder<double>(
                valueListenable: offsetBarNotifier,
                builder: (context, value, _) {
                  return AnimatedPositioned(
                    left: -50,
                    top: value,
                    duration: Durations.short1,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ValueListenableBuilder<bool>(
                          valueListenable:
                              scrollController.position.isScrollingNotifier,
                          builder: (context, isBool, _) {
                            if (!isBool) {
                              return const SizedBox(width: 40);
                            }

                            return Container(
                              height: 40,
                              width: 40,
                              padding: const EdgeInsets.all(1),
                              decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  bottomRight: Radius.circular(8),
                                  bottomLeft: Radius.circular(8),
                                ),
                              ),
                              alignment: Alignment.center,
                              child: ValueListenableBuilder<String>(
                                valueListenable: titleNotifier,
                                builder: (context, titleN, _) {
                                  return Text(
                                    titleN,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onVerticalDragStart: (details) {
                            onDragging(true);
                          },
                          onVerticalDragEnd: (details) {
                            onDragging(false);
                          },
                          onVerticalDragUpdate: onVerticalDragUpdate,
                          child: Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
