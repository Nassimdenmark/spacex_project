import 'package:spacex/models/mission.dart';
import 'package:spacex/screens/mission/mission_page.dart';
import 'package:spacex/util/mission_row_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<Mission> missionList;
  const HomePage({
    Key key,
    this.missionList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: missionList == null ? 0 : missionList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) =>
                      MissionPage(selectedMission: missionList[index]),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          FadeTransition(opacity: animation, child: child),
                ),
              );
            },
            child: MissionRowWidget(missionList[index]),
          );
        },
      ),
    );
  }
}
