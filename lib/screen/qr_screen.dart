import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:parkcaching_v3/screen/ready_for_ar.dart';

class QRScreen extends StatefulWidget {
  @override
  _QRScreenState createState() => _QRScreenState();
}

class _QRScreenState extends State<QRScreen> {
  final GlobalKey<State<StatefulWidget>> _qrKey =
      GlobalKey<State<StatefulWidget>>();
  QRViewController? _controller;

  String _qrCodeResult = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void _onQRViewCreated(QRViewController controller) {
    // Dispose of any existing controller before assigning the new one
    _controller?.dispose();
    
    setState(() {
      _controller = controller;
    });

    _controller?.scannedDataStream.listen((scanData) {
      if (scanData.code!.isNotEmpty) {
        setState(() {
          _qrCodeResult = scanData.code!;
        });
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ReadyForARScreen(_qrCodeResult),
          ),
        ).then((_) {
          _controller?.resumeCamera(); 
        });
        _controller?.pauseCamera();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Column(
        children: [
          SizedBox(height: 40),
          Expanded(
            flex: 4,
            child: Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent, width: 4),
                borderRadius: BorderRadius.circular(10),
              ),
              child: QRView(
                key: _qrKey,
                onQRViewCreated: _onQRViewCreated,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Resultado del escaneo:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 2),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      _qrCodeResult,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}