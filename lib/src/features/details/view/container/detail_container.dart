import 'package:flutter/material.dart';
import 'package:phi_mobile_challenge/src/core/components/error_component.dart';
import 'package:phi_mobile_challenge/src/core/components/loading_component.dart';
import 'package:phi_mobile_challenge/src/features/details/view-model/detail_vm.dart';
import 'package:phi_mobile_challenge/src/features/details/view/screens/detail_screen.dart';
import 'package:provider/provider.dart';

class DetailContainer extends StatefulWidget {
  final String id;

  const DetailContainer({Key? key, required this.id}) : super(key: key);

  @override
  State<DetailContainer> createState() => _DetailContainerState();
}

class _DetailContainerState extends State<DetailContainer> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Provider.of<IDetailVM>(context, listen: false).getStatementDetail(id: widget.id);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<IDetailVM>(
        builder: (context, detailVM, _) {
          if (detailVM.isLoading) {
            return const LoadingComponent();
          } else if (detailVM.hasError) {
            return ErrorComponent(id: widget.id);
          }
          return DetailScreen(detailModel: detailVM.statementDetail);
        },
      ),
    );
  }
}
