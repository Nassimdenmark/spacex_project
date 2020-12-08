import 'package:spacex/models/mission.dart';
import 'package:flutter/material.dart';
import 'package:spacex/util/row_double_column.dart';
import 'package:spacex/util/row_single_column.dart';
import 'package:spacex/util/spacex_app_bar.dart';
import 'package:spacex/util/style.dart';

class MissionDescriptionPage extends StatefulWidget {
  final Mission selectedMission;
  MissionDescriptionPage({Key key, this.selectedMission}) : super(key: key);

  @override
  _RocketDescriptionPageState createState() => _RocketDescriptionPageState();
}

class _RocketDescriptionPageState extends State<MissionDescriptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.primaryBackgroundColor,
      body: Column(
        children: [
          // Appbar
          SpaceXAppBar(name: widget.selectedMission.missionName),
          // Screen
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    _headerSection(),
                    _bodySection(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

// Mission header
  Widget _headerSection() {
    return Column(
      children: [
        _imagePatch(),
        _headerInfo(),
      ],
    );
  }

  Widget _imagePatch() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Container(
        child: widget.selectedMission.images.imageSmall != null
            ? Image.network(widget.selectedMission.images.imageSmall)
            : Icon(
                Icons.remove,
                color: Style.failColor,
                size: 30,
              ),
        constraints: BoxConstraints.expand(height: 120.0),
      ),
    );
  }

  Widget _headerInfo() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 20.0),
      child: Row(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('${widget.selectedMission.missionName}',
                  style: Style.mediumCommonTextStyle),
              SizedBox(height: 10),
              Row(
                children: <Widget>[
                  Icon(Icons.brightness_1, color: Style.greenColor, size: 6),
                  SizedBox(width: 20),
                  Text('Number ${widget.selectedMission.flightNumber}',
                      style: Style.headerTextStyle),
                  SizedBox(width: 20),
                ],
              ),
              SizedBox(height: 3),
              Row(
                children: <Widget>[
                  Icon(Icons.brightness_1, color: Style.greenColor, size: 6),
                  SizedBox(width: 20),
                  Text(widget.selectedMission.launchDate,
                      style: Style.headerTextStyle),
                ],
              )
            ],
          ),
          Spacer(),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Style.greenColor),
            child: Center(
              child: Icon(Icons.airplanemode_active,
                  color: Style.iconForegroundColor, size: 30),
            ),
          )
        ],
      ),
    );
  }

  Widget _detailsRow() {
    return widget.selectedMission.details != null
        ? Container(
            child: ExpansionTile(
              backgroundColor: Style.greenColor.withOpacity(0.5),
              leading: Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: Icon(Icons.add, color: Style.greenColor),
              ),
              title: Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Text("Details", style: Style.headerTextStyle),
              ),
              trailing: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: new IconButton(
                  icon: new Icon(
                    Icons.keyboard_arrow_down,
                    color: Style.iconForegroundColor,
                    size: 26,
                  ),
                  onPressed: null,
                ),
              ),
              children: <Widget>[
                Container(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: ListTile(
                      title: Text(widget.selectedMission.details,
                          style: Style.commonTextStyle),
                    ),
                  ),
                ),
              ],
            ),
          )
        : Container(
            height: 100,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 14.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 39.0),
                    child: Icon(Icons.remove, color: Colors.red),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 21.0),
                    child: Text("Details", style: Style.failTextStyle),
                  ),
                ],
              ),
            ),
          );
  }

// Mission body
  Widget _bodySection() {
    return Column(
      children: [
        _detailsRow(),
        _bodyRows(),
      ],
    );
  }

  Widget _bodyRows() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 18.0),
          child: Column(
            children: [
              RowSingleColumn(
                icon: Icons.location_on_outlined,
                fontColor: Colors.white,
                header: 'Launch Site',
                detail: widget.selectedMission.launchSite.launchSiteName,
              ),
              RowDoubleColumn(
                  isButtons: true,
                  iconOne: Icons.more_horiz_outlined,
                  headerOne: 'Wikipedia',
                  detailOne: widget.selectedMission.images.wikipedia,
                  iconTwo: Icons.play_arrow,
                  headerTwo: 'Youtube',
                  detailTwo: widget.selectedMission.images.youtubeId),
              RowDoubleColumn(
                  isButtons: true,
                  iconOne: Icons.article,
                  headerOne: 'Article',
                  detailOne: widget.selectedMission.images.wikipedia,
                  iconTwo: Icons.personal_video,
                  headerTwo: 'Video',
                  detailTwo: widget.selectedMission.images.youtubeId),
            ],
          ),
        ),
      ],
    );
  }
}
