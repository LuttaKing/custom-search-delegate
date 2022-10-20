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
        body: Builder(
          builder: (context) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => Navigator.push( context, MaterialPageRoute( builder: (context) => MaterialSearch(search))),
                  child: Container(
                      color: Colors.orange[100],
                      padding: EdgeInsets.all(20),
                      child: Text('Android Demo')),
                ),
                GestureDetector(
                  onTap: () => Navigator.push( context,
                      MaterialPageRoute( builder: (context) => CupertinoSearch(search))),
                  child: Container(
                     
                      padding: EdgeInsets.all(20),
                      child: Text('IOS DEmo')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<UserModel> search(String searchTerm) {
     return userList.where((element) =>
        element.searchThings().toLowerCase().contains(searchTerm.toLowerCase())).toList();
  

//search by username
    // return userList.where((element) =>
    //     element.username.toLowerCase().contains(searchTerm.toLowerCase())).toList();
  
  }
}
