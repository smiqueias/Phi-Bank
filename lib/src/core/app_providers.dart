import 'package:phi_mobile_challenge/src/core/service/dio_service.dart';
import 'package:phi_mobile_challenge/src/features/details/repository/detail_repository.dart';
import 'package:phi_mobile_challenge/src/features/details/view-model/detail_vm.dart';
import 'package:phi_mobile_challenge/src/features/statement/repositories/user_balance_repository.dart';
import 'package:phi_mobile_challenge/src/features/statement/repositories/user_statement_repository.dart';
import 'package:phi_mobile_challenge/src/features/statement/view-model/user_balance_vm.dart';
import 'package:phi_mobile_challenge/src/features/statement/view-model/user_statement_vm.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class AppProviders {
  static List<SingleChildWidget> providers = [
    Provider<IDioService>(create: (context) => DioService()),
    Provider<IUserBalanceRepository>(create: (context) => UserBalanceRepository(context.read<IDioService>())),
    Provider<IUserStatementRepository>(create: (context) => UserStatementRepository(context.read<IDioService>())),
    Provider<IDetailRepository>(create: (context) => DetailRepository(context.read<IDioService>())),
    ChangeNotifierProvider<IUserBalanceVM>(create: (context) => UserBalanceVMImpl(context.read<IUserBalanceRepository>())),
    ChangeNotifierProvider<IUserStatementVM>(create: (context) => UserStatementVM(context.read<IUserStatementRepository>())),
    ChangeNotifierProvider<IDetailVM>(create: (context) => DetailVM(context.read<IDetailRepository>())),
  ];
}
