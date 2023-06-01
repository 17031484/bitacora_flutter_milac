import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:test_app/navbar.dart';
import 'package:test_app/global.dart' as globals;
import '../DB/baseinfo.dart';
import 'PdfApi.dart';

class viewRegisters extends StatefulWidget {
  const viewRegisters({super.key});

  @override
  State<viewRegisters> createState() => _viewRegistersState();
}

class _viewRegistersState extends State<viewRegisters> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
          title: Text('Horas de Servicio'),
        ),
        body: FutureBuilder<List<Map>>(
            future: getServerResponse(),
            builder: (BuildContext context, AsyncSnapshot<List<Map>> snapshot) {
              if (snapshot.hasData) {
                List<Map> records = snapshot.data!;
                return Center(
                  child: Column(
                    children: records.map((record) {
                      String buttonText = 'Hola';
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          width: 350,
                          height: 100,
                          child: ElevatedButton(
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8),
                                      child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8),
                                          child: Icon(Icons.picture_as_pdf))),
                                  Text(buttonText)
                                ],
                              )),
                        ),
                      );
                    }).toList(),
                  ),
                );
              } else if (snapshot.hasError)
                return Text('Error: ${snapshot.error}');
              else
                return CircularProgressIndicator();
            }),
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

  Future<List<Map<String, dynamic>>> getServerResponse() async {
    var response = await BaseInfo()
        .sendGetRequestWithBody(
            'https://track.milac.com.mx/MilacServices/MilacNavigation/api/v1/automaticBinnacle/getBinRows',
            globals.operador , globals.unidad)
        .catchError((err) {
          print(err);
        });

    return response;
  }
}
