import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobile_assignment/common/cubits/theme_cubit.dart';
import 'package:mobile_assignment/common/themes/custom_theme_data.dart';
import 'package:provider/provider.dart';

extension ContextExtension on BuildContext {
  CustomThemeData get theme => watch<ThemeCubit>().state;
  CustomThemeData get readTheme => read<ThemeCubit>().state;
  AppLocalizations get strings => AppLocalizations.of(this)!;

  MediaQueryData get mediaQuery => MediaQuery.of(this);
  EdgeInsets get padding => mediaQuery.padding;
  double get width => mediaQuery.size.width;

  NavigatorState get navigator => Navigator.of(this);

  Future<T?> push<T>(Widget page) => navigator.push<T>(
        CupertinoPageRoute(
          builder: (context) => page,
        ),
      );

  void pop() => navigator.pop();
}
