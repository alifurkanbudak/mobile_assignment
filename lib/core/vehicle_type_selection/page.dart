import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_assignment/common/extensions/context.dart';
import 'package:mobile_assignment/common/helpers/snack_bar.dart';
import 'package:mobile_assignment/common/widgets/app_bar/app_bar.dart';
import 'package:mobile_assignment/core/vehicle_type_selection/logic/cubit.dart';
import 'package:mobile_assignment/core/vehicle_type_selection/logic/service.dart';
import 'package:mobile_assignment/core/vehicle_type_selection/logic/states.dart';
import 'package:mobile_assignment/core/vehicle_type_selection/widgets/body.dart';
import 'package:mobile_assignment/core/vehicle_type_selection/widgets/shimmer.dart';

// I am assuming that vehicle types are dynamic and come from database
// Even if it's not the case, I wanted to show how I would handle backend calls
class VehicleTypeSelectionPage extends StatelessWidget {
  const VehicleTypeSelectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: _create,
      child: BlocConsumer<VehicleTypeSelectionCubit, VehicleTypeSelectionState>(
        builder: _builder,
        listener: _listener,
      ),
    );
  }

  Widget _builder(BuildContext context, VehicleTypeSelectionState state) {
    return Scaffold(
      appBar: MyAppBar(
        title: context.strings.vehicleType,
      ),
      body: _body(context, state),
    );
  }

  Widget _body(_, VehicleTypeSelectionState state) {
    if (state is VehicleTypeSelectionDataState) {
      return VehicleTypeSelectionBody(
        vehicleTypes: state.vehicleTypes,
      );
    } else if (state is VehicleTypeSelectionLoadingErrorState) {
      return const VehicleTypeSelectionBody(
        vehicleTypes: [],
      );
    } else if (state is VehicleTypeSelectionRefreshErrorState) {
      return VehicleTypeSelectionBody(
        vehicleTypes: state.vehicleTypes,
      );
    } else {
      return const VehicleTypesShimmer();
    }
  }

  VehicleTypeSelectionCubit _create(_) {
    return VehicleTypeSelectionCubit(
      service: VehicleTypeSelectionService(),
    )..fetchVehicleTypes();
  }

  void _listener(BuildContext context, VehicleTypeSelectionState state) {
    if (state is VehicleTypeSelectionLoadingErrorState ||
        state is VehicleTypeSelectionRefreshErrorState) {
      SnackBarHelper.showError(
        context,
        message: context.strings.errorGettingVehicleTypes,
      );
    }
  }
}
