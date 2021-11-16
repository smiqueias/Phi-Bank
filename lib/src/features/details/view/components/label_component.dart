import 'package:flutter/material.dart';
import 'package:phi_mobile_challenge/src/core/app_colors.dart';

class LabelComponent extends StatelessWidget {
  final String label1;
  final String label2;
  final Size size;

  const LabelComponent({
    Key? key,
    required this.label1,
    required this.label2,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label1,
          style: const TextStyle(
            fontSize: 18,
            color: AppColors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          label2,
          style: const TextStyle(
            fontSize: 20,
            color: AppColors.black,
          ),
        ),
      ],
    );
  }
}
