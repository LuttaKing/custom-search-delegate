
import 'package:flutter/material.dart';
import 'package:flutter_search_bar/material_things/material_search_delegate.dart';
import 'package:flutter_search_bar/platform_itemList.dart';
import 'package:flutter_search_bar/platform_search.dart';


class MaterialSearch extends StatelessWidget {
  final List<PlatformItem> Function(String text) search;

  MaterialSearch(this.search);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Search'),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showPlatformSearch(
                  context: context,
                  delegate: MaterialSearchDelegate(search),
                );
              },
            ),
          ],
        ),
        body: PlatformItemsWidget(platforms),
      ),
    );
  }
}
