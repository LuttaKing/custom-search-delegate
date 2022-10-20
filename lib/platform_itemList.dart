import 'package:flutter/material.dart';
import 'package:fluent_ui/fluent_ui.dart' as fluent;

final List<PlatformItem> platforms = [
  PlatformItem(
    'Android',
    Image.asset(
      'assets/android.gif',
      width: 50.0,
      height: 50.0,
    ),
  ),
  PlatformItem(
    'iOS',
    Image.asset(
      'assets/iOS.png',
      width: 50.0,
      height: 50.0,
    ),
  ),
  PlatformItem(
    'Windows',
    Image.asset(
      'assets/windows.png',
      width: 50.0,
      height: 50.0,
    ),
  ),
  PlatformItem(
    'Linux',
    Image.asset(
      'assets/linux.png',
      width: 50.0,
      height: 50.0,
    ),
  ),
  PlatformItem(
    'MacOS',
    Image.asset(
      'assets/macOS.png',
      width: 50.0,
      height: 50.0,
    ),
  ),
  PlatformItem(
    'Web',
    Container(
      width: 50.0,
      height: 50.0,
    ),
  ),
];

class PlatformItem {
  final String name;
  final Widget asset;

  const PlatformItem(this.name, this.asset);
}

class PlatformItemsWidget extends StatelessWidget {
  final List<PlatformItem> items;

  const PlatformItemsWidget(this.items);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        var item = items[index];
        return PlatformItemWidget(item);
      },
    );
  }
}

class PlatformItemWidget extends StatelessWidget {
  final PlatformItem item;
  final bool small;
  const PlatformItemWidget(this.item, {this.small = false});
  @override
  Widget build(BuildContext context) {
    return small
        ? Container(
            color: Colors.white,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              child: Text(
                item.name,
              ),
            ),
          )
        : Card(
          child: fluent.Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [
              Row(
                children: [
                  item.asset,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text(
                      item.name,
                    ),
                  ),
                ],
              ),
            ]),
          ),
        );
  }
}
