import 'package:flutter/material.dart';
import 'package:funcubing/features/competition_details/view/competition_details_page.dart';
import 'package:funcubing/features/competitions_page/competitions_page.dart';
import 'package:funcubing/features/competitor_details/view/competitor_details_page.dart';
import 'package:funcubing/features/main_page/main_page.dart';

final routes = {
  '/': (BuildContext context) => const MainPage(),
  '/competitions': (BuildContext context) => const CompetitionsPage(),
  '/competitions/details': (BuildContext context) =>
      const CompetitionDetailsPage(),
  '/competitions/details/competitor': (BuildContext context) =>
      const CompetitorDetailsPage(),
};

const initialRoute = '/';
