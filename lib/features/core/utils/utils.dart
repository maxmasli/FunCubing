import 'package:funcubing/resources/resources.dart';

String millisToString(int? millis) {
  if (millis == null || millis == -1) return "DNF";
  if (millis == -2) return "DNS";
  if (millis == 0) return "";
  var result = "";
  final hours = millis ~/ 360000;
  var timestamp = millis % 360000;
  final minutes = timestamp ~/ 6000;
  timestamp %= 6000;
  final seconds = timestamp ~/ 100;
  final m = timestamp % 100;
  if (hours != 0) {
    result += "$hours:";
  }
  if (minutes != 0 && hours != 0) {
    if (minutes < 10) {
      result += "0$minutes:";
    } else {
      result += "$minutes:";
    }
  }
  if (minutes != 0 && hours == 0) {
    result += "$minutes:";
  }
  if (minutes == 0 && hours != 0) {
    result += "00:";
  }
  if (seconds != 0 && minutes != 0) {
    if (seconds < 10) {
      result += "0$seconds.";
    } else {
      result += "$seconds.";
    }
  }
  if (seconds != 0 && minutes == 0) {
    result += "$seconds.";
  }
  if (seconds == 0 && minutes != 0) {
    result += "00.";
  }
  if (seconds == 0 && minutes == 0 && hours != 0) {
    result += "00:00.";
  }
  if (seconds == 0 && minutes == 0 && hours == 0) {
    result += "0.";
  }

  if (m == 0) {
    result += "00";
  } else if (m < 10) {
    result += "0$m";
  } else if (m < 100) {
    result += "$m";
  }
  return result;
}

String? getAssetNameById(String id) {
  switch (id){
    case "333": return Assets.c333;
    case "222": return Assets.c222;
    case "444": return Assets.c444;
    case "555": return Assets.c555;
    case "666": return Assets.c666;
    case "777": return Assets.c777;
    case "333oh": return Assets.c333oh;
    case "clock": return Assets.clock;
    case "minx": return Assets.minx;
    case "pyram": return Assets.pyram;
    case "skewb": return Assets.skewb;
    case "333bf": return Assets.c333bf;
    case "333fm": return Assets.c333fm;
    case "333mbf": return Assets.c333mbf;
    case "sq1": return Assets.sq1;
    case "444bf": return Assets.c444bf;
    default: return null;
  }
}