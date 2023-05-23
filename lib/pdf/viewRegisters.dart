import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

import 'PdfApi.dart';

class viewRegisters extends StatefulWidget {
  const viewRegisters({super.key});

  @override
  State<viewRegisters> createState() => _viewRegistersState();
}

class _viewRegistersState extends State<viewRegisters> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Horas de Servicio'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Acciones a realizar cuando se presiona el botón
            _showPDF();
          },
          child: Text('Presionar'),
        ),
      ),
    );
  }

  Future<void> _showPDF() async {
    PdfDocument document = PdfDocument();
    document.pageSettings.size = PdfPageSize.legal;
    document.pageSettings.rotate = PdfPageRotateAngle.rotateAngle90;

    final page = document.pages.add();
    final Size pageSize = page.getClientSize();

    page.graphics.drawImage(
        PdfBitmap(await _readImageData('horas_servicio.jpg')),
        Rect.fromLTWH(0, 0, pageSize.width, pageSize.height));

    page.rotation = PdfPageRotateAngle.rotateAngle90;

    List<int> bytes = await document.save();
    document.dispose();
    saveAndLaunchFile(bytes, 'servicio.pdf');
  }

  Future<List<int>> _readImageData(String name) async {
    final ByteData data = await rootBundle.load('images/$name');
    return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  }
}
