import 'package:age_calculator_app/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliderView extends StatelessWidget {
  final Function(String)? onItemClick;

  const SliderView({Key? key, this.onItemClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white30,
      padding: const EdgeInsets.only(top: 10),
      child: ListView(
        children: <Widget>[
          // CircleAvatar(
          //   radius: 65,
          //   child: CircleAvatar(
          //     radius: 65,
          //     backgroundImage: Image.asset(
          //         'assets/images/AGE.png')
          //         .image,
          //   ),
          // ),

          const SizedBox(
            height: 20,
          ),
          ...[
            Menu(Icons.home, 'Home'),
            Menu(Icons.share, 'Share'),
            Menu(Icons.star_rate, 'Rate Us'),
            Menu(Icons.apps, 'More Apps'),
            Menu(Icons.settings, 'Setting'),
          ]
              .map((menu) => _SliderMenuItem(
              title: menu.title,
              iconData: menu.iconData,
              onTap: onItemClick))
              .toList(),
        ],
      ),
    );
  }
}

class _SliderMenuItem extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Function(String)? onTap;

  const _SliderMenuItem(
      {Key? key,
        required this.title,
        required this.iconData,
        required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(title,
            style: const TextStyle(
                color: Colors.black, fontFamily: 'BalsamiqSans_Regular')),
        leading: Icon(iconData, color: Colors.black),
        onTap: () => onTap?.call(title));
  }
}

class Menu {
  final IconData iconData;
  final String title;

  Menu(this.iconData, this.title);
}