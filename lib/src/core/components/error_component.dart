import 'package:flutter/material.dart';
import 'package:phi_mobile_challenge/src/core/app_colors.dart';
import 'package:phi_mobile_challenge/src/features/details/view-model/detail_vm.dart';
import 'package:provider/provider.dart';

class ErrorComponent extends StatelessWidget {
  final String id;

  const ErrorComponent({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 42.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Ocorreu um erro",
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16.0),
          const Text(
            "Não foi possível carregar seus dados. Verifique a conexão e tente novamente",
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 16.0),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Provider.of<IDetailVM>(context, listen: false).getStatementDetail(id: id);
              },
              child: const Text(
                "Tentar novamente",
                style: TextStyle(fontSize: 16.0, color: AppColors.white),
              ),
              style: ElevatedButton.styleFrom(
                primary: AppColors.cyan,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
