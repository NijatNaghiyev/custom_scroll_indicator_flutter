import 'package:custom_scroll_indicator_flutter/helpers/get_visible_percentage.dart';
import 'package:custom_scroll_indicator_flutter/models/contact_model.dart';
import 'package:custom_scroll_indicator_flutter/screen/contact_screen.dart';
import 'package:flutter/material.dart';

/// This mixin contains the logic for the ContactScreen
/// It contains the logic for the scroll event and scroll end event
/// It also contains the logic for updating the title based on the visible section
mixin ContactScreenMixin on State<ContactScreen> {
  Map<String, List<Contact>> dummyList = {};

  late final ScrollController scrollController;

  ValueNotifier<double> offsetBarNotifier = ValueNotifier<double>(0);
  ValueNotifier<String> titleNotifier = ValueNotifier("A");

  List<GlobalKey> globalKeyList = [];

  bool onDragging = false;

  @override
  void initState() {
    super.initState();
    dummyList = Contact.getGroup();
    globalKeyList = List.generate(
      dummyList.keys.length,
      (index) => GlobalKey(debugLabel: dummyList.keys.toList()[index]),
    );
    scrollController = ScrollController()..addListener(scrollListener);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      scrollController.position.isScrollingNotifier.addListener(
        scollEndListener,
      );
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    offsetBarNotifier.dispose();
    titleNotifier.dispose();
    super.dispose();
  }

  ///* This method is used to listen to the scroll event
  void scrollListener() {
    final size = MediaQuery.of(context);
    final maxHeight = scrollController.position.maxScrollExtent;

    ///* Skip updating the offset bar position when user is manually dragging
    ///* This prevents the bar from jumping around while the user is interacting with it
    ///* Only update offset when scrolling normally through the list
    if (!onDragging) {
      offsetBarNotifier.value = ((size.size.height / 2) *
              (scrollController.position.pixels / maxHeight))
          .clamp(0, (size.size.height / 2) - 15);
    }

    ///* Update the title notifier based on which section is fully visible
    ///* Iterate through each section's GlobalKey to check visibility percentage
    ///* When a section is 100% visible, update the title to that section's letter
    for (var element in globalKeyList) {
      double visiblePerc = getVisiblePercentage(element, context);

      if (visiblePerc == 1) {
        titleNotifier.value =
            dummyList.keys.toList()[globalKeyList.indexOf(element)];
      }
    }
  }

  ///* This method is used to listen to the scroll end event
  void scollEndListener() {
    ///* This block updates the title when scrolling ends
    ///* It checks each section's visibility and updates the title
    ///* to match whichever section is fully visible in the viewport
    for (var element in globalKeyList) {
      double visiblePerc = getVisiblePercentage(element, context);

      if (visiblePerc == 1) {
        titleNotifier.value =
            dummyList.keys.toList()[globalKeyList.indexOf(element)];
      }
    }
  }
}
