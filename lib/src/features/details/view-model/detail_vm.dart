import 'package:flutter/cupertino.dart';
import 'package:phi_mobile_challenge/src/features/details/model/detail_model.dart';
import 'package:phi_mobile_challenge/src/features/details/repository/detail_repository.dart';
import 'package:phi_mobile_challenge/src/utils/log.dart';

abstract class IDetailVM extends ChangeNotifier {
  bool get isLoading;
  bool get hasError;
  DetailModel? get statementDetail;
  Future<void> getStatementDetail({required String id});
}

class DetailVM extends ChangeNotifier implements IDetailVM {
  final IDetailRepository _detailRepository;

  DetailVM(this._detailRepository);

  bool _isLoading = false;

  String _errorMessage = "";

  DetailModel? _statementDetail;

  void _setLoading({bool value = false}) {
    _isLoading = value;
    notifyListeners();
  }

  void _setError({String value = ""}) {
    _errorMessage = value;
    notifyListeners();
  }

  @override
  Future<void> getStatementDetail({required String id}) async {
    try {
      _setError(value: "");
      _setLoading(value: true);
      _statementDetail = await _detailRepository.getStatementDetail(id: id);
    } catch (e, st) {
      Log.log(
        "Error in DetailVM",
        name: "Phi Mobile Challenge",
        error: e,
        stackTrace: st,
      );
    } finally {
      _setLoading();
    }
  }

  @override
  bool get hasError => _errorMessage.isNotEmpty;

  @override
  bool get isLoading => _isLoading;

  @override
  DetailModel? get statementDetail => _statementDetail;
}
