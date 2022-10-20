import 'package:flutter/cupertino.dart';
import 'package:flutter_search_bar/platform_itemList.dart';
import 'package:flutter_search_bar/platform_search.dart';

class CupertinoSearchDelegate extends AbstractPlatformSearchDelegate {
  final List<UserModel> Function(String text) search;
  CupertinoSearchDelegate(this.search);
  Widget buildActions(BuildContext context) {
    return CupertinoButton(
      child: const Text('Cancel'),
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      onPressed: () {
        close(context, null);
      },
    );
  }

  Widget buildResults(BuildContext context) {
    final List<UserModel> result = search(query);
    return UserItemsWidget(result);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<UserModel> result = search(query);
    return UserItemsWidget(result);
  }

  @override
  Widget buildScaffold(Widget? body, BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        transitionBetweenRoutes: true,
        leading: SizedBox.shrink(),
        middle: CupertinoSearchTextField(
          controller: queryTextController,
          focusNode: focusNode,
          onSubmitted: (String _) {
            showResults(context);
          },
        ),
        trailing: CupertinoButton(
          child: const Text('Cancel'),
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          onPressed: () {
            close(context, null);
          },
        ),
      ),
      child: body ?? Container(),
    );
  }
}
