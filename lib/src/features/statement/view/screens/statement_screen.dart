import 'package:flutter/material.dart';
import 'package:phi_mobile_challenge/src/core/app_colors.dart';
import 'package:phi_mobile_challenge/src/core/components/loading_component.dart';
import 'package:phi_mobile_challenge/src/features/statement/view-model/user_statement_vm.dart';
import 'package:phi_mobile_challenge/src/features/statement/view/components/top_header_component.dart';
import 'package:phi_mobile_challenge/src/features/statement/view/components/user_amount_component.dart';
import 'package:phi_mobile_challenge/src/features/statement/view/components/user_statement_component.dart';
import 'package:provider/provider.dart';

class StatementScreen extends StatefulWidget {
  const StatementScreen({Key? key}) : super(key: key);

  @override
  State<StatementScreen> createState() => _StatementScreenState();
}

class _StatementScreenState extends State<StatementScreen> {
  late final ScrollController _scrollController;

  int _offSet = 1;

  //bool _isLoading = false;

  _infiniteScroll() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      if (!Provider.of<IUserStatementVM>(context, listen: false).isLastPage) {
        // _isLoading = true;
        _offSet++;
        Provider.of<IUserStatementVM>(context, listen: false).getUserStatement(offSet: _offSet.toString());
      }
    }
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_infiniteScroll);

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _scrollController.removeListener(_infiniteScroll);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _infiniteScrollList = Provider.of<IUserStatementVM>(context, listen: true).infiniteScrollList;
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TopHeaderComponent(),
        SizedBox(
          height: size.height * 0.02,
        ),
        UserAmountComponent(size: size),
        SizedBox(
          height: size.height * 0.02,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 12),
          child: Text(
            "Suas movimentações",
            style: TextStyle(
              color: AppColors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.04,
        ),
        Expanded(
          flex: 1,
          child: ListView.builder(
            controller: _scrollController,
            shrinkWrap: true,
            itemCount: _infiniteScrollList.length,
            itemBuilder: (context, index) {
              return UserStatementComponent(
                size: size,
                index: index,
                statement: _infiniteScrollList[index],
              );
            },
          ),
        ),
        Provider.of<IUserStatementVM>(context, listen: false).isLoading ? const LoadingComponent() : const SizedBox.shrink()
      ],
    );
  }
}
