import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funcubing/di.dart';
import 'package:funcubing/features/funcubing/presentation/bloc/competitions/competitions_bloc.dart';
import 'package:funcubing/features/funcubing/presentation/pages/competitions_page.dart';
import 'package:funcubing/features/funcubing/presentation/pages/main_page.dart';

const mainPage = '/';
const competitionsPage = '/competitions';

final routes = {
  mainPage: (context) => const MainPage(),
  competitionsPage: (context) =>
      BlocProvider(
        create: (context) => sl<CompetitionsBloc>()..add(CompetitionGetEvent()),
        child: const CompetitionsPage(),
      ),
};

const initialRoute = mainPage;
