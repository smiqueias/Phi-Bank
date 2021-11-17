import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:phi_mobile_challenge/src/core/app_colors.dart';
import 'package:phi_mobile_challenge/src/features/details/model/detail_model.dart';
import '../../../../utils/extensions/string_extension.dart';
import 'label_component.dart';

class ProofComponent extends StatelessWidget {
  final Size size;
  final DetailModel detailModel;

  const ProofComponent({Key? key, required this.size, required this.detailModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NumberFormat real = NumberFormat.currency(locale: "pt_BR", name: "R\$");

    return Column(
      children: [
        const Center(
          child: Text(
            'Comprovante',
            style: TextStyle(
              fontSize: 18,
              color: AppColors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 18),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 12.0),
          height: 1,
          color: AppColors.black.withOpacity(0.4),
        ),
        const SizedBox(height: 18),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LabelComponent(
                  label1: "Tipo de movimentação",
                  label2: detailModel.description,
                  size: size,
                ),
                const SizedBox(height: 40),
                LabelComponent(
                  label1: "Valor",
                  label2: real.format(detailModel.amount),
                  size: size,
                ),
                const SizedBox(height: 40),
                LabelComponent(
                  label1: "Recebedor",
                  label2: detailModel.to,
                  size: size,
                ),
                const SizedBox(height: 40),
                LabelComponent(
                  label1: "Instituição bancária",
                  label2: detailModel.bankName,
                  size: size,
                ),
                const SizedBox(height: 40),
                LabelComponent(
                  label1: "Data/Hora",
                  label2: detailModel.createdAt.dateFormatWithTime(),
                  size: size,
                ),
                const SizedBox(height: 40),
                LabelComponent(
                  label1: "Autentificação",
                  label2: detailModel.authentication,
                  size: size,
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        )
      ],
    );
  }
}
