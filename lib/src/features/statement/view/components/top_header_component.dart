import 'package:flutter/material.dart';
import 'package:phi_mobile_challenge/src/core/app_colors.dart';

class TopHeaderComponent extends StatelessWidget {
  const TopHeaderComponent({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 25),
        child: const Text(
          'Extrato',
          style: TextStyle(
            color: AppColors.black,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
