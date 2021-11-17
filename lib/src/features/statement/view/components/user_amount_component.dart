import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:phi_mobile_challenge/src/core/app_colors.dart';
import 'package:phi_mobile_challenge/src/features/statement/view-model/user_balance_vm.dart';
import 'package:phi_mobile_challenge/src/utils/constants/boxes.dart';
import 'package:provider/provider.dart';

class UserAmountComponent extends StatefulWidget {
  final Size size;

  const UserAmountComponent({Key? key, required this.size}) : super(key: key);

  @override
  State<UserAmountComponent> createState() => _UserAmountComponentState();
}

class _UserAmountComponentState extends State<UserAmountComponent> {
  final NumberFormat real = NumberFormat.currency(locale: "pt_BR", name: "R\$");

  bool _showAmount = true;

  @override
  void initState() {
    _showAmount = Hive.box(amountVisibilityBox).get("visibility");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Hive.box(amountVisibilityBox).put('visibility', _showAmount);
    return Container(
      height: widget.size.height * 0.12,
      width: widget.size.width,
      color: AppColors.grey.withOpacity(0.1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
            child: Row(
              children: [
                const Text(
                  "Seu saldo",
                  style: TextStyle(
                    fontSize: 15,
                    color: AppColors.black,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _showAmount = !_showAmount;
                    });
                  },
                  icon: _showAmount ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
                  iconSize: 22,
                  color: AppColors.cyan,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Consumer<IUserBalanceVM>(
              builder: (context, userBalanceVM, child) {
                return _showAmount
                    ? Text(
                        real.format(userBalanceVM.userBalance?.amount ?? 0),
                        style: const TextStyle(
                          color: AppColors.cyan,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : Container(
                        height: widget.size.height * 0.006,
                        width: widget.size.width * 0.35,
                        margin: const EdgeInsets.only(top: 8),
                        color: AppColors.cyan,
                      );
              },
            ),
          )
        ],
      ),
    );
  }
}
