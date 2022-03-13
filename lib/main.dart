import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobile_assignment/common/cubits/theme_cubit.dart';
import 'package:mobile_assignment/common/themes/dark_theme.dart';
import 'package:mobile_assignment/core/tab_layout/tab_layout.page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'common/themes/custom_theme_data.dart';
import 'core/home/logic/cubit.dart';
import 'core/home/logic/service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final initialTheme = await _getInitialTheme();
  runApp(
    MyApp(
      initialTheme: initialTheme,
    ),
  );
}

Future<CustomThemeData> _getInitialTheme() async {
  final prefs = await SharedPreferences.getInstance();
  final isDark = prefs.getBool('isDark') ?? true;

  return isDark ? darkTheme : darkTheme;
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.initialTheme,
  }) : super(key: key);

  final CustomThemeData initialTheme;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: _rootProviders,
      child: BlocBuilder<ThemeCubit, CustomThemeData>(
        builder: (context, theme) => MaterialApp(
          home: const TabLayoutPage(),
          theme: theme.themeData,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          builder: (context, child) => ScrollConfiguration(
            behavior: const MyScrollBehavior(),
            child: child ?? const SizedBox(),
          ),
        ),
      ),
    );
  }

  List<BlocProvider> get _rootProviders => [
        BlocProvider<ThemeCubit>(
          create: (_) => ThemeCubit(initialTheme),
        ),
        BlocProvider<HomeCubit>(
          create: (_) => HomeCubit(
            service: HomeServiceImpl(),
          ),
        ),
      ];
}

class MyScrollBehavior extends ScrollBehavior {
  const MyScrollBehavior();
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const BouncingScrollPhysics();
  }
}
