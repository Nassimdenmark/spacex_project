import 'package:spacex/models/mission.dart';
import 'package:spacex/models/rocket.dart';
import 'package:spacex/screens/home/homepage.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:date_format/date_format.dart';
import 'package:spacex/util/spacex_app_bar.dart';
import 'package:spacex/util/style.dart';

class FetchMissionsPage extends StatefulWidget {
  FetchMissionsPage({Key key}) : super(key: key);

  _FetchMissionsPageState createState() => _FetchMissionsPageState();
}

class _FetchMissionsPageState extends State<FetchMissionsPage> {
  List<Rocket> _rocketList = [];
  List<Mission> _missionList = [];

  // Fetch Rockets method
  Future<List<Rocket>> fetchRockets() async {
    final response = await http.get('https://api.spacexdata.com/v2/rockets');

    if (response.statusCode == 200) {
      List<dynamic> jsonResp = json.decode(response.body);
      _rocketList =
          jsonResp.map((rocket) => new Rocket.fromJson(rocket)).toList();
      _rocketList.forEach((rocket) {
        rocket.firstFlightDate =
            convertToDateFromString(rocket.firstFlightDate);
      });
    } else {
      throw Exception('Failed to load rockets');
    }
    return _rocketList;
  }

  // Fetch Missions method
  fetchMissions() async {
    // Get rockets
    fetchRockets();

    final response = await http.get('https://api.spacexdata.com/v2/launches');

    if (response.statusCode == 200) {
      List<dynamic> jsonResp = json.decode(response.body);

      List<dynamic> missions =
          jsonResp.map((mission) => new Mission.fromJson(mission)).toList();

      // Combine rocket to correct mission
      missions.forEach((mission) {
        _rocketList.forEach((rocket) {
          if (mission.missionRocketId == rocket.rocketId) {
            mission.missionRocket = rocket;
          }
        });
        // Convert date to danish date format
        mission.launchDate = convertToDateFromString(mission.launchDate);
      });

      setState(() {
        _missionList = missions;
      });
    } else {
      throw Exception('Failed to load missions');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchMissions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.secondaryBackgroundColor,
      body: Stack(
        children: [
          Container(
            height: 120,
            child: SpaceXAppBar(
              name: 'Space X',
              isMainAppBar: true,
            ),
          ),
          Transform.translate(
            offset: Offset(0, 100),
            child: Padding(
              padding: const EdgeInsets.only(top: 22.0),
              child: Row(
                children: [
                  _missionList != null && isImagesThere()
                      ? HomePage(missionList: _missionList)
                      : _waitGettingMissions()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Waiting icon while fetching json
  Widget _waitGettingMissions() {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Text("Getting missions", style: Style.commonTextStyle),
            ),
            Icon(
              Icons.download_rounded,
              color: Style.greenColor,
              size: 50,
            ),
          ],
        ),
      ),
    );
  }

  // Convert date to danish date format
  String convertToDateFromString(String strDate) {
    DateTime todayDate = DateTime.parse(strDate);
    return formatDate(todayDate, [dd, '/', mm, '/', yyyy]);
  }

  // Just to check if all images are there before loading
  bool isImagesThere() {
    int count = 0;
    bool isImagesThere = false;

    _missionList.forEach((image) {
      count++;
      if (count == _missionList.length) {
        return isImagesThere = true;
      }
    });
    return isImagesThere;
  }
}
