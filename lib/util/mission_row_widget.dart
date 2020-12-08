import 'package:spacex/models/mission.dart';
import 'package:flutter/material.dart';
import 'package:spacex/util/style.dart';

class MissionRowWidget extends StatefulWidget {
  final Mission mission;

  MissionRowWidget(this.mission);

  @override
  _MissionRowWidgetState createState() => _MissionRowWidgetState();
}

class _MissionRowWidgetState extends State<MissionRowWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Style.secondaryBackgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ListTile(
                  leading: Hero(
                    tag: widget.mission.flightNumber,
                    child: Container(
                      height: 40,
                      child: widget.mission.images.image != null
                          ? Image.network(
                              widget.mission.images.image,
                            )
                          : Icon(
                              Icons.remove,
                              color: Style.failColor,
                              size: 30,
                            ),
                    ),
                  ),
                  title: Transform.translate(
                    offset: Offset(16, 0),
                    child: Text(widget.mission.missionName,
                        style: Style.mediumCommonTextStyle),
                  ),
                  subtitle: Transform.translate(
                      offset: Offset(16, 0),
                      child: Row(
                        children: <Widget>[
                          Text(
                              widget.mission.missionRocket != null
                                  ? '${widget.mission.missionRocket.rocketName}'
                                  : 'Rocket name missing',
                              style: Style.smallHeaderTextStyle),
                          SizedBox(width: 10),
                          Icon(Icons.brightness_1,
                              color: Style.greenColor, size: 6),
                          SizedBox(width: 10),
                          Text('${widget.mission.launchYear}',
                              style: Style.smallHeaderTextStyle)
                        ],
                      )),
                  trailing: Icon(Icons.navigate_next_outlined,
                      color: Style.iconForegroundColor),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
