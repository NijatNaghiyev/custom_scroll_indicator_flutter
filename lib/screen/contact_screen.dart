// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:custom_scroll_indicator_flutter/mixins/contact_screen_mixin.dart';
import 'package:custom_scroll_indicator_flutter/widgets/contact_screen_app_bar.dart';
import 'package:custom_scroll_indicator_flutter/widgets/contact_view.dart';
import 'package:custom_scroll_indicator_flutter/widgets/scroll_indicator.dart';
import 'package:flutter/material.dart';

/// This is the main screen that will display the list of contacts
/// It will be used in the MyApp
class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> with ContactScreenMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ContactScreenAppBar(titleNotifier: titleNotifier),
      body: ContactView(
        scrollController: scrollController,
        dummyList: dummyList,
        globalKeyList: globalKeyList,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ScrollIndicator(
        offsetBarNotifier: offsetBarNotifier,
        scrollController: scrollController,
        isScrollingNotifier: isScrollingNotifier,
        titleNotifier: titleNotifier,
        onDragging: (onDragging) {
          this.onDragging = onDragging;
          isScrollingNotifier.value = onDragging;
        },
      ),
    );
  }
}
