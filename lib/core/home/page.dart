import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_assignment/common/extensions/context.dart';
import 'package:mobile_assignment/common/helpers/snack_bar.dart';
import 'package:mobile_assignment/core/home/logic/cubit.dart';
import 'package:mobile_assignment/core/home/logic/states.dart';
import 'package:mobile_assignment/core/home/widgets/body.dart';

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
    if (state is HomeDataState) {
      debugPrint(state.searchResult.toJson.toString());
    } else if (state is HomeErrorState) {
      SnackBarHelper.showError(
        context,
        message: context.strings.errorGettingDeals,
      );
    }
  }
}
