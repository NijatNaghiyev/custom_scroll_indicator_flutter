import 'package:custom_scroll_indicator_flutter/models/contact_model.dart';
import 'package:custom_scroll_indicator_flutter/widgets/contact_item.dart';
import 'package:flutter/material.dart';

// This is the view that will display the list of contacts
// It will be used in the ContactScreen
class ContactView extends StatelessWidget {
  const ContactView({
    super.key,
    required this.scrollController,
    required this.dummyList,
    required this.globalKeyList,
  });

  final ScrollController scrollController;
  final Map<String, List<Contact>> dummyList;
  final List<GlobalKey<State<StatefulWidget>>> globalKeyList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      itemCount: dummyList.keys.length,
      itemBuilder: (context, index) {
        return ContactItem(
          globalKeyList: globalKeyList,
          dummyList: dummyList,
          index: index,
        );
      },
    );
  }
}
