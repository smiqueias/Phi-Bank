import 'package:flutter/material.dart';
import 'package:phi_mobile_challenge/src/features/statement/view-model/user_balance_vm.dart';
import 'package:phi_mobile_challenge/src/features/statement/view-model/user_statement_vm.dart';
import 'package:phi_mobile_challenge/src/features/statement/view/screens/statement_error_screen.dart';
import 'package:phi_mobile_challenge/src/features/statement/view/screens/statement_screen.dart';
import 'package:provider/provider.dart';

class StatementContainer extends StatelessWidget {
  const StatementContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userBalanceVM = context.watch<IUserBalanceVM>();
    final userStatementVM = context.watch<IUserStatementVM>();
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => _refreshUserData(userBalanceVM, userStatementVM),
        child: SafeArea(
          child: Consumer<IUserStatementVM>(
            builder: (context, userStatementVM, _) {
              if (userStatementVM.hasError || userBalanceVM.hasError) {
                return const StatementeErrorScreen();
              }
              return const StatementScreen();
            },
          ),
        ),
      ),
    );
  }

  _refreshUserData(IUserBalanceVM userBalanceVM, IUserStatementVM userStatementVM) async {
    await userBalanceVM.getUserBalance();
    await userStatementVM.getUserStatement();
  }
}
