import 'package:flutter/material.dart';
import 'package:spacex/util/style.dart';

class SpaceXAppBar extends StatelessWidget {
  final String name;
  final bool isMainAppBar;

  const SpaceXAppBar({Key key, this.name, this.isMainAppBar = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: isMainAppBar == true
          ? new BoxDecoration(
              color: Style.greenColor,
              borderRadius: BorderRadius.vertical(
                  bottom: Radius.elliptical(
                      MediaQuery.of(context).size.width, 100.0)),
            )
          : new BoxDecoration(
              color: Style.greenColor,
            ),
      child: isMainAppBar != true
          ? Padding(
              padding: const EdgeInsets.only(top: 40.0, right: 50, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios,
                        color: Style.iconForegroundColor),
                  ),
                  Flexible(child: Text(name, style: Style.appBarTextStyle)),
                  SizedBox(),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(name, style: Style.appBarTextStyle),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
