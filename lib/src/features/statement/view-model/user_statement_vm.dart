import 'package:flutter/cupertino.dart';
import 'package:phi_mobile_challenge/src/features/statement/models/user_statement_model.dart';
import 'package:phi_mobile_challenge/src/features/statement/repositories/user_statement_repository.dart';
import 'package:phi_mobile_challenge/src/utils/log.dart';

abstract class IUserStatementVM extends ChangeNotifier {
  bool get isLoading;
  bool get hasError;
  bool get isLastPage;
  String get errorMessage;
  UserStatementModel? get userStatement;
  List<Statement> get infiniteScrollList;

  Future<void> getUserStatement({String offSet});
}

class UserStatementVM extends ChangeNotifier implements IUserStatementVM {
  UserStatementVM(this._repository);

  final IUserStatementRepository _repository;

  final List<Statement> _infiniteScrollList = [];

  bool _isLoading = false;

  bool _isLastPage = false;

  String _errorMessage = "";

  UserStatementModel? _userStatement;

  void _setLoading({bool value = false}) {
    _isLoading = value;
    notifyListeners();
  }

  void _setError({String value = ""}) {
    _errorMessage = value;
    notifyListeners();
  }

  @override
  Future<void> getUserStatement({String offSet = "1"}) async {
    _setError(value: "");
    try {
      _setLoading(value: true);
      final statements = await _repository.getUserStatement(offSet: offSet);
      if (statements.statements.isEmpty) {
        _isLastPage = true;
        notifyListeners();
      }
      _userStatement = statements;
      _infiniteScrollList.addAll(statements.statements);
    } catch (e, st) {
      Log.log(
        "Error in UserStatementVM",
        name: "Phi Mobile Challenge",
        error: e,
        stackTrace: st,
      );
      _setError(value: "Ocorreu um erro. Verifique sua conexão e tente novamente.");
    } finally {
      _setLoading();
    }
  }

  @override
  bool get hasError => _errorMessage.isNotEmpty;

  @override
  bool get isLoading => _isLoading;

  @override
  UserStatementModel? get userStatement => _userStatement;

  @override
  String get errorMessage => _errorMessage;

  @override
  List<Statement> get infiniteScrollList => _infiniteScrollList;

  @override
  bool get isLastPage => _isLastPage;
}
