import 'package:engineering_exercise/common/extensions/context.dart';
import 'package:engineering_exercise/common/helpers/snack_bar.dart';
import 'package:engineering_exercise/core/home/logic/cubit.dart';
import 'package:engineering_exercise/core/vehicle_type_selection/page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'button.dart';
import 'logo.dart';
import 'search_bar.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  final _searchCtrlr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 22.5,
        right: 22.5,
        top: 190,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const HomeRodoLogo(),
          const SizedBox(height: 30),
          HomeSearchBar(
            textEditingCtrlr: _searchCtrlr,
          ),
          const SizedBox(height: 80),
          HomeOutlinedButton(
            onTap: () => _onSearchByVehicleTypeTapped(context),
            text: context.strings.searchByVehicleType,
          ),
          const SizedBox(height: 20),
          HomeOutlinedButton(
            onTap: () => _onSeeDealsTapped(context),
            text: context.strings.seeDealsOfTheDay,
          )
        ],
      ),
    );
  }

  void _onSearchByVehicleTypeTapped(BuildContext context) {
    context.push(const VehicleTypeSelectionPage());
  }

  Future<void> _onSeeDealsTapped(BuildContext context) async {
    final query = _searchCtrlr.text;

    if (query.length < 3) {
      SnackBarHelper.showError(
        context,
        message: context.strings.enterThreeChars,
      );

      return;
    }

    await context.read<HomeCubit>().searchVehiclesByMakeOrModel(
          _searchCtrlr.text,
        );
  }
}
