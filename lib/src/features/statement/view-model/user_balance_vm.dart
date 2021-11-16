import 'package:flutter/cupertino.dart';
import 'package:phi_mobile_challenge/src/features/statement/models/user_balance_model.dart';
import 'package:phi_mobile_challenge/src/features/statement/repositories/user_balance_repository.dart';
import 'package:phi_mobile_challenge/src/utils/log.dart';

abstract class IUserBalanceVM extends ChangeNotifier {
  bool get isLoading;
  bool get hasError;
  String get errorMessage;
  UserBalanceModel? get userBalance;
  Future<void> getUserBalance();
}

class UserBalanceVMImpl extends ChangeNotifier implements IUserBalanceVM {
  final IUserBalanceRepository _userBalanceRepository;

  UserBalanceVMImpl(this._userBalanceRepository);

  bool _isLoading = false;

  String _errorMessage = '';

  UserBalanceModel? _userBalance;

  void _setLoading({bool value = false}) {
    _isLoading = value;
    notifyListeners();
  }

  void _setError({String value = ""}) {
    _errorMessage = value;
    notifyListeners();
  }

  @override
  Future<void> getUserBalance() async {
    try {
      _setError(value: "");
      _setLoading(value: true);
      _userBalance = await _userBalanceRepository.getUserBalance();
    } catch (e, st) {
      Log.log(
        "Error in UserBalanceVM",
        name: "Phi Mobile Challenge",
        error: e,
        stackTrace: st,
      );
      _setError(value: "Ocorreu um erro. Tente novamente");
    } finally {
      _setLoading();
    }
  }

  @override
  String get errorMessage => _errorMessage;

  @override
  bool get hasError => _errorMessage.isNotEmpty;

  @override
  bool get isLoading => _isLoading;

  @override
  UserBalanceModel? get userBalance => _userBalance;
}
