import 'package:flutter/material.dart';
import 'package:spacex/util/style.dart';

class RowSingleColumn extends StatelessWidget {
  final IconData icon;
  final String header;
  final dynamic detail;
  final Color fontColor;

  const RowSingleColumn({
    Key key,
    this.icon,
    this.header,
    this.detail,
    this.fontColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40.0, 0, 0.0, 25.0),
      child: Container(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black54,
                              spreadRadius: 0.1,
                              blurRadius: 1,
                              offset: Offset(0.6, 0.6),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(30),
                          color: Style.iconBackgroundColor),
                      child: Icon(
                        icon,
                        color: Style.iconForegroundColor,
                        size: 20,
                      ),
                    ),
                  ),
                ]),
            Expanded(
              child: Column(children: [
                Row(
                  children: [
                    Text(header, style: Style.headerTextStyle),
                  ],
                ),
                detail != null
                    ? Expanded(
                        child: Row(
                          children: [
                            Flexible(
                              child: Text(
                                '$detail',
                                style: TextStyle(color: fontColor),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Expanded(
                        child: Row(
                          children: [
                            Icon(Icons.remove,
                                color: Style.failColor, size: 20),
                          ],
                        ),
                      )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
