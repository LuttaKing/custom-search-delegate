
import 'package:flutter/material.dart';
import 'package:flutter_search_bar/curpetino_things/cupertino_search_ui.dart';
import 'package:flutter_search_bar/material_things/material_search_ui.dart';
import 'package:flutter_search_bar/platform_itemList.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar( title: Text('Pick demo'),  ),
        body: Builder(
          builder: (context) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MaterialSearch(search))),
                  child: Container(color: Colors.orange[100],padding: EdgeInsets.all(20),child: Text('Android Demo')),
                ),
                GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CupertinoSearch(search))),
                  child: Container(color: Colors.pink[100],padding: EdgeInsets.all(20),child: Text('IOS DEmo')),
                ),
           
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<PlatformItem> search(String text) {
    return platforms
        .where((element) =>
            element.name.toLowerCase().contains(text.toLowerCase()))
        .toList();
  }
}
