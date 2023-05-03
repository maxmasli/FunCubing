// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "competitions": "Competitions",
  "competitors": "Competitors",
  "something_went_wrong": "Something went wrong :(",
  "try_again": "Try again",
  "competition": "Competition",
  "events": "Events",
  "members": "Members",
  "results": "Results",
  "event": "Event",
  "round": "Round",
  "format": "Format",
  "cutoff": "Cutoff",
  "limit": "Limit",
  "advance_to_next_round": "Advance to next round",
  "position": "Position",
  "name": "Name",
  "average": "Average",
  "best": "Best",
  "attempts": "Attempts",
  "can_not_open_competitor_info": "Can't open competitor info",
  "current_personal_records": "Current personal records",
  "date": "Date"
};
static const Map<String,dynamic> ru = {
  "competitions": "Соревнования",
  "competitors": "Участники",
  "something_went_wrong": "Что-то пошло не так :(",
  "try_again": "Попробовать снова",
  "competition": "Сорвевнование",
  "events": "Дисциплины",
  "members": "Участники",
  "results": "Результаты",
  "event": "Дисциплина",
  "round": "Раунд",
  "format": "Формат",
  "cutoff": "Катофф",
  "limit": "Лимит",
  "advance_to_next_round": "Проходят дальше",
  "position": "Место",
  "name": "Имя",
  "average": "Среднее",
  "best": "Лучшее",
  "attempts": "Сборки",
  "can_not_open_competitor_info": "Нельзя открыть информацию об участнике",
  "current_personal_records": "Текущие личные рекорды",
  "date": "Дата"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "ru": ru};
}
