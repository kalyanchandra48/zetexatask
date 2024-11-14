



import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';
import 'package:zetexa/pages/qr_generator_screen.dart';

class HomeScreenQRScanner extends StatefulWidget{
  @override
  State<HomeScreenQRScanner> createState() => _HomeScreenQRScannerState();
}

class _HomeScreenQRScannerState extends State<HomeScreenQRScanner> {
    QRViewController? controller;
  Barcode? result;

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    handlePermissions();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 500,
          
            child: QRView(key: qrKey, onQRViewCreated: _onQRViewCreated),),
          ElevatedButton(onPressed: (){
            print(controller?.hasPermissions??false);
          }, child: Text('Scan'))
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }
  
  void handlePermissions()async {
    await Permission.camera.request();
  }
}


class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreenQRScanner()));
        
            }, child: Text('QR Code Scanner')),


            SizedBox(
              height: 20,
            ),

            ElevatedButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>QRGeneratorScreen()));

        
            }, child: Text('QR Code Generator'))
          ],
        ),
      ),

    );
  }
}