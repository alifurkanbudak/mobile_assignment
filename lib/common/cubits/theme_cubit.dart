import 'package:bloc/bloc.dart';
import 'package:mobile_assignment/common/themes/custom_theme_data.dart';

class ThemeCubit extends Cubit<CustomThemeData> {
  ThemeCubit(CustomThemeData theme) : super(theme);

  void changeTheme(CustomThemeData newTheme) {
    emit(newTheme);
  }
}
