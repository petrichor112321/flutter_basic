import 'package:flutter/material.dart';
import 'package:scan/scan.dart';


class Logic {
  ScanController controller = ScanController();
}

class ScanPage extends StatefulWidget {
  const ScanPage({Key? key}) : super(key: key);

  @override
  State<ScanPage> createState() => _QrscanState();
}

class _QrscanState extends State<ScanPage> {
  ScanController controller = ScanController();

//String result = await Scan.parse(imagePath);图片识别
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Stack(
      alignment: Alignment.center,
      children: [
        ScanView(
          controller: controller,
          scanAreaScale: .6,
          scanLineColor: const Color(0xFF00ECD7),
          onCapture: (data) {
            print('data: $data');

            // Get.back(result: data);
          },
        ),
        AppBar(
            elevation: 0,
            title: Text(
              '扫描二维码',
              style: TextStyle(fontSize: 23,color: Colors.white),

            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            leading: GestureDetector(
              child: Container(
                color: Colors.transparent,
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 23,
                ),
              ),
              onTap: () {
                Navigator.pop(context);

              },
            )),
        Positioned(
            bottom: 150,
            child: Wrap(
              spacing: 30,
              children: [
                Icon(
                  Icons.photo,
                  size: 50,
                ),
                Icon(
                  Icons.camera_alt,
                  size: 50,
                ),
              ],
            ))
      ],
    );
  }
}