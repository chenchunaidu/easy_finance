import 'dart:io';
import 'dart:typed_data';

import 'package:easy_finance/components/common/vstack.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ScreenshotWrapper extends StatefulWidget {
  const ScreenshotWrapper({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  _ScreenshotWrapperState createState() => _ScreenshotWrapperState();
}

class _ScreenshotWrapperState extends State<ScreenshotWrapper> {
  ScreenshotController screenshotController = ScreenshotController();

  onPressed() async {
    await screenshotController
        .capture(delay: const Duration(milliseconds: 10))
        .then((image) async {
      if (image != null) {
        final directory = await getApplicationDocumentsDirectory();
        final imagePath = await File('${directory.path}/image.png').create();
        await imagePath.writeAsBytes(image);

        /// Share Plugin
        await Share.shareFiles([imagePath.path]);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return VStack(children: [
      Screenshot(
        controller: screenshotController,
        child: Container(
          child: widget.child,
          color: Colors.grey[850],
        ),
      ),
      OutlinedButton(onPressed: onPressed, child: Text("Share"))
    ]);
  }
}
