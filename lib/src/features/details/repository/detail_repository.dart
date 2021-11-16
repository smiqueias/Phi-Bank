import 'package:phi_mobile_challenge/src/core/service/dio_service.dart';
import 'package:phi_mobile_challenge/src/features/details/model/detail_model.dart';
import 'package:phi_mobile_challenge/src/utils/log.dart';

abstract class IDetailRepository {
  Future<DetailModel> getStatementDetail({required String id});
}

class DetailRepository implements IDetailRepository {
  final IDioService _dioService;

  DetailRepository(this._dioService);

  @override
  Future<DetailModel> getStatementDetail({required String id}) async {
    try {
      final response = await _dioService.getDio().get("/myStatement/detail/$id");
      return DetailModel.fromJson(response.data);
    } catch (e, st) {
      Log.log(
        "Error in DetailRepository",
        name: "Phi Mobile Challenge",
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }
}
