import 'package:custom_scroll_indicator_flutter/models/contact_model.dart';
import 'package:flutter/material.dart';

// This is the item that will display the contact list
// It will be used in the ContactView
class ContactItem extends StatelessWidget {
  const ContactItem({
    super.key,
    required this.globalKeyList,
    required this.dummyList,
    required this.index,
  });

  final List<GlobalKey<State<StatefulWidget>>> globalKeyList;
  final Map<String, List<Contact>> dummyList;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: globalKeyList[index],
      margin: const EdgeInsets.all(24) + const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.teal,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            dummyList.keys.toList()[index],
            style: const TextStyle(color: Colors.white, fontSize: 32),
          ),
          const SizedBox(height: 16),
          for (var e in dummyList.values.toList()[index])
            ListTile(title: Text(e.name), subtitle: Text(e.number)),
        ],
      ),
    );
  }
}
