import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:phi_mobile_challenge/src/core/app_colors.dart';
import 'package:phi_mobile_challenge/src/features/statement/models/user_statement_model.dart';
import 'package:phi_mobile_challenge/src/features/statement/view-model/user_statement_vm.dart';
import 'package:provider/provider.dart';
import 'package:timeline_tile/timeline_tile.dart';
import '../../../../utils/extensions/string_extension.dart';

class UserStatementComponent extends StatelessWidget {
  final Size size;
  final int index;
  final Statement statement;

  final NumberFormat real = NumberFormat.currency(locale: "pt_BR", name: "R\$");

  UserStatementComponent({
    Key? key,
    required this.size,
    required this.index,
    required this.statement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(
        context,
        '/detail',
        arguments: statement.id,
      ),
      child: Container(
        height: size.height * 0.15,
        width: size.width,
        margin: const EdgeInsets.symmetric(horizontal: 13),
        child: TimelineTile(
          beforeLineStyle: const LineStyle(
            color: Colors.grey,
            thickness: 2,
          ),
          axis: TimelineAxis.vertical,
          indicatorStyle: IndicatorStyle(
              width: 10,
              height: 10,
              padding: const EdgeInsets.all(1),
              indicator: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.cyan,
                ),
              )),
          endChild: Container(
            width: size.width,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Consumer<IUserStatementVM>(
              builder: (context, userStatementVM, _) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        statement.description,
                        style: const TextStyle(color: AppColors.black, fontSize: 14),
                      ),
                      Visibility(
                        visible: statement.description.contains("PIX"),
                        child: Container(
                          height: 17,
                          width: 40,
                          color: AppColors.cyan,
                          child: const Center(
                            child: Text(
                              "PIX",
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        statement.to ?? "",
                        style: TextStyle(color: AppColors.grey.withOpacity(0.8)),
                      ),
                      Text(
                        statement.createdAt.dateFormat(),
                        style: TextStyle(color: AppColors.grey.withOpacity(0.8)),
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    children: [
                      Visibility(
                        visible: statement.description.contains("realizada") || statement.description.contains("enviada"),
                        child: const Text("- "),
                      ),
                      Text(
                        real.format(statement.amount),
                        style: const TextStyle(
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
