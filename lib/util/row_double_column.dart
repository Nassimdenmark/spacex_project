import 'package:flutter/material.dart';
import 'package:spacex/util/style.dart';

class RowDoubleColumn extends StatelessWidget {
  final IconData iconOne;
  final String headerOne;
  final dynamic detailOne;
  final IconData iconTwo;
  final String headerTwo;
  final dynamic detailTwo;
  final bool isButtons;

  const RowDoubleColumn(
      {Key key,
      this.isButtons,
      this.iconOne,
      this.headerOne,
      this.detailOne,
      this.iconTwo,
      this.headerTwo,
      this.detailTwo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40.0, 0, 0.0, 35.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: (MediaQuery.of(context).size.width / 2.5),
            child: Row(children: [
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
                    iconOne,
                    color: Style.iconForegroundColor,
                    size: 20,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(headerOne, style: Style.headerTextStyle),
                  SizedBox(height: 5),
                  isButtons == true ? _rowsWithButton() : _rowsWithIcon()
                ],
              ),
            ]),
          ),
          Container(
            width: (MediaQuery.of(context).size.width / 2.1),
            child: Row(children: [
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
                    iconTwo,
                    color: Style.iconForegroundColor,
                    size: 20,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(headerTwo, style: Style.headerTextStyle),
                  SizedBox(height: 5),
                  isButtons == true ? _rowsWithButton() : _rowsWithIcon()
                ],
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _rowsWithIcon() {
    return detailTwo != null
        ? Text('$detailTwo', style: Style.commonTextStyle)
        : Icon(
            Icons.remove_circle_outline_outlined,
            color: Style.failColor,
            size: 20,
          );
  }

  Widget _rowsWithButton() {
    return detailTwo != null
        ? OutlineButton(
            textColor: Style.greenColor,
            highlightedBorderColor: Colors.black.withOpacity(0.20),
            onPressed: () {},
            child: Text('$headerTwo'),
          )
        : Container();
  }
}
