import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:phi_mobile_challenge/src/core/app_colors.dart';
import 'package:phi_mobile_challenge/src/features/details/model/detail_model.dart';
import 'package:phi_mobile_challenge/src/features/details/view/components/proof_component.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class DetailScreen extends StatefulWidget {
  final DetailModel? detailModel;

  const DetailScreen({Key? key, required this.detailModel}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final ScreenshotController _screenshotController = ScreenshotController();

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
              Screenshot(
                controller: _screenshotController,
                child: Container(
                  color: AppColors.white,
                  child: ProofComponent(
                    detailModel: widget.detailModel!,
                    size: size,
                  ),
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    final proof = await _screenshotController.capture();
                    _saveAndShare(proof);
                  },
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
      ),
    );
  }

  Future _saveAndShare(Uint8List? proof) async {
    final directory = await getApplicationDocumentsDirectory();
    final image = File('${directory.path}/proof.png');
    image.writeAsBytesSync(proof!);
    await Share.shareFiles([image.path]);
  }
}
