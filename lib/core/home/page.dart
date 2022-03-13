import 'package:engineering_exercise/common/extensions/context.dart';
import 'package:engineering_exercise/common/helpers/snack_bar.dart';
import 'package:engineering_exercise/core/home/logic/cubit.dart';
import 'package:engineering_exercise/core/home/logic/states.dart';
import 'package:engineering_exercise/core/home/widgets/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listener: _listener,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: context.theme.scaffold.brightness == Brightness.dark
            ? SystemUiOverlayStyle.light
            : SystemUiOverlayStyle.dark,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: const Scaffold(
            resizeToAvoidBottomInset: false,
            body: HomePageBody(),
          ),
        ),
      ),
    );
  }

  void _listener(BuildContext context, HomeState state) {
    if (state is HomeErrorState) {
      SnackBarHelper.showError(
        context,
        message: context.strings.errorGettingDeals,
      );
    }
  }
}
