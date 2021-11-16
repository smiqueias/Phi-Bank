import 'package:phi_mobile_challenge/src/core/service/dio_service.dart';
import 'package:phi_mobile_challenge/src/features/statement/models/user_balance_model.dart';
import 'package:phi_mobile_challenge/src/utils/log.dart';

abstract class IUserBalanceRepository {
  Future<UserBalanceModel> getUserBalance();
}

class UserBalanceRepository implements IUserBalanceRepository {
  final IDioService _dioService;

  UserBalanceRepository(this._dioService);

  @override
  Future<UserBalanceModel> getUserBalance() async {
    try {
      final response = await _dioService.getDio().get('/myBalance');
      return UserBalanceModel.fromJson(response.data);
    } catch (e, st) {
      Log.log(
        "Error in UserBalanceRepository",
        name: "Phi Mobile Challenge",
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }
}
