import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:phi_mobile_challenge/src/core/app_colors.dart';
import 'package:phi_mobile_challenge/src/features/details/model/detail_model.dart';
import 'package:phi_mobile_challenge/src/features/details/view/components/label_component.dart';
import '../../../../utils/extensions/string_extension.dart';

class DetailScreen extends StatefulWidget {
  final DetailModel? detailModel;

  final NumberFormat real = NumberFormat.currency(locale: "pt_BR", name: "R\$");

  DetailScreen({Key? key, required this.detailModel}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 12),
          child: Column(
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
                        label2: widget.detailModel!.description,
                        size: size,
                      ),
                      const SizedBox(height: 40),
                      LabelComponent(
                        label1: "Valor",
                        label2: widget.real.format(widget.detailModel!.amount),
                        size: size,
                      ),
                      const SizedBox(height: 40),
                      LabelComponent(
                        label1: "Recebedor",
                        label2: widget.detailModel!.to,
                        size: size,
                      ),
                      const SizedBox(height: 40),
                      LabelComponent(
                        label1: "Instituição bancária",
                        label2: widget.detailModel!.bankName,
                        size: size,
                      ),
                      const SizedBox(height: 40),
                      LabelComponent(
                        label1: "Data/Hora",
                        label2: widget.detailModel!.createdAt.dateFormatWithTime(),
                        size: size,
                      ),
                      const SizedBox(height: 40),
                      LabelComponent(
                        label1: "Autentificação",
                        label2: widget.detailModel!.authentication,
                        size: size,
                      ),
                      const SizedBox(height: 40),
                      Center(
                        child: ElevatedButton(
                          onPressed: () => print("share"),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 64, vertical: 8),
                            child: Text(
                              "Compartilhar",
                              style: TextStyle(color: AppColors.white, fontSize: 18),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: AppColors.cyan,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
