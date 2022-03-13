import 'package:bloc/bloc.dart';
import 'package:engineering_exercise/common/themes/custom_theme_data.dart';

class ThemeCubit extends Cubit<CustomThemeData> {
  ThemeCubit(CustomThemeData theme) : super(theme);

  void changeTheme(CustomThemeData newTheme) {
    emit(newTheme);
  }
}
