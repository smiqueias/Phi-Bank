import 'dart:async';

import 'package:flutter/material.dart';
import 'package:phi_mobile_challenge/src/core/components/loading_component.dart';
import 'package:phi_mobile_challenge/src/features/statement/view-model/user_balance_vm.dart';
import 'package:phi_mobile_challenge/src/features/statement/view-model/user_statement_vm.dart';
import 'package:provider/provider.dart';

class SplashContainer extends StatefulWidget {
  const SplashContainer({Key? key}) : super(key: key);

  @override
  State<SplashContainer> createState() => _SplashContainerState();
}

class _SplashContainerState extends State<SplashContainer> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      context.read<IUserBalanceVM>().getUserBalance();
      context.read<IUserStatementVM>().getUserStatement();
      Timer(const Duration(seconds: 1), () {
        Navigator.pushNamed(context, '/user-balance');
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: LoadingComponent(),
      ),
    );
  }
}
