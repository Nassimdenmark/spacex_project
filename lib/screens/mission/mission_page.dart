import 'package:spacex/models/mission.dart';
import 'package:spacex/screens/mission/mission_description_page.dart';
import 'package:spacex/screens/rocket/rocket_page.dart';
import 'package:flutter/material.dart';
import 'package:spacex/util/row_double_column.dart';
import 'package:spacex/util/row_single_column.dart';
import 'package:spacex/util/spacex_app_bar.dart';
import 'package:spacex/util/style.dart';

class MissionPage extends StatefulWidget {
  final Mission selectedMission;
  MissionPage({Key key, this.selectedMission}) : super(key: key);

  @override
  _MissionPageState createState() => _MissionPageState();
}

class _MissionPageState extends State<MissionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SpaceXAppBar(name: widget.selectedMission.missionName),
          _headerSection(),
          _bodySection(),
        ],
      ),
    );
  }

// Header section
  Container _headerSection() {
    return Container(
      color: Style.primaryBackgroundColor,
      child: Column(
        children: [
          _headerCirclesAndImage(),
          _headerSuccess(),
          _headerMissionNavigation(),
          _headerRocketNavigation(),
          _headerBottomShadow(),
        ],
      ),
    );
  }

  Widget _headerCirclesAndImage() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Reusing the _headerCircle method on left with different parameters
            _headerCircle(
                widget.selectedMission.flightNumber, 23.0, 0.0, 40.0, 0.0),
            // Mission image patch
            _headerImage(),

            // Reusing the _headerCircle method on right with different parameters
            _headerCircle(
                widget.selectedMission.launchYear, 10.0, 0.0, 0.0, 40.0),
          ],
        ),
      ),
    );
  }

  Widget _headerImage() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Container(
        height: 100,
        child: Hero(
          tag: widget.selectedMission.flightNumber,
          child: widget.selectedMission.images.imageSmall != null
              ? Image.network(widget.selectedMission.images.imageSmall)
              : Icon(
                  Icons.remove,
                  color: Style.failColor,
                  size: 30,
                ),
        ),
      ),
    );
  }

  Widget _headerCircle(
      dynamic missionValue,
      double leftTextPadding,
      double rightTextPadding,
      double leftCirclePadding,
      double rightCirclePadding) {
    return Padding(
      padding:
          EdgeInsets.fromLTRB(leftCirclePadding, 20.0, rightCirclePadding, 0.0),
      child: Container(
        width: 55,
        height: 55,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              spreadRadius: 0.1,
              blurRadius: 3,
              offset: Offset(0.9, 0.9),
            ),
          ],
          color: Style.primaryBackgroundColor,
          shape: BoxShape.circle,
          border: Border.all(color: Style.iconForegroundColor, width: 1.0),
        ),
        child: Padding(
          padding:
              EdgeInsets.fromLTRB(leftTextPadding, 15.0, rightTextPadding, 0.0),
          child: Transform.translate(
              offset: Offset(-3, 0),
              child: Text('$missionValue', style: Style.smallCommonTextStyle)),
        ),
      ),
    );
  }

  Container _headerSuccess() {
    return Container(
      height: 60,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Launch success', style: Style.smallHeaderTextStyle),
            Container(
              width: 110,
              child: LinearProgressIndicator(
                value: widget.selectedMission.launchSuccess == true ? 1 : 0,
                backgroundColor: widget.selectedMission.launchSuccess == true
                    ? Colors.green
                    : Style.failColor,
                valueColor: AlwaysStoppedAnimation<Color>(
                  widget.selectedMission.launchSuccess == true
                      ? Style.greenColor
                      : Style.failColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _headerMissionNavigation() {
    return Container(
      height: 55,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            PageRouteBuilder(
              pageBuilder: (_, __, ___) => MissionDescriptionPage(
                  selectedMission: widget.selectedMission),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 40, right: 25),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(Icons.info_outline,
                      color: Style.iconForegroundColor),
                ),
              ),
              SizedBox(width: 20),
              Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Text("Mission Description",
                      style: Style.headerTextStyle)),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => MissionDescriptionPage(
                            selectedMission: widget.selectedMission),
                      ),
                    );
                  },
                  iconSize: 18.0,
                  icon: Icon(Icons.arrow_forward_ios_outlined,
                      color: Style.iconForegroundColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _headerRocketNavigation() {
    return Container(
      height: 70,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            PageRouteBuilder(
              pageBuilder: (_, __, ___) => RocketPage(
                  missionRocket: widget.selectedMission.missionRocket),
            ),
          );
        },
        child: Padding(
          padding:
              const EdgeInsets.only(left: 40, top: 0, right: 25, bottom: 6),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(Icons.info_outline,
                      color: Style.iconForegroundColor),
                ),
              ),
              SizedBox(width: 20),
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: Text(
                    'Rocket ${widget.selectedMission.missionRocket.rocketName}',
                    style: Style.headerTextStyle),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => RocketPage(
                            missionRocket:
                                widget.selectedMission.missionRocket),
                      ),
                    );
                  },
                  iconSize: 18.0,
                  icon: Icon(Icons.arrow_forward_ios_outlined,
                      color: Style.iconForegroundColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _headerInformationRow() {
    return Container(
      height: 75,
      child: Padding(
        padding: const EdgeInsets.only(left: 40, right: 25, bottom: 30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(Icons.arrow_downward,
                    color: Style.iconForegroundColor),
              ),
            ),
            SizedBox(width: 20),
            Padding(
              padding: const EdgeInsets.only(top: 14.0),
              child: Text("Mission Information", style: Style.commonTextStyle),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }

  Container _headerBottomShadow() {
    return Container(
      height: 4,
      color: Style.shadowColor,
    );
  }

// Body section
  Expanded _bodySection() {
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          color: Style.primaryBackgroundColor,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: Container(),
              ),
              _headerInformationRow(),
              _bodyRows(),
            ],
          ),
        ),
      ),
    );
  }

  Column _bodyRows() {
    return Column(
      children: [
        widget.selectedMission.launchFailureDetails != null
            ? Column(
                children: [
                  RowSingleColumn(
                    icon: Icons.adjust_outlined,
                    fontColor: Style.failColor,
                    header: 'Failure Reason',
                    detail: widget
                        .selectedMission.launchFailureDetails.failureReason,
                  ),
                  RowDoubleColumn(
                      iconOne: Icons.timelapse_outlined,
                      headerOne: 'Failure time',
                      detailOne: widget
                          .selectedMission.launchFailureDetails.failureTime,
                      iconTwo: Icons.waves_outlined,
                      headerTwo: 'Failure altitude',
                      detailTwo: widget
                          .selectedMission.launchFailureDetails.failureAltitude)
                ],
              )
            : Container(),
        RowDoubleColumn(
            iconOne: Icons.date_range,
            headerOne: 'Upcoming',
            detailOne: widget.selectedMission.upcoming,
            iconTwo: Icons.merge_type_outlined,
            headerTwo: 'TBD',
            detailTwo: widget.selectedMission.toBeDetermined),
        widget.selectedMission.timeLine != null
            ? RowDoubleColumn(
                iconOne: Icons.launch,
                headerOne: 'Launch',
                detailOne: widget.selectedMission.launchWindow,
                iconTwo: Icons.timelapse,
                headerTwo: 'Time liftoff',
                detailTwo: widget.selectedMission.timeLine.webcastLiftoff)
            : Container(),
        RowDoubleColumn(
            iconOne: Icons.vertical_align_center,
            headerOne: 'Is tentative',
            detailOne: widget.selectedMission.isTentative,
            iconTwo: Icons.center_focus_weak,
            headerTwo: 'Max precision',
            detailTwo: widget.selectedMission.tentativeMaxPrecision),
      ],
    );
  }
}
