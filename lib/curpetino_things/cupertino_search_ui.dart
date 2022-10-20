
// import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_search_bar/curpetino_things/cupertino_search_delegate.dart';
import 'package:flutter_search_bar/platform_itemList.dart';
import 'package:flutter_search_bar/platform_search.dart';

class CupertinoSearch extends StatefulWidget {
  final List<UserModel> Function(String text) search;

  CupertinoSearch(this.search);

  @override
  _CupertinoSearchState createState() => _CupertinoSearchState();
}

class _CupertinoSearchState extends State<CupertinoSearch> {
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        showPlatformSearch(
          context: context,
          delegate: CupertinoSearchDelegate(widget.search),
        );
      }
      _focusNode.unfocus();
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 300,left: 20,right: 20),
          child: Column(
            children: [

              Center(child: GestureDetector(
                onTap: () {
                      showPlatformSearch(
                        context: context,
                        delegate: CupertinoSearchDelegate(widget.search),
                      );
                    } ,
                child: CupertinoSearchTextField(
                        focusNode: _focusNode,
                      ),
              ),),
             
            
            
            ],
          ),
        ),
      ),
    );
  }
}


