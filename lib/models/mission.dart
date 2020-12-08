import 'package:spacex/models/rocket.dart';

class Mission {
  final String missionName;
  final String launchYear;
  final String details;
  final String missionRocketId;
  final String tentativeMaxPrecision;
  final int flightNumber;
  final int launchWindow;
  final bool launchSuccess;
  final bool upcoming;
  final bool isTentative;
  final bool toBeDetermined;
  final LaunchSite launchSite;
  final TimeLine timeLine;
  final LaunchFailureDetails launchFailureDetails;
  final Images images;
  String launchDate;
  Rocket missionRocket;

  Mission(
      {this.flightNumber,
      this.missionName,
      this.launchYear,
      this.launchSuccess,
      this.details,
      this.missionRocketId,
      this.isTentative,
      this.toBeDetermined,
      this.tentativeMaxPrecision,
      this.timeLine,
      this.upcoming,
      this.launchDate,
      this.launchWindow,
      this.launchSite,
      this.launchFailureDetails,
      this.images,
      this.missionRocket});

  factory Mission.fromJson(Map<String, dynamic> json) => Mission(
        images: json['links'] != null ? Images.fromJson(json['links']) : null,
        flightNumber: json['flight_number'],
        missionName: json['mission_name'],
        launchYear: json['launch_year'],
        launchSuccess: json['launch_success'],
        launchWindow: json['launch_window'],
        upcoming: json['upcoming'],
        isTentative: json['is_tentative'],
        toBeDetermined: json['tbd'],
        launchDate: json['launch_date_utc'],
        tentativeMaxPrecision: json['tentative_max_precision'],
        details: json['details'],
        launchSite: LaunchSite.fromJson(json['launch_site']),
        timeLine: json['timeline'] != null
            ? TimeLine.fromJson(json['timeline'])
            : null,
        launchFailureDetails: json['launch_failure_details'] != null
            ? LaunchFailureDetails.fromJson(json['launch_failure_details'])
            : null,
        missionRocketId: json['rocket']['rocket_id'],
      );
}

class TimeLine {
  final int webcastLiftoff;

  TimeLine({this.webcastLiftoff});

  factory TimeLine.fromJson(Map<String, dynamic> json) => TimeLine(
        webcastLiftoff:
            json['webcast_liftoff'] != null ? json['webcast_liftoff'] : 0,
      );
}

class LaunchSite {
  final String launchSiteName;

  LaunchSite({this.launchSiteName});

  factory LaunchSite.fromJson(Map<String, dynamic> json) => LaunchSite(
        launchSiteName: json['site_name_long'],
      );
}

class LaunchFailureDetails {
  final int failureTime;
  final String failureReason;
  final int failureAltitude;

  LaunchFailureDetails(
      {this.failureTime, this.failureReason, this.failureAltitude});

  factory LaunchFailureDetails.fromJson(Map<String, dynamic> json) =>
      LaunchFailureDetails(
        failureTime: json['time'],
        failureReason: json['reason'],
        failureAltitude: json['altitude'],
      );
}

class Images {
  String image;
  String imageSmall;
  String articleLink;
  String wikipedia;
  String videoLink;
  String youtubeId;

  Images(
      {this.image,
      this.imageSmall,
      this.articleLink,
      this.wikipedia,
      this.videoLink,
      this.youtubeId});

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        image: json['mission_patch'],
        imageSmall: json['mission_patch_small'],
        articleLink: json['article_link'],
        wikipedia: json['wikipedia'],
        videoLink: json['video_link'],
        youtubeId: json['youtube_id'],
      );
}
