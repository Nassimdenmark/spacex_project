import 'package:spacex/models/rocket.dart';
import 'package:spacex/screens/rocket/rocket_description_page.dart';
import 'package:flutter/material.dart';
import 'package:spacex/util/row_double_column.dart';
import 'package:spacex/util/spacex_app_bar.dart';
import 'package:spacex/util/style.dart';

class RocketPage extends StatefulWidget {
  final Rocket missionRocket;
  RocketPage({Key key, this.missionRocket}) : super(key: key);

  @override
  _MissionDetailPageState createState() => _MissionDetailPageState();
}

class _MissionDetailPageState extends State<RocketPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.primaryBackgroundColor,
      body: Column(
        children: [
          SpaceXAppBar(name: widget.missionRocket.rocketName),
          _headerSection(),
          _bodySection(),
        ],
      ),
    );
  }

// Header Section
  Container _headerSection() {
    return Container(
      child: Column(
        children: [
          _rocketImage(),
          _rocketHeader(),
          _rocketDescription(),
        ],
      ),
    );
  }

  Container _rocketImage() {
    return Container(
      height: MediaQuery.of(context).size.height / 4.5,
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width / 3.2,
          height: MediaQuery.of(context).size.height / 3.2,
          decoration: new BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Style.shadowColor,
                spreadRadius: 3,
                blurRadius: 5,
                offset: Offset(1, 3),
              ),
            ],
            shape: BoxShape.circle,
            image: new DecorationImage(
              fit: BoxFit.fill,
              image: new NetworkImage(widget.missionRocket.images[0]),
            ),
          ),
        ),
      ),
    );
  }

  Container _rocketHeader() {
    return Container(
      height: 80,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Date: ${widget.missionRocket.firstFlightDate}',
              style: Style.smallCommonTextStyle,
            ),
            Text('Success rate: ${widget.missionRocket.successRate} %',
                style: Style.smallHeaderTextStyle),
            Container(
              width: 122,
              child: LinearProgressIndicator(
                value: (widget.missionRocket.successRate / 100).toDouble(),
                backgroundColor: Colors.greenAccent[100],
                valueColor:
                    AlwaysStoppedAnimation<Color>(Colors.greenAccent[400]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _rocketDescription() {
    return Container(
      decoration: BoxDecoration(
        color: Style.primaryBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            PageRouteBuilder(
              pageBuilder: (_, __, ___) =>
                  RocketDescriptionPage(missionRocket: widget.missionRocket),
            ),
          );
        },
        child: Padding(
          padding:
              const EdgeInsets.only(left: 40, top: 10, right: 25, bottom: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 6.0),
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
                    borderRadius: BorderRadius.circular(20),
                    color: Style.iconBackgroundColor,
                  ),
                  child: Icon(
                    Icons.info_outline,
                    color: Style.iconForegroundColor,
                    size: 20,
                  ),
                ),
              ),
              SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Description", style: Style.headerTextStyle),
                  SizedBox(height: 5),
                  Text("Read more", style: Style.commonTextStyle)
                ],
              ),
              Spacer(),
              IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => RocketDescriptionPage(
                            missionRocket: widget.missionRocket),
                      ),
                    );
                  },
                  iconSize: 18.0,
                  icon: Icon(Icons.arrow_forward_ios_outlined,
                      color: Style.iconForegroundColor)),
              SizedBox(width: 15),
            ],
          ),
        ),
      ),
    );
  }

// Body Section
  Expanded _bodySection() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.black,
              width: 0.5,
            ),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: RowDoubleColumn(
                        iconOne: Icons.home_outlined,
                        headerOne: 'Company',
                        detailOne: widget.missionRocket.company,
                        iconTwo: Icons.attach_money_outlined,
                        headerTwo: 'Cost',
                        detailTwo: widget.missionRocket.costPerLaunch),
                  ),
                  RowDoubleColumn(
                      iconOne: Icons.api_outlined,
                      headerOne: 'Burn/Sec',
                      detailOne: widget.missionRocket.secondStage.burnTimeSec,
                      iconTwo: Icons.waves_outlined,
                      headerTwo: 'Fuel tons',
                      detailTwo:
                          widget.missionRocket.secondStage.fuelAmountTons),
                  RowDoubleColumn(
                      iconOne: Icons.settings_backup_restore_outlined,
                      headerOne: 'Reusable',
                      detailOne: widget.missionRocket.secondStage.reusable,
                      iconTwo: Icons.engineering_outlined,
                      headerTwo: 'Engines',
                      detailTwo: widget.missionRocket.secondStage.engines),
                  RowDoubleColumn(
                      iconOne: Icons.height_outlined,
                      headerOne: 'Up Meters',
                      detailOne: widget.missionRocket.height.meters,
                      iconTwo: Icons.height_outlined,
                      headerTwo: 'Up Feet',
                      detailTwo: widget.missionRocket.height.feet),
                  RowDoubleColumn(
                      iconOne: Icons.compare_arrows_outlined,
                      headerOne: 'Wide Meters',
                      detailOne: widget.missionRocket.diameter.meters,
                      iconTwo: Icons.compare_arrows_outlined,
                      headerTwo: 'Wide Feet',
                      detailTwo: widget.missionRocket.diameter.feet),
                  RowDoubleColumn(
                      iconOne: Icons.block,
                      headerOne: 'Mass Kg',
                      detailOne: widget.missionRocket.mass.kg,
                      iconTwo: Icons.block,
                      headerTwo: 'Mass lb',
                      detailTwo: widget.missionRocket.mass.lb),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
