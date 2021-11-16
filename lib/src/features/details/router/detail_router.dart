import 'package:flutter/material.dart';
import 'package:phi_mobile_challenge/src/features/details/view/container/detail_container.dart';

class DetailRouter extends StatelessWidget {
  const DetailRouter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as String;

    return DetailContainer(id: args);
  }
}
