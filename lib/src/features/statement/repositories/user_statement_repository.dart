import 'package:phi_mobile_challenge/src/core/services/dio_service.dart';
import 'package:phi_mobile_challenge/src/features/statement/models/user_statement_model.dart';
import 'package:phi_mobile_challenge/src/utils/log.dart';

abstract class IUserStatementRepository {
  Future<UserStatementModel> getUserStatement({String offSet});
}

class UserStatementRepository implements IUserStatementRepository {
  final IDioService _dioService;

  UserStatementRepository(this._dioService);

  @override
  Future<UserStatementModel> getUserStatement({String offSet = "1"}) async {
    try {
      final response = await _dioService.getDio().get("/myStatement/10/$offSet");
      return UserStatementModel.fromJson(response.data);
    } catch (e, st) {
      Log.log(
        "Error in UserStatementRepository",
        name: "Phi Mobile Challenge",
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }
}
