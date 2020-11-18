import 'package:flutter/material.dart';
import 'package:grk_001/models/main_screen_categories_entry.dart';
import 'package:grk_001/screen/endrawer_categories_product_screen.dart';

class EntryItem extends StatefulWidget {
  EntryItem(this.entry);
  final Entry entry;

  @override
  _EntryItemState createState() => _EntryItemState();
}

class _EntryItemState extends State<EntryItem> {
  bool isopen = false;
  Widget _buildTiles(Entry root, BuildContext ctx) {
    if (root.children.isEmpty) {
      return ListTile(title: Text(root.title));
    }

    return ExpansionTile(
      onExpansionChanged: (value) {
        setState(() {
          isopen = value;
          print(isopen);
        });
      },
      backgroundColor: Color(0XFFFF4081).withOpacity(0.10),
      title: Text(
        root.title,
      ),
      children: root.children
          .map((e) => ListTile(
                onTap: () {
                  Navigator.of(ctx).pushNamed(
                    NewPage.routename,
                    arguments: {'id': e.id, 'title': e.title},
                  );
                },
                title: Text(e.title),
              ))
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(widget.entry, context);
  }
}
