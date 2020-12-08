import 'package:spacex/models/rocket.dart';
import 'package:flutter/material.dart';
import 'package:spacex/util/row_double_column.dart';
import 'package:spacex/util/spacex_app_bar.dart';
import 'package:spacex/util/style.dart';

class RocketDescriptionPage extends StatefulWidget {
  final Rocket missionRocket;
  RocketDescriptionPage({Key key, this.missionRocket}) : super(key: key);

  @override
  _RocketDescriptionPageState createState() => _RocketDescriptionPageState();
}

class _RocketDescriptionPageState extends State<RocketDescriptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.primaryBackgroundColor,
      body: Column(
        children: [
          SpaceXAppBar(name: widget.missionRocket.rocketName),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    _rocketImage(),
                    _rocketHeaderInfo(),
                    _rocketDescription(),
                    _rocketRowOneColumn(),
                    _rocketRowsTwoColumns(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _rocketImage() {
    return Container(
      child: Image.network(
        widget.missionRocket.images[0],
        fit: BoxFit.fill,
      ),
      constraints: BoxConstraints.expand(height: 200.0),
    );
  }

  Widget _rocketHeaderInfo() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
      child: Row(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('${widget.missionRocket.rocketName}',
                  style: Style.largeCommonTextStyle),
              SizedBox(height: 10),
              Row(
                children: <Widget>[
                  Text(widget.missionRocket.rocketId,
                      style: Style.smallHeaderTextStyle),
                  SizedBox(width: 20),
                  Icon(Icons.brightness_1, color: Style.greenColor, size: 6),
                  SizedBox(width: 20),
                  Text(widget.missionRocket.firstFlightDate,
                      style: Style.smallHeaderTextStyle)
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

  Widget _rocketDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
      child: Text(
        '${widget.missionRocket.description}',
        style: Style.smallCommonLineHeightTextStyle,
      ),
    );
  }

  Widget _rocketRowOneColumn() {
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 25, bottom: 25),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 6.0),
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Style.iconBackgroundColor),
              child: Icon(
                Icons.arrow_downward_outlined,
                color: Style.iconForegroundColor,
                size: 20,
              ),
            ),
          ),
          SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Engines", style: Style.headerTextStyle),
              SizedBox(height: 5),
              Text("Engine and ISP", style: Style.commonTextStyle),
            ],
          ),
        ],
      ),
    );
  }

  Column _rocketRowsTwoColumns() {
    return Column(
      children: [
        RowDoubleColumn(
            iconOne: Icons.confirmation_number_outlined,
            headerOne: 'Number',
            detailOne: widget.missionRocket.engines.number,
            iconTwo: Icons.merge_type_outlined,
            headerTwo: 'Type',
            detailTwo: widget.missionRocket.engines.type),
        RowDoubleColumn(
            iconOne: Icons.format_list_numbered_outlined,
            headerOne: 'Version',
            detailOne: widget.missionRocket.engines.version,
            iconTwo: Icons.layers_outlined,
            headerTwo: 'Layout',
            detailTwo: widget.missionRocket.engines.layout),
        RowDoubleColumn(
            iconOne: Icons.waves_outlined,
            headerOne: 'Sea level',
            detailOne: widget.missionRocket.engines.isp.seaLevel,
            iconTwo: Icons.ac_unit_outlined,
            headerTwo: 'Vacuum',
            detailTwo: widget.missionRocket.engines.isp.vacuum),
      ],
    );
  }
}
