import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_app/navbar.dart';
import '../b_insOcular/localStorage.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart' as syncfusion_flutter_pdf;
import 'PdfApi.dart';

// ignore: must_be_immutable
class viewPDFHistory extends StatefulWidget {
  viewPDFHistory({super.key});

  @override
  State<viewPDFHistory> createState() => _viewPDFHistoryState();
}

class _viewPDFHistoryState extends State<viewPDFHistory> {
  localStorage storage = new localStorage();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
          title: const Text('Historial'),
          backgroundColor: Colors.blue,
        ),
        body: FutureBuilder<List<Map>>(
            future: storage.getRecordsFromDatabase(),
            builder: (BuildContext context, AsyncSnapshot<List<Map>> snapshot) {
              if (snapshot.hasData) {
                List<Map> records = snapshot.data!;
                return Center(
                  child: Column(
                    children: records.map((record) {
                      String ruta = record['ruta'];
                      int maxLength = 20;
                      String rutaTruncada = ruta.length > maxLength
                          ? ruta.substring(0, maxLength) +
                              "\n" +
                              ruta.substring(maxLength, ruta.length)
                          : ruta;

                      String buttonText = 'Viaje: ' +
                          record['no_viaje'].toString() +
                          '\nRuta: ' +
                          rutaTruncada;
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          width: 350,
                          height: 100,
                          child: ElevatedButton(
                              onPressed: () {
                                validateRecords(record['no_viaje']);
                              },
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

  String getStringMonth(int month) {
    String monthToString = '';
    switch (month) {
      case 1:
        monthToString = 'Enero';
        break;
      case 2:
        monthToString = 'Febrero';
        break;
      case 3:
        monthToString = 'Marzo';
        break;
      case 4:
        monthToString = 'Abril';
        break;
      case 5:
        monthToString = 'Mayo';
        break;
      case 6:
        monthToString = 'Junio';
        break;
      case 7:
        monthToString = 'Julio';
        break;
      case 8:
        monthToString = 'Agosto';
        break;
      case 9:
        monthToString = 'Septiembre';
        break;
      case 10:
        monthToString = 'Octubre';
        break;
      case 11:
        monthToString = 'Noviembre';
        break;
      case 12:
      default:
        monthToString = 'Diciembre';
        break;
    }

    return monthToString;
  }

  void validateRecords(int noViaje) async {
    //hay que obtener el ultimo registro en caso de haberlo del viaje actual
    var lastRecord = await storage.getTotalRecords(noViaje);
    print(lastRecord);

    List<Map<String, dynamic>> totalRecords =
        await storage.getTotalRecords(noViaje);
    newPDF(storage.getDataFormRecord(noViaje));
  }

  void newPDF(Future<List<Map<String, dynamic>>> dataFormRecord) async {
    List<Map<String, dynamic>> registros = await dataFormRecord;

    syncfusion_flutter_pdf.PdfDocument document =
        syncfusion_flutter_pdf.PdfDocument();
    document.pageSettings.size = syncfusion_flutter_pdf.PdfPageSize.legal;
    final page = document.pages.add();

    syncfusion_flutter_pdf.PdfGridCellStyle headerStyle =
        syncfusion_flutter_pdf.PdfGridCellStyle();
    headerStyle.backgroundBrush = syncfusion_flutter_pdf.PdfSolidBrush(
        syncfusion_flutter_pdf.PdfColor(0, 0, 0));
    headerStyle.textBrush = syncfusion_flutter_pdf.PdfBrushes.white;
    headerStyle.stringFormat = syncfusion_flutter_pdf.PdfStringFormat(
        alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

    syncfusion_flutter_pdf.PdfGridCellStyle subHeaderStyle =
        syncfusion_flutter_pdf.PdfGridCellStyle();
    subHeaderStyle.backgroundBrush = syncfusion_flutter_pdf.PdfSolidBrush(
        syncfusion_flutter_pdf.PdfColor(0, 0, 0));
    subHeaderStyle.textBrush = syncfusion_flutter_pdf.PdfBrushes.white;

    syncfusion_flutter_pdf.PdfStringFormat centerText =
        syncfusion_flutter_pdf.PdfStringFormat(
            alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

    //teniendo este dato ya sabemos que se debe de escribir en 'n' renglones de la tablaF
    for (var i = 0; i < registros.length; i++) {
      List<Map<String, dynamic>> dataList =
          jsonDecode(registros[i]['respuestas']).cast<Map<String, dynamic>>();
      String dateString = registros[i]['fecha'];
      DateFormat dateFormat = DateFormat('yyyy-MM-dd');
      DateTime date = dateFormat.parse(dateString);
      int day = date.day;
      String month = getStringMonth(date.month);
      int year = date.year;

      page.graphics.drawString(
        'MOVIMIENTOS INDUSTRIALES LOGISTICOS DE ALTA CALIDAD S.A DE C.V.',
        syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          10,
        ),
      );

      //Table
      syncfusion_flutter_pdf.PdfGrid folio = syncfusion_flutter_pdf.PdfGrid();
      folio.columns.add(count: 2);
      syncfusion_flutter_pdf.PdfGridRow row = folio.rows.add();
      row.cells[0].value = 'Folio CG:';
      row.cells[0].style.stringFormat = syncfusion_flutter_pdf.PdfStringFormat(
          alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);
      row.cells[1].value = ' ';
      folio.draw(
        page: page,
        bounds: const Rect.fromLTWH(400, 0, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid email = syncfusion_flutter_pdf.PdfGrid();
      email.columns.add(count: 1);
      syncfusion_flutter_pdf.PdfGridRow emailRow = email.rows.add();
      emailRow.cells[0].value = 'Email: express@milac.com.mx';
      emailRow.cells[0].style.stringFormat =
          syncfusion_flutter_pdf.PdfStringFormat(
              alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);
      email.draw(
        page: page,
        bounds: const Rect.fromLTWH(400, 15, 0, 0),
      );

      page.graphics.drawString(
          'Carretera Acceso al Aeropuerto Municipal Km. 5.8 Celaya, Gto. C.P. 38110 Teléfono: 01 (461)6188920',
          syncfusion_flutter_pdf.PdfStandardFont(
            syncfusion_flutter_pdf.PdfFontFamily.helvetica,
            8,
          ),
          bounds: const Rect.fromLTWH(0, 15, 0, 0));

      page.graphics.drawString(
          'Nombre del operador:_______________________________________           firma: _______________________',
          syncfusion_flutter_pdf.PdfStandardFont(
            syncfusion_flutter_pdf.PdfFontFamily.helvetica,
            8,
          ),
          bounds: const Rect.fromLTWH(0, 30, 0, 0));

      syncfusion_flutter_pdf.PdfGrid mainTableHeader =
          syncfusion_flutter_pdf.PdfGrid();
      mainTableHeader.columns.add(count: 1);
      mainTableHeader.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow header = mainTableHeader.headers[0];
      header.cells[0].value =
          'BITACORA DEL OPERADOR RELATIVA A LA INSPECCION OCULAR DIARIA DE LA UNIDAD';
      header.cells[0].style = headerStyle;

      mainTableHeader.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 45, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid puntosVerificar =
          syncfusion_flutter_pdf.PdfGrid();
      puntosVerificar.columns.add(count: 5);
      puntosVerificar.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsVerificar =
          puntosVerificar.headers[0];
      rowsVerificar.cells[0].value = 'Puntos a verificar';
      puntosVerificar.columns[0].width = 110;
      rowsVerificar.cells[1].value = '';
      rowsVerificar.cells[2].value = 'Mes';
      rowsVerificar.cells[3].value = month;
      rowsVerificar.cells[4].value = 'Año ${year}';
      puntosVerificar.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 60, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid revisionInterna =
          syncfusion_flutter_pdf.PdfGrid();
      revisionInterna.columns.add(count: 32);
      revisionInterna.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsRevisionInterna =
          revisionInterna.headers[0];
      rowsRevisionInterna.cells[0].value = 'REVISION INTERNA';
      revisionInterna.columns[0].width = 110;
      rowsRevisionInterna.height = 10;
      for (int i = 1; i <= 31; i++) {
        rowsRevisionInterna.cells[i].value = '${i}';
        rowsRevisionInterna.cells[i].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);
        ;
      }
      rowsRevisionInterna.cells[0].style = subHeaderStyle;
      revisionInterna.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 75, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid revisionInterna1 =
          syncfusion_flutter_pdf.PdfGrid();
      revisionInterna1.columns.add(count: 32);
      revisionInterna1.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsRevisionIntern1 =
          revisionInterna1.headers[0];
      rowsRevisionIntern1.cells[0].value = 'INDICADOR DE PRESIÓN DE ACEITE';
      revisionInterna1.columns[0].width = 110;
      rowsRevisionIntern1.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsRevisionIntern1.cells[j].value = dataList[0]['0'] == 'Buen estado'
              ? '/'
              : dataList[0]['0'] == 'No aplica'
                  ? 'n/a'
                  : 'x';
        }

        rowsRevisionIntern1.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsRevisionIntern1.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsRevisionIntern1.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );

      revisionInterna1.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 85, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid revisionInterna2 =
          syncfusion_flutter_pdf.PdfGrid();
      revisionInterna2.columns.add(count: 32);
      revisionInterna2.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsRevisionIntern2 =
          revisionInterna2.headers[0];
      rowsRevisionIntern2.cells[0].value = 'INDICADOR DE PRESION DE AIRE/VACIO';
      revisionInterna2.columns[0].width = 110;
      rowsRevisionIntern2.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsRevisionIntern2.cells[j].value = dataList[0]['0'] == 'Buen estado'
              ? '/'
              : dataList[0]['0'] == 'No aplica'
                  ? 'n/a'
                  : 'x';
        }

        rowsRevisionIntern2.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsRevisionIntern2.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }

      rowsRevisionIntern2.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );

      revisionInterna2.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 90, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid revisionInterna3 =
          syncfusion_flutter_pdf.PdfGrid();
      revisionInterna3.columns.add(count: 32);
      revisionInterna3.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsRevisionIntern3 =
          revisionInterna3.headers[0];
      rowsRevisionIntern3.cells[0].value =
          'DISPOSITIVO DE ADVERTENCIA DE POCO AIRE O VACIO';
      revisionInterna3.columns[0].width = 110;
      rowsRevisionIntern3.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsRevisionIntern3.cells[j].value = dataList[0]['0'] == 'Buen estado'
              ? '/'
              : dataList[0]['0'] == 'No aplica'
                  ? 'n/a'
                  : 'x';
        }

        rowsRevisionIntern3.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsRevisionIntern3.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }

      rowsRevisionIntern3.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );

      revisionInterna3.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 95, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid tableroInstrumentos =
          syncfusion_flutter_pdf.PdfGrid();
      tableroInstrumentos.columns.add(count: 1);
      tableroInstrumentos.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsTableroInstrumentos =
          tableroInstrumentos.headers[0];
      rowsTableroInstrumentos.cells[0].style.stringFormat =
          syncfusion_flutter_pdf.PdfStringFormat(
              alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);
      rowsTableroInstrumentos.height = 50;

      rowsTableroInstrumentos.cells[0].value =
          '\n\n\n\nTABLERO DE INSTRUMENTOS';
      tableroInstrumentos.columns[0].width = 40;

      rowsTableroInstrumentos.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      tableroInstrumentos.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 100, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid revisionInterna4 =
          syncfusion_flutter_pdf.PdfGrid();
      revisionInterna4.columns.add(count: 32);
      revisionInterna4.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsRevisionIntern4 =
          revisionInterna4.headers[0];
      rowsRevisionIntern4.cells[0].value = 'VELOCIMETRO';
      revisionInterna4.columns[0].width = 70;
      rowsRevisionIntern4.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsRevisionIntern4.cells[j].value = dataList[0]['0'] == 'Buen estado'
              ? '/'
              : dataList[0]['0'] == 'No aplica'
                  ? 'n/a'
                  : 'x';
        }

        rowsRevisionIntern4.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsRevisionIntern4.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }

      rowsRevisionIntern4.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );

      revisionInterna4.draw(
        page: page,
        bounds: const Rect.fromLTWH(40, 100, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid lucesTablero =
          syncfusion_flutter_pdf.PdfGrid();
      lucesTablero.columns.add(count: 1);
      lucesTablero.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowslucesTablero =
          lucesTablero.headers[0];
      rowslucesTablero.cells[0].style.stringFormat =
          syncfusion_flutter_pdf.PdfStringFormat(
              alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);
      rowslucesTablero.height = 30;

      rowslucesTablero.cells[0].value = '\nLUCES DEL TABLERO';
      lucesTablero.columns[0].width = 20;

      rowslucesTablero.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      lucesTablero.draw(
        page: page,
        bounds: const Rect.fromLTWH(40, 105, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid revisionInterna5 =
          syncfusion_flutter_pdf.PdfGrid();
      revisionInterna5.columns.add(count: 32);
      revisionInterna5.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsRevisionInterna5 =
          revisionInterna5.headers[0];
      rowsRevisionInterna5.cells[0].value = 'DIRECCIONALES';
      revisionInterna5.columns[0].width = 50;
      rowsRevisionInterna5.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsRevisionInterna5.cells[j].value =
              dataList[0]['0'] == 'Buen estado'
                  ? '/'
                  : dataList[0]['0'] == 'No aplica'
                      ? 'n/a'
                      : 'x';
        }

        rowsRevisionInterna5.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsRevisionInterna5.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsRevisionInterna5.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );

      revisionInterna5.draw(
        page: page,
        bounds: const Rect.fromLTWH(60, 105, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid revisionInterna6 =
          syncfusion_flutter_pdf.PdfGrid();
      revisionInterna6.columns.add(count: 32);
      revisionInterna6.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsRevisionInterna6 =
          revisionInterna6.headers[0];
      rowsRevisionInterna6.cells[0].value = 'ESTACIONAMIENTO';
      revisionInterna6.columns[0].width = 50;
      rowsRevisionInterna6.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsRevisionInterna6.cells[j].value =
              dataList[0]['0'] == 'Buen estado'
                  ? '/'
                  : dataList[0]['0'] == 'No aplica'
                      ? 'n/a'
                      : 'x';
        }

        rowsRevisionInterna6.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsRevisionInterna6.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsRevisionInterna6.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );

      revisionInterna6.draw(
        page: page,
        bounds: const Rect.fromLTWH(60, 110, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid revisionInterna7 =
          syncfusion_flutter_pdf.PdfGrid();
      revisionInterna7.columns.add(count: 32);
      revisionInterna7.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsRevisionInterna7 =
          revisionInterna7.headers[0];
      rowsRevisionInterna7.cells[0].value = 'GALIBO (ALTURA)';
      revisionInterna7.columns[0].width = 50;
      rowsRevisionInterna7.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsRevisionInterna7.cells[j].value =
              dataList[0]['0'] == 'Buen estado'
                  ? '/'
                  : dataList[0]['0'] == 'No aplica'
                      ? 'n/a'
                      : 'x';
        }

        rowsRevisionInterna7.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsRevisionInterna7.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsRevisionInterna7.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      revisionInterna7.draw(
        page: page,
        bounds: const Rect.fromLTWH(60, 115, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid revisionInterna8 =
          syncfusion_flutter_pdf.PdfGrid();
      revisionInterna8.columns.add(count: 32);
      revisionInterna8.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsRevisionInterna8 =
          revisionInterna8.headers[0];
      rowsRevisionInterna8.cells[0].value = 'INTERIOR';
      revisionInterna8.columns[0].width = 50;
      rowsRevisionInterna8.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsRevisionInterna8.cells[j].value =
              dataList[0]['0'] == 'Buen estado'
                  ? '/'
                  : dataList[0]['0'] == 'No aplica'
                      ? 'n/a'
                      : 'x';
        }

        rowsRevisionInterna8.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsRevisionInterna8.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsRevisionInterna8.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );

      revisionInterna8.draw(
        page: page,
        bounds: const Rect.fromLTWH(60, 120, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid revisionInterna9 =
          syncfusion_flutter_pdf.PdfGrid();
      revisionInterna9.columns.add(count: 32);
      revisionInterna9.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsRevisionInterna9 =
          revisionInterna9.headers[0];
      rowsRevisionInterna9.cells[0].value = 'ADVERTENCIA';
      revisionInterna9.columns[0].width = 50;
      rowsRevisionInterna9.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsRevisionInterna9.cells[j].value =
              dataList[0]['0'] == 'Buen estado'
                  ? '/'
                  : dataList[0]['0'] == 'No aplica'
                      ? 'n/a'
                      : 'x';
        }

        rowsRevisionInterna9.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsRevisionInterna9.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsRevisionInterna9.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );

      revisionInterna9.draw(
        page: page,
        bounds: const Rect.fromLTWH(60, 125, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid revisionInterna10 =
          syncfusion_flutter_pdf.PdfGrid();
      revisionInterna10.columns.add(count: 32);
      revisionInterna10.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsRevisionInterna10 =
          revisionInterna10.headers[0];
      rowsRevisionInterna10.cells[0].value = 'DEMARCADORAS';
      revisionInterna10.columns[0].width = 50;
      rowsRevisionInterna10.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsRevisionInterna10.cells[j].value =
              dataList[0]['0'] == 'Buen estado'
                  ? '/'
                  : dataList[0]['0'] == 'No aplica'
                      ? 'n/a'
                      : 'x';
        }

        rowsRevisionInterna10.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsRevisionInterna10.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsRevisionInterna10.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );

      revisionInterna10.draw(
        page: page,
        bounds: const Rect.fromLTWH(60, 130, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid revisionInterna11 =
          syncfusion_flutter_pdf.PdfGrid();
      revisionInterna11.columns.add(count: 32);
      revisionInterna11.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsRevisionIntern11 =
          revisionInterna11.headers[0];
      rowsRevisionIntern11.cells[0].value = 'CALENTADOR DESEMPAÑADOR';
      revisionInterna11.columns[0].width = 70;
      rowsRevisionIntern11.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsRevisionIntern11.cells[j].value =
              dataList[0]['0'] == 'Buen estado'
                  ? '/'
                  : dataList[0]['0'] == 'No aplica'
                      ? 'n/a'
                      : 'x';
        }

        rowsRevisionIntern11.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsRevisionIntern11.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsRevisionIntern11.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );

      revisionInterna11.draw(
        page: page,
        bounds: const Rect.fromLTWH(40, 135, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid revisionInterna12 =
          syncfusion_flutter_pdf.PdfGrid();
      revisionInterna12.columns.add(count: 32);
      revisionInterna12.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsRevisionInterna12 =
          revisionInterna12.headers[0];
      rowsRevisionInterna12.cells[0].value = 'BATERIA';
      revisionInterna12.columns[0].width = 70;
      rowsRevisionInterna12.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsRevisionInterna12.cells[j].value =
              dataList[0]['0'] == 'Buen estado'
                  ? '/'
                  : dataList[0]['0'] == 'No aplica'
                      ? 'n/a'
                      : 'x';
        }

        rowsRevisionInterna12.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsRevisionInterna12.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsRevisionInterna12.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );

      revisionInterna12.draw(
        page: page,
        bounds: const Rect.fromLTWH(40, 140, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid revisionInterna13 =
          syncfusion_flutter_pdf.PdfGrid();
      revisionInterna13.columns.add(count: 32);
      revisionInterna13.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsRevisionInterna13 =
          revisionInterna13.headers[0];
      rowsRevisionInterna13.cells[0].value = 'MOTOR';
      revisionInterna13.columns[0].width = 70;
      rowsRevisionInterna13.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsRevisionInterna13.cells[j].value =
              dataList[0]['0'] == 'Buen estado'
                  ? '/'
                  : dataList[0]['0'] == 'No aplica'
                      ? 'n/a'
                      : 'x';
        }

        rowsRevisionInterna13.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsRevisionInterna13.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }

      rowsRevisionInterna13.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );

      revisionInterna13.draw(
        page: page,
        bounds: const Rect.fromLTWH(40, 145, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid revisionInterna14 =
          syncfusion_flutter_pdf.PdfGrid();
      revisionInterna14.columns.add(count: 32);
      revisionInterna14.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsRevisionInterna14 =
          revisionInterna14.headers[0];
      rowsRevisionInterna14.cells[0].value = 'CLAXON O CORNETA';
      revisionInterna14.columns[0].width = 110;
      rowsRevisionInterna14.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsRevisionInterna14.cells[j].value =
              dataList[0]['0'] == 'Buen estado'
                  ? '/'
                  : dataList[0]['0'] == 'No aplica'
                      ? 'n/a'
                      : 'x';
        }

        rowsRevisionInterna14.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsRevisionInterna14.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsRevisionInterna14.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );

      revisionInterna14.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 150, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid revisionInterna15 =
          syncfusion_flutter_pdf.PdfGrid();
      revisionInterna15.columns.add(count: 32);
      revisionInterna15.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsRevisionInterna15 =
          revisionInterna15.headers[0];
      rowsRevisionInterna15.cells[0].value =
          'CINTURON DE SEGURIDAD (MINIMO DEL OPERADOR)';
      revisionInterna15.columns[0].width = 110;
      rowsRevisionInterna15.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsRevisionInterna15.cells[j].value =
              dataList[0]['0'] == 'Buen estado'
                  ? '/'
                  : dataList[0]['0'] == 'No aplica'
                      ? 'n/a'
                      : 'x';
        }

        rowsRevisionInterna15.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsRevisionInterna15.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsRevisionInterna15.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );

      revisionInterna15.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 155, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid revisionInterna16 =
          syncfusion_flutter_pdf.PdfGrid();
      revisionInterna16.columns.add(count: 32);
      revisionInterna16.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsRevisionInterna16 =
          revisionInterna16.headers[0];
      rowsRevisionInterna16.cells[0].value =
          'PARABRISAS (SIN FISURAS QUE OBSTRUYAN LA VISIBILIDAD DEL CONDUCTOR)';
      revisionInterna16.columns[0].width = 110;
      rowsRevisionInterna16.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsRevisionInterna16.cells[j].value =
              dataList[0]['0'] == 'Buen estado'
                  ? '/'
                  : dataList[0]['0'] == 'No aplica'
                      ? 'n/a'
                      : 'x';
        }

        rowsRevisionInterna16.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsRevisionInterna16.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsRevisionInterna16.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );

      revisionInterna16.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 160, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid revisionInterna17 =
          syncfusion_flutter_pdf.PdfGrid();
      revisionInterna17.columns.add(count: 32);
      revisionInterna17.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsRevisionInterna17 =
          revisionInterna17.headers[0];
      rowsRevisionInterna17.cells[0].value = 'LIMPIADORES';
      revisionInterna17.columns[0].width = 110;
      rowsRevisionInterna17.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsRevisionInterna17.cells[j].value =
              dataList[0]['0'] == 'Buen estado'
                  ? '/'
                  : dataList[0]['0'] == 'No aplica'
                      ? 'n/a'
                      : 'x';
        }

        rowsRevisionInterna17.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsRevisionInterna17.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsRevisionInterna17.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );

      revisionInterna17.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 165, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid revisionInterna18 =
          syncfusion_flutter_pdf.PdfGrid();
      revisionInterna18.columns.add(count: 32);
      revisionInterna18.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsRevisionInterna18 =
          revisionInterna18.headers[0];
      rowsRevisionInterna18.cells[0].value = 'ESPEJOS RETROVISORES (2)';
      revisionInterna18.columns[0].width = 110;
      rowsRevisionInterna18.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsRevisionInterna18.cells[j].value =
              dataList[0]['0'] == 'Buen estado'
                  ? '/'
                  : dataList[0]['0'] == 'No aplica'
                      ? 'n/a'
                      : 'x';
        }

        rowsRevisionInterna18.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsRevisionInterna18.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsRevisionInterna18.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );

      revisionInterna18.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 170, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid revisionInterna19 =
          syncfusion_flutter_pdf.PdfGrid();
      revisionInterna19.columns.add(count: 32);
      revisionInterna19.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsRevisionInterna19 =
          revisionInterna19.headers[0];
      rowsRevisionInterna19.cells[0].value =
          'VOLANTE (DIRECCION SIN EXCESO DE JUEGO)';
      revisionInterna19.columns[0].width = 110;
      rowsRevisionInterna19.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsRevisionInterna19.cells[j].value =
              dataList[0]['0'] == 'Buen estado'
                  ? '/'
                  : dataList[0]['0'] == 'No aplica'
                      ? 'n/a'
                      : 'x';
        }

        rowsRevisionInterna19.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsRevisionInterna19.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsRevisionInterna19.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );

      revisionInterna19.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 175, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid revisionInterna20 =
          syncfusion_flutter_pdf.PdfGrid();
      revisionInterna20.columns.add(count: 32);
      revisionInterna20.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsRevisionInterna20 =
          revisionInterna20.headers[0];
      rowsRevisionInterna20.cells[0].value = 'FRENO DE PIE';
      revisionInterna20.columns[0].width = 110;
      rowsRevisionInterna20.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsRevisionInterna20.cells[j].value =
              dataList[0]['0'] == 'Buen estado'
                  ? '/'
                  : dataList[0]['0'] == 'No aplica'
                      ? 'n/a'
                      : 'x';
        }

        rowsRevisionInterna20.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsRevisionInterna20.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsRevisionInterna20.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );

      revisionInterna20.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 180, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid revisionInterna21 =
          syncfusion_flutter_pdf.PdfGrid();
      revisionInterna21.columns.add(count: 32);
      revisionInterna21.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsRevisionInterna21 =
          revisionInterna21.headers[0];
      rowsRevisionInterna21.cells[0].value = 'FRENOS DE EMERGENCIA';
      revisionInterna21.columns[0].width = 110;
      rowsRevisionInterna21.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsRevisionInterna21.cells[j].value =
              dataList[0]['0'] == 'Buen estado'
                  ? '/'
                  : dataList[0]['0'] == 'No aplica'
                      ? 'n/a'
                      : 'x';
        }

        rowsRevisionInterna21.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsRevisionInterna21.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsRevisionInterna21.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );

      revisionInterna21.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 185, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid frenteExterior =
          syncfusion_flutter_pdf.PdfGrid();
      frenteExterior.columns.add(count: 1);
      frenteExterior.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsFrenteExterior =
          frenteExterior.headers[0];
      rowsFrenteExterior.cells[0].value = 'FRENTE EXTERIOR';
      rowsFrenteExterior.height = 10;
      rowsFrenteExterior.cells[0].style = subHeaderStyle;
      frenteExterior.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 190, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid frenteExterior1 =
          syncfusion_flutter_pdf.PdfGrid();
      frenteExterior1.columns.add(count: 32);
      frenteExterior1.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsFrenteExterior1 =
          frenteExterior1.headers[0];
      rowsFrenteExterior1.cells[0].value = 'DEFENSA (SUJECION)';
      frenteExterior1.columns[0].width = 110;
      rowsFrenteExterior1.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsFrenteExterior1.cells[j].value = dataList[0]['0'] == 'Buen estado'
              ? '/'
              : dataList[0]['0'] == 'No aplica'
                  ? 'n/a'
                  : 'x';
        }

        rowsFrenteExterior1.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsFrenteExterior1.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsFrenteExterior1.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );

      frenteExterior1.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 200, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid frenteExterior2 =
          syncfusion_flutter_pdf.PdfGrid();
      frenteExterior2.columns.add(count: 32);
      frenteExterior2.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsFrenteExterior2 =
          frenteExterior2.headers[0];
      rowsFrenteExterior2.cells[0].value = 'FAROS PRINCIPALES (FUNCIONAMIENTO)';
      frenteExterior2.columns[0].width = 110;
      rowsFrenteExterior2.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsFrenteExterior2.cells[j].value = dataList[0]['0'] == 'Buen estado'
              ? '/'
              : dataList[0]['0'] == 'No aplica'
                  ? 'n/a'
                  : 'x';
        }

        rowsFrenteExterior2.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsFrenteExterior2.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsFrenteExterior2.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      frenteExterior2.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 205, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid luces = syncfusion_flutter_pdf.PdfGrid();
      luces.columns.add(count: 1);
      luces.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsLuces = luces.headers[0];
      rowsLuces.cells[0].style.stringFormat =
          syncfusion_flutter_pdf.PdfStringFormat(
              alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);
      rowsLuces.height = 20;

      rowsLuces.cells[0].value = '\n\nLUCES';
      luces.columns[0].width = 40;

      rowsLuces.cells[0].style.font = syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      luces.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 210, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid frenteExterior3 =
          syncfusion_flutter_pdf.PdfGrid();
      frenteExterior3.columns.add(count: 32);
      frenteExterior3.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsFrenteExterior3 =
          frenteExterior3.headers[0];
      rowsFrenteExterior3.cells[0].value = 'DEMARCADORAS';
      frenteExterior3.columns[0].width = 70;
      rowsFrenteExterior3.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsFrenteExterior3.cells[j].value = dataList[0]['0'] == 'Buen estado'
              ? '/'
              : dataList[0]['0'] == 'No aplica'
                  ? 'n/a'
                  : 'x';
        }

        rowsFrenteExterior3.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsFrenteExterior3.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsFrenteExterior3.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      frenteExterior3.draw(
        page: page,
        bounds: const Rect.fromLTWH(40, 210, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid frenteExterior4 =
          syncfusion_flutter_pdf.PdfGrid();
      frenteExterior4.columns.add(count: 32);
      frenteExterior4.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsFrenteExterior4 =
          frenteExterior4.headers[0];
      rowsFrenteExterior4.cells[0].value = 'DIRECCIONALES';
      frenteExterior4.columns[0].width = 70;
      rowsFrenteExterior4.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsFrenteExterior4.cells[j].value = dataList[0]['0'] == 'Buen estado'
              ? '/'
              : dataList[0]['0'] == 'No aplica'
                  ? 'n/a'
                  : 'x';
        }

        rowsFrenteExterior4.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsFrenteExterior4.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsFrenteExterior4.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      frenteExterior4.draw(
        page: page,
        bounds: const Rect.fromLTWH(40, 215, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid frenteExterior5 =
          syncfusion_flutter_pdf.PdfGrid();
      frenteExterior5.columns.add(count: 32);
      frenteExterior5.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsFrenteExterior5 =
          frenteExterior5.headers[0];
      rowsFrenteExterior5.cells[0].value = 'DE GALIBO (ALTURA)';
      frenteExterior5.columns[0].width = 70;
      rowsFrenteExterior5.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsFrenteExterior5.cells[j].value = dataList[0]['0'] == 'Buen estado'
              ? '/'
              : dataList[0]['0'] == 'No aplica'
                  ? 'n/a'
                  : 'x';
        }

        rowsFrenteExterior5.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsFrenteExterior5.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsFrenteExterior5.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      frenteExterior5.draw(
        page: page,
        bounds: const Rect.fromLTWH(40, 220, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid frenteExterior6 =
          syncfusion_flutter_pdf.PdfGrid();
      frenteExterior6.columns.add(count: 32);
      frenteExterior6.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsFrenteExterior6 =
          frenteExterior6.headers[0];
      rowsFrenteExterior6.cells[0].value = 'DE ADVERTENCIA';
      frenteExterior6.columns[0].width = 70;
      rowsFrenteExterior6.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsFrenteExterior6.cells[j].value = dataList[0]['0'] == 'Buen estado'
              ? '/'
              : dataList[0]['0'] == 'No aplica'
                  ? 'n/a'
                  : 'x';
        }

        rowsFrenteExterior6.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsFrenteExterior6.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsFrenteExterior6.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      frenteExterior6.draw(
        page: page,
        bounds: const Rect.fromLTWH(40, 225, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid frenteExterior7 =
          syncfusion_flutter_pdf.PdfGrid();
      frenteExterior7.columns.add(count: 32);
      frenteExterior7.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsFrenteExterior7 =
          frenteExterior7.headers[0];
      rowsFrenteExterior7.cells[0].value =
          'LLANTAS (NO RENOVADAS EN EL EJE DELANTERO, DESGASTE)';
      frenteExterior7.columns[0].width = 110;
      rowsFrenteExterior7.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsFrenteExterior7.cells[j].value = dataList[0]['0'] == 'Buen estado'
              ? '/'
              : dataList[0]['0'] == 'No aplica'
                  ? 'n/a'
                  : 'x';
        }

        rowsFrenteExterior7.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsFrenteExterior7.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsFrenteExterior7.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      frenteExterior7.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 230, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid frenteExterior8 =
          syncfusion_flutter_pdf.PdfGrid();
      frenteExterior8.columns.add(count: 32);
      frenteExterior8.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsFrenteExterior8 =
          frenteExterior8.headers[0];
      rowsFrenteExterior8.cells[0].value = 'RINES SIN FISURAS';
      frenteExterior8.columns[0].width = 110;
      rowsFrenteExterior8.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsFrenteExterior8.cells[j].value = dataList[0]['0'] == 'Buen estado'
              ? '/'
              : dataList[0]['0'] == 'No aplica'
                  ? 'n/a'
                  : 'x';
        }

        rowsFrenteExterior8.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsFrenteExterior8.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsFrenteExterior8.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      frenteExterior8.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 235, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid frenteExterior9 =
          syncfusion_flutter_pdf.PdfGrid();
      frenteExterior9.columns.add(count: 32);
      frenteExterior9.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsFrenteExterior9 =
          frenteExterior9.headers[0];
      rowsFrenteExterior9.cells[0].value = 'BIRLOS Y TUERCAS COMPLETOS';
      frenteExterior9.columns[0].width = 110;
      rowsFrenteExterior9.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsFrenteExterior9.cells[j].value = dataList[0]['0'] == 'Buen estado'
              ? '/'
              : dataList[0]['0'] == 'No aplica'
                  ? 'n/a'
                  : 'x';
        }

        rowsFrenteExterior9.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsFrenteExterior9.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsFrenteExterior9.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      frenteExterior9.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 240, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid frenteExterior10 =
          syncfusion_flutter_pdf.PdfGrid();
      frenteExterior10.columns.add(count: 32);
      frenteExterior10.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsFrenteExterior10 =
          frenteExterior10.headers[0];
      rowsFrenteExterior10.cells[0].value = 'GUARDA FANGOS (LODERAS)';
      frenteExterior10.columns[0].width = 110;
      rowsFrenteExterior10.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsFrenteExterior10.cells[j].value =
              dataList[0]['0'] == 'Buen estado'
                  ? '/'
                  : dataList[0]['0'] == 'No aplica'
                      ? 'n/a'
                      : 'x';
        }

        rowsFrenteExterior10.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsFrenteExterior10.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsFrenteExterior10.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      frenteExterior10.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 245, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid ladoID = syncfusion_flutter_pdf.PdfGrid();
      ladoID.columns.add(count: 1);
      ladoID.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsladoID = ladoID.headers[0];
      rowsladoID.cells[0].value = 'LADO IZQUIERDO-DERECHO';
      frenteExterior.columns[0].width = 110;
      rowsladoID.height = 10;
      rowsladoID.cells[0].style = subHeaderStyle;
      ladoID.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 250, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid frenteExterior11 =
          syncfusion_flutter_pdf.PdfGrid();
      frenteExterior11.columns.add(count: 32);
      frenteExterior11.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsFrenteExterior11 =
          frenteExterior11.headers[0];
      rowsFrenteExterior11.cells[0].value =
          'TANQUE(S) COMBUSTIBLE DERECHO Y TAPON';
      frenteExterior11.columns[0].width = 110;
      rowsFrenteExterior11.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsFrenteExterior11.cells[j].value =
              dataList[0]['0'] == 'Buen estado'
                  ? '/'
                  : dataList[0]['0'] == 'No aplica'
                      ? 'n/a'
                      : 'x';
        }

        rowsFrenteExterior11.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsFrenteExterior11.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsFrenteExterior11.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      frenteExterior11.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 260, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid frenteExterior12 =
          syncfusion_flutter_pdf.PdfGrid();
      frenteExterior12.columns.add(count: 32);
      frenteExterior12.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsFrenteExterior12 =
          frenteExterior12.headers[0];
      rowsFrenteExterior12.cells[0].value =
          'TANQUE(S) COMBUSTIBLE IZQUIERDO Y TAPON';
      frenteExterior12.columns[0].width = 110;
      rowsFrenteExterior12.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsFrenteExterior12.cells[j].value =
              dataList[0]['0'] == 'Buen estado'
                  ? '/'
                  : dataList[0]['0'] == 'No aplica'
                      ? 'n/a'
                      : 'x';
        }

        rowsFrenteExterior12.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsFrenteExterior12.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsFrenteExterior12.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      frenteExterior12.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 265, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid frenteExterior13 =
          syncfusion_flutter_pdf.PdfGrid();
      frenteExterior13.columns.add(count: 32);
      frenteExterior13.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsFrenteExterior13 =
          frenteExterior13.headers[0];
      rowsFrenteExterior13.cells[0].value = 'LUCES DE ADVERTENCIA Y LATERALES';
      frenteExterior13.columns[0].width = 110;
      rowsFrenteExterior13.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsFrenteExterior13.cells[j].value =
              dataList[0]['0'] == 'Buen estado'
                  ? '/'
                  : dataList[0]['0'] == 'No aplica'
                      ? 'n/a'
                      : 'x';
        }

        rowsFrenteExterior13.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsFrenteExterior13.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsFrenteExterior13.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      frenteExterior13.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 270, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid frenteExterior14 =
          syncfusion_flutter_pdf.PdfGrid();
      frenteExterior14.columns.add(count: 32);
      frenteExterior14.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsFrenteExterior14 =
          frenteExterior14.headers[0];
      rowsFrenteExterior14.cells[0].value = 'REFLEJANTE';
      frenteExterior14.columns[0].width = 110;
      rowsFrenteExterior14.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsFrenteExterior14.cells[j].value =
              dataList[0]['0'] == 'Buen estado'
                  ? '/'
                  : dataList[0]['0'] == 'No aplica'
                      ? 'n/a'
                      : 'x';
        }

        rowsFrenteExterior14.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsFrenteExterior14.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsFrenteExterior14.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      frenteExterior14.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 275, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid frenteExterior15 =
          syncfusion_flutter_pdf.PdfGrid();
      frenteExterior15.columns.add(count: 32);
      frenteExterior15.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsFrenteExterior15 =
          frenteExterior15.headers[0];
      rowsFrenteExterior15.cells[0].value = 'LLANTAS DE REFACCION';
      frenteExterior15.columns[0].width = 110;
      rowsFrenteExterior15.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsFrenteExterior15.cells[j].value =
              dataList[0]['0'] == 'Buen estado'
                  ? '/'
                  : dataList[0]['0'] == 'No aplica'
                      ? 'n/a'
                      : 'x';
        }

        rowsFrenteExterior15.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsFrenteExterior15.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsFrenteExterior15.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      frenteExterior15.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 280, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid frenteExterior16 =
          syncfusion_flutter_pdf.PdfGrid();
      frenteExterior16.columns.add(count: 32);
      frenteExterior16.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsFrenteExterior16 =
          frenteExterior16.headers[0];
      rowsFrenteExterior16.cells[0].value = 'LLANTAS (DESGASTE Y AIRE)';
      frenteExterior16.columns[0].width = 110;
      rowsFrenteExterior16.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsFrenteExterior16.cells[j].value =
              dataList[0]['0'] == 'Buen estado'
                  ? '/'
                  : dataList[0]['0'] == 'No aplica'
                      ? 'n/a'
                      : 'x';
        }

        rowsFrenteExterior16.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsFrenteExterior16.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsFrenteExterior16.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      frenteExterior16.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 285, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid frenteExterior17 =
          syncfusion_flutter_pdf.PdfGrid();
      frenteExterior17.columns.add(count: 32);
      frenteExterior17.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsFrenteExterior17 =
          frenteExterior17.headers[0];
      rowsFrenteExterior17.cells[0].value = 'RINES SIN FISURAS';
      frenteExterior17.columns[0].width = 110;
      rowsFrenteExterior17.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsFrenteExterior17.cells[j].value =
              dataList[0]['0'] == 'Buen estado'
                  ? '/'
                  : dataList[0]['0'] == 'No aplica'
                      ? 'n/a'
                      : 'x';
        }

        rowsFrenteExterior17.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsFrenteExterior17.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsFrenteExterior17.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      frenteExterior17.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 290, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid frenteExterior18 =
          syncfusion_flutter_pdf.PdfGrid();
      frenteExterior18.columns.add(count: 32);
      frenteExterior18.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsFrenteExterior18 =
          frenteExterior18.headers[0];
      rowsFrenteExterior18.cells[0].value = 'BIRLOS Y TUERCAS SIN FISURAS';
      frenteExterior18.columns[0].width = 110;
      rowsFrenteExterior18.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsFrenteExterior18.cells[j].value =
              dataList[0]['0'] == 'Buen estado'
                  ? '/'
                  : dataList[0]['0'] == 'No aplica'
                      ? 'n/a'
                      : 'x';
        }

        rowsFrenteExterior18.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsFrenteExterior18.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsFrenteExterior18.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      frenteExterior18.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 295, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid frenteExterior19 =
          syncfusion_flutter_pdf.PdfGrid();
      frenteExterior19.columns.add(count: 32);
      frenteExterior19.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsFrenteExterior19 =
          frenteExterior19.headers[0];
      rowsFrenteExterior19.cells[0].value =
          'SISTEMA DE ASEGURAMIENTO Y SUJECION DE CARGA';
      frenteExterior19.columns[0].width = 110;
      rowsFrenteExterior19.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsFrenteExterior19.cells[j].value =
              dataList[0]['0'] == 'Buen estado'
                  ? '/'
                  : dataList[0]['0'] == 'No aplica'
                      ? 'n/a'
                      : 'x';
        }

        rowsFrenteExterior19.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsFrenteExterior19.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsFrenteExterior19.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      frenteExterior19.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 300, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid frenteExterior20 =
          syncfusion_flutter_pdf.PdfGrid();
      frenteExterior20.columns.add(count: 32);
      frenteExterior20.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsFrenteExterior20 =
          frenteExterior20.headers[0];
      rowsFrenteExterior20.cells[0].value = 'QUINTA RUEDA';
      frenteExterior20.columns[0].width = 110;
      rowsFrenteExterior20.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsFrenteExterior20.cells[j].value =
              dataList[0]['0'] == 'Buen estado'
                  ? '/'
                  : dataList[0]['0'] == 'No aplica'
                      ? 'n/a'
                      : 'x';
        }

        rowsFrenteExterior20.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsFrenteExterior20.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsFrenteExterior20.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      frenteExterior20.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 305, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid autotanque =
          syncfusion_flutter_pdf.PdfGrid();
      autotanque.columns.add(count: 1);
      autotanque.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsAutotanque = autotanque.headers[0];
      rowsAutotanque.cells[0].value = 'AUTOTANQUE';
      rowsAutotanque.height = 10;
      rowsAutotanque.cells[0].style = subHeaderStyle;
      autotanque.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 310, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid autotanque1 =
          syncfusion_flutter_pdf.PdfGrid();
      autotanque1.columns.add(count: 32);
      autotanque1.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsAutotanque1 =
          autotanque1.headers[0];
      rowsAutotanque1.cells[0].value = 'MATA CHISPAS';
      autotanque1.columns[0].width = 110;
      rowsAutotanque1.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsAutotanque1.cells[j].value = dataList[0]['0'] == 'Buen estado'
              ? '/'
              : dataList[0]['0'] == 'No aplica'
                  ? 'n/a'
                  : 'x';
        }

        rowsAutotanque1.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsAutotanque1.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsAutotanque1.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      autotanque1.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 320, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid autotanque2 =
          syncfusion_flutter_pdf.PdfGrid();
      autotanque2.columns.add(count: 32);
      autotanque2.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsAutotanque2 =
          autotanque2.headers[0];
      rowsAutotanque2.cells[0].value = 'PLACA METALICA DE IDENTIFICACION';
      autotanque2.columns[0].width = 110;
      rowsAutotanque2.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsAutotanque2.cells[j].value = dataList[0]['0'] == 'Buen estado'
              ? '/'
              : dataList[0]['0'] == 'No aplica'
                  ? 'n/a'
                  : 'x';
        }

        rowsAutotanque2.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsAutotanque2.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsAutotanque2.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      autotanque2.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 325, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid autotanque3 =
          syncfusion_flutter_pdf.PdfGrid();
      autotanque3.columns.add(count: 32);
      autotanque3.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsAutotanque3 =
          autotanque3.headers[0];
      rowsAutotanque3.cells[0].value = 'ENGOMADOS DE PRUEBA VIGENTE';
      autotanque3.columns[0].width = 110;
      rowsAutotanque3.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsAutotanque3.cells[j].value = dataList[0]['0'] == 'Buen estado'
              ? '/'
              : dataList[0]['0'] == 'No aplica'
                  ? 'n/a'
                  : 'x';
        }

        rowsAutotanque3.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsAutotanque3.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsAutotanque3.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      autotanque3.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 330, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid autotanque4 =
          syncfusion_flutter_pdf.PdfGrid();
      autotanque4.columns.add(count: 32);
      autotanque4.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsAutotanque4 =
          autotanque4.headers[0];
      rowsAutotanque4.cells[0].value = 'REFLEJANTES';
      autotanque4.columns[0].width = 110;
      rowsAutotanque4.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsAutotanque4.cells[j].value = dataList[0]['0'] == 'Buen estado'
              ? '/'
              : dataList[0]['0'] == 'No aplica'
                  ? 'n/a'
                  : 'x';
        }

        rowsAutotanque4.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsAutotanque4.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsAutotanque4.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      autotanque4.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 335, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid autotanque5 =
          syncfusion_flutter_pdf.PdfGrid();
      autotanque5.columns.add(count: 32);
      autotanque5.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsAutotanque5 =
          autotanque5.headers[0];
      rowsAutotanque5.cells[0].value = 'TUBERIA, VALVULAS CONEXIONES';
      autotanque5.columns[0].width = 110;
      rowsAutotanque5.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsAutotanque5.cells[j].value = dataList[0]['0'] == 'Buen estado'
              ? '/'
              : dataList[0]['0'] == 'No aplica'
                  ? 'n/a'
                  : 'x';
        }

        rowsAutotanque5.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsAutotanque5.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsAutotanque5.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      autotanque5.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 335, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid autotanque6 =
          syncfusion_flutter_pdf.PdfGrid();
      autotanque6.columns.add(count: 32);
      autotanque6.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsAutotanque6 =
          autotanque6.headers[0];
      rowsAutotanque6.cells[0].value = 'ESCALERILLAS';
      autotanque6.columns[0].width = 110;
      rowsAutotanque6.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsAutotanque6.cells[j].value = dataList[0]['0'] == 'Buen estado'
              ? '/'
              : dataList[0]['0'] == 'No aplica'
                  ? 'n/a'
                  : 'x';
        }

        rowsAutotanque6.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsAutotanque6.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsAutotanque6.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      autotanque6.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 340, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid autotanque7 =
          syncfusion_flutter_pdf.PdfGrid();
      autotanque7.columns.add(count: 32);
      autotanque7.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsAutotanque7 =
          autotanque7.headers[0];
      rowsAutotanque7.cells[0].value = 'PASILLO';
      autotanque7.columns[0].width = 110;
      rowsAutotanque7.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsAutotanque7.cells[j].value = dataList[0]['0'] == 'Buen estado'
              ? '/'
              : dataList[0]['0'] == 'No aplica'
                  ? 'n/a'
                  : 'x';
        }

        rowsAutotanque7.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsAutotanque7.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsAutotanque7.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      autotanque7.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 345, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid autotanque8 =
          syncfusion_flutter_pdf.PdfGrid();
      autotanque8.columns.add(count: 32);
      autotanque8.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsAutotanque8 =
          autotanque8.headers[0];
      rowsAutotanque8.cells[0].value =
          'CUERPO DEL TANQUE (SIN GOLPES, FISURAS O FUGAS)';
      autotanque8.columns[0].width = 110;
      rowsAutotanque8.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsAutotanque8.cells[j].value = dataList[0]['0'] == 'Buen estado'
              ? '/'
              : dataList[0]['0'] == 'No aplica'
                  ? 'n/a'
                  : 'x';
        }

        rowsAutotanque8.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsAutotanque8.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsAutotanque8.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      autotanque8.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 350, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid autotanque9 =
          syncfusion_flutter_pdf.PdfGrid();
      autotanque9.columns.add(count: 32);
      autotanque9.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsAutotanque9 =
          autotanque9.headers[0];
      rowsAutotanque9.cells[0].value = 'INSTRUMENTOS DE MEDICION';
      autotanque9.columns[0].width = 110;
      rowsAutotanque9.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsAutotanque9.cells[j].value = dataList[0]['0'] == 'Buen estado'
              ? '/'
              : dataList[0]['0'] == 'No aplica'
                  ? 'n/a'
                  : 'x';
        }

        rowsAutotanque9.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsAutotanque9.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsAutotanque9.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      autotanque9.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 355, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid autotanque10 =
          syncfusion_flutter_pdf.PdfGrid();
      autotanque10.columns.add(count: 32);
      autotanque10.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsAutotanque10 =
          autotanque10.headers[0];
      rowsAutotanque10.cells[0].value = 'VÁLVULA DE DESFOGE INTERNA Y DE VACIO';
      autotanque10.columns[0].width = 110;
      rowsAutotanque10.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsAutotanque10.cells[j].value = dataList[0]['0'] == 'Buen estado'
              ? '/'
              : dataList[0]['0'] == 'No aplica'
                  ? 'n/a'
                  : 'x';
        }

        rowsAutotanque10.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsAutotanque10.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsAutotanque10.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      autotanque10.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 360, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid autotanque11 =
          syncfusion_flutter_pdf.PdfGrid();
      autotanque11.columns.add(count: 32);
      autotanque11.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsAutotanque11 =
          autotanque11.headers[0];
      rowsAutotanque11.cells[0].value = 'ENTRADA PASA HOMBRE';
      autotanque11.columns[0].width = 110;
      rowsAutotanque11.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsAutotanque11.cells[j].value = dataList[0]['0'] == 'Buen estado'
              ? '/'
              : dataList[0]['0'] == 'No aplica'
                  ? 'n/a'
                  : 'x';
        }

        rowsAutotanque11.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsAutotanque11.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsAutotanque11.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      autotanque11.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 365, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid autotanque12 =
          syncfusion_flutter_pdf.PdfGrid();
      autotanque12.columns.add(count: 32);
      autotanque12.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsAutotanque12 =
          autotanque12.headers[0];
      rowsAutotanque12.cells[0].value = 'CONEXIÓN A TIERRA';
      autotanque12.columns[0].width = 110;
      rowsAutotanque12.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsAutotanque12.cells[j].value = dataList[0]['0'] == 'Buen estado'
              ? '/'
              : dataList[0]['0'] == 'No aplica'
                  ? 'n/a'
                  : 'x';
        }

        rowsAutotanque12.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsAutotanque12.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsAutotanque12.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      autotanque12.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 370, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid interior =
          syncfusion_flutter_pdf.PdfGrid();
      interior.columns.add(count: 1);
      interior.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsInterior = interior.headers[0];
      rowsInterior.cells[0].value = 'REVISION INTERIOR';
      autotanque.columns[0].width = 110;
      rowsInterior.height = 10;
      interior.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 375, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid interior1 =
          syncfusion_flutter_pdf.PdfGrid();
      interior1.columns.add(count: 32);
      interior1.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsInterior1 = interior1.headers[0];
      rowsInterior1.cells[0].value = 'FRENOS (SIN FUGAS DE AIRE)';
      interior1.columns[0].width = 110;
      rowsInterior1.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsInterior1.cells[j].value = dataList[0]['0'] == 'Buen estado'
              ? '/'
              : dataList[0]['0'] == 'No aplica'
                  ? 'n/a'
                  : 'x';
        }

        rowsInterior1.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsInterior1.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsInterior1.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      interior1.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 385, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid interior2 =
          syncfusion_flutter_pdf.PdfGrid();
      interior2.columns.add(count: 32);
      interior2.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsInterior2 = interior2.headers[0];
      rowsInterior2.cells[0].value =
          'MUELLES (SUSPENSION SIN HOJAS SUELTAS, ROTAS, FISURAS)';
      interior2.columns[0].width = 110;
      rowsInterior2.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsInterior2.cells[j].value = dataList[0]['0'] == 'Buen estado'
              ? '/'
              : dataList[0]['0'] == 'No aplica'
                  ? 'n/a'
                  : 'x';
        }

        rowsInterior2.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsInterior2.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsInterior2.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      interior2.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 390, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid interior3 =
          syncfusion_flutter_pdf.PdfGrid();
      interior3.columns.add(count: 32);
      interior3.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsInterior3 = interior3.headers[0];
      rowsInterior3.cells[0].value = 'CHASIS SIN FISURAS';
      interior3.columns[0].width = 110;
      rowsInterior3.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsInterior3.cells[j].value = dataList[0]['0'] == 'Buen estado'
              ? '/'
              : dataList[0]['0'] == 'No aplica'
                  ? 'n/a'
                  : 'x';
        }

        rowsInterior3.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsInterior3.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsInterior3.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      interior3.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 395, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid interior4 =
          syncfusion_flutter_pdf.PdfGrid();
      interior4.columns.add(count: 32);
      interior4.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsInterior4 = interior4.headers[0];
      rowsInterior4.cells[0].value = 'LINEAS DE AIRE';
      interior4.columns[0].width = 110;
      rowsInterior4.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsInterior4.cells[j].value = dataList[0]['0'] == 'Buen estado'
              ? '/'
              : dataList[0]['0'] == 'No aplica'
                  ? 'n/a'
                  : 'x';
        }

        rowsInterior4.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsInterior4.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsInterior4.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      interior4.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 400, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid interior5 =
          syncfusion_flutter_pdf.PdfGrid();
      interior5.columns.add(count: 32);
      interior5.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsInterior5 = interior5.headers[0];
      rowsInterior5.cells[0].value = 'LINEAS ELECTRICAS';
      interior5.columns[0].width = 110;
      rowsInterior5.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsInterior5.cells[j].value = dataList[0]['0'] == 'Buen estado'
              ? '/'
              : dataList[0]['0'] == 'No aplica'
                  ? 'n/a'
                  : 'x';
        }

        rowsInterior5.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsInterior5.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsInterior5.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      interior5.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 405, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid interior6 =
          syncfusion_flutter_pdf.PdfGrid();
      interior6.columns.add(count: 32);
      interior6.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsInterior6 = interior6.headers[0];
      rowsInterior6.cells[0].value = 'DIFERENCIAL SIN FUGAS';
      interior6.columns[0].width = 110;
      rowsInterior6.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsInterior6.cells[j].value = dataList[0]['0'] == 'Buen estado'
              ? '/'
              : dataList[0]['0'] == 'No aplica'
                  ? 'n/a'
                  : 'x';
        }

        rowsInterior6.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsInterior6.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsInterior6.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      interior6.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 410, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid interior7 =
          syncfusion_flutter_pdf.PdfGrid();
      interior7.columns.add(count: 32);
      interior7.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsInterior7 = interior7.headers[0];
      rowsInterior7.cells[0].value = 'TRANSMISION SIN FUGAS';
      interior7.columns[0].width = 110;
      rowsInterior7.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsInterior7.cells[j].value = dataList[0]['0'] == 'Buen estado'
              ? '/'
              : dataList[0]['0'] == 'No aplica'
                  ? 'n/a'
                  : 'x';
        }

        rowsInterior7.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsInterior7.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsInterior7.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      interior7.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 415, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid combustionInterna =
          syncfusion_flutter_pdf.PdfGrid();
      combustionInterna.columns.add(count: 1);
      combustionInterna.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowCombustionInterna =
          combustionInterna.headers[0];
      rowCombustionInterna.cells[0].value = 'AREA DE COMBUSTION INTERNA';
      frenteExterior.columns[0].width = 110;
      rowCombustionInterna.height = 10;
      rowCombustionInterna.cells[0].style = subHeaderStyle;
      combustionInterna.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 420, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid combustionInterna1 =
          syncfusion_flutter_pdf.PdfGrid();
      combustionInterna1.columns.add(count: 32);
      combustionInterna1.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsCombustionInterna1 =
          combustionInterna1.headers[0];
      rowsCombustionInterna1.cells[0].value = 'MOTOR';
      combustionInterna1.columns[0].width = 110;
      rowsCombustionInterna1.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsCombustionInterna1.cells[j].value =
              dataList[0]['0'] == 'Buen estado'
                  ? '/'
                  : dataList[0]['0'] == 'No aplica'
                      ? 'n/a'
                      : 'x';
        }

        rowsCombustionInterna1.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsCombustionInterna1.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsCombustionInterna1.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      combustionInterna1.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 430, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid combustionInterna2 =
          syncfusion_flutter_pdf.PdfGrid();
      combustionInterna2.columns.add(count: 32);
      combustionInterna2.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsCombustionInterna2 =
          combustionInterna2.headers[0];
      rowsCombustionInterna2.cells[0].value = 'RADIADOR';
      combustionInterna2.columns[0].width = 110;
      rowsCombustionInterna2.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsCombustionInterna2.cells[j].value =
              dataList[0]['0'] == 'Buen estado'
                  ? '/'
                  : dataList[0]['0'] == 'No aplica'
                      ? 'n/a'
                      : 'x';
        }

        rowsCombustionInterna2.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsCombustionInterna2.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsCombustionInterna2.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      combustionInterna2.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 435, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid combustionInterna3 =
          syncfusion_flutter_pdf.PdfGrid();
      combustionInterna3.columns.add(count: 32);
      combustionInterna3.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsCombustionInterna3 =
          combustionInterna3.headers[0];
      rowsCombustionInterna3.cells[0].value = 'BATERIA';
      combustionInterna3.columns[0].width = 110;
      rowsCombustionInterna3.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsCombustionInterna3.cells[j].value =
              dataList[0]['0'] == 'Buen estado'
                  ? '/'
                  : dataList[0]['0'] == 'No aplica'
                      ? 'n/a'
                      : 'x';
        }

        rowsCombustionInterna3.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsCombustionInterna3.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsCombustionInterna3.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      combustionInterna3.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 440, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid combustionInterna4 =
          syncfusion_flutter_pdf.PdfGrid();
      combustionInterna4.columns.add(count: 32);
      combustionInterna4.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsCombustionInterna4 =
          combustionInterna4.headers[0];
      rowsCombustionInterna4.cells[0].value = 'BANDAS';
      combustionInterna4.columns[0].width = 110;
      rowsCombustionInterna4.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsCombustionInterna4.cells[j].value =
              dataList[0]['0'] == 'Buen estado'
                  ? '/'
                  : dataList[0]['0'] == 'No aplica'
                      ? 'n/a'
                      : 'x';
        }

        rowsCombustionInterna4.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsCombustionInterna4.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsCombustionInterna4.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      combustionInterna4.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 445, 0, 0),
      );
      syncfusion_flutter_pdf.PdfGrid emergencia =
          syncfusion_flutter_pdf.PdfGrid();
      emergencia.columns.add(count: 1);
      emergencia.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsEmergencia = emergencia.headers[0];
      rowsEmergencia.cells[0].value = 'EQUIPO DE EMERGENCIA';
      frenteExterior.columns[0].width = 110;
      rowsEmergencia.height = 10;
      rowsEmergencia.cells[0].style = subHeaderStyle;
      emergencia.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 450, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid emergencia1 =
          syncfusion_flutter_pdf.PdfGrid();
      emergencia1.columns.add(count: 32);
      emergencia1.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsEmergencia1 =
          emergencia1.headers[0];
      rowsEmergencia1.cells[0].value =
          'LIBRO U HOJA DE INFORMACIÓN DE EMERGENCIA';
      emergencia1.columns[0].width = 110;
      rowsEmergencia1.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsEmergencia1.cells[j].value = dataList[0]['0'] == 'Buen estado'
              ? '/'
              : dataList[0]['0'] == 'No aplica'
                  ? 'n/a'
                  : 'x';
        }

        rowsEmergencia1.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsEmergencia1.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsEmergencia1.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      emergencia1.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 460, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid emergencia2 =
          syncfusion_flutter_pdf.PdfGrid();
      emergencia2.columns.add(count: 32);
      emergencia2.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsEmergencia2 =
          emergencia2.headers[0];
      rowsEmergencia2.cells[0].value = 'BOTIQUIN DE PRIMEROS AUXILIOS';
      emergencia2.columns[0].width = 110;
      rowsEmergencia2.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsEmergencia2.cells[j].value = dataList[0]['0'] == 'Buen estado'
              ? '/'
              : dataList[0]['0'] == 'No aplica'
                  ? 'n/a'
                  : 'x';
        }

        rowsEmergencia2.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsEmergencia2.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsEmergencia2.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      emergencia2.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 465, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid emergencia3 =
          syncfusion_flutter_pdf.PdfGrid();
      emergencia3.columns.add(count: 32);
      emergencia3.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsEmergencia3 =
          emergencia3.headers[0];
      rowsEmergencia3.cells[0].value =
          'EQUIPO DE SEGURIRDAD (DE ACUERDO A LA \nINFORMACION DE EMERGENCIA DE TRANSPORTACION)';
      emergencia3.columns[0].width = 110;
      rowsEmergencia3.height = 15;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsEmergencia3.cells[j].value = dataList[0]['0'] == 'Buen estado'
              ? '/'
              : dataList[0]['0'] == 'No aplica'
                  ? 'n/a'
                  : 'x';
        }

        rowsEmergencia3.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsEmergencia3.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsEmergencia3.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      emergencia3.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 470, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid emergencia4 =
          syncfusion_flutter_pdf.PdfGrid();
      emergencia4.columns.add(count: 32);
      emergencia4.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsEmergencia4 =
          emergencia4.headers[0];
      rowsEmergencia4.cells[0].value = 'TRIANGULOS DE SEGURIDAD (MINIMO 3)';
      emergencia4.columns[0].width = 110;
      rowsEmergencia4.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsEmergencia4.cells[j].value = dataList[0]['0'] == 'Buen estado'
              ? '/'
              : dataList[0]['0'] == 'No aplica'
                  ? 'n/a'
                  : 'x';
        }

        rowsEmergencia4.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsEmergencia4.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsEmergencia4.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      emergencia4.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 485, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid emergencia5 =
          syncfusion_flutter_pdf.PdfGrid();
      emergencia5.columns.add(count: 32);
      emergencia5.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsEmergencia5 =
          emergencia5.headers[0];
      rowsEmergencia5.cells[0].value = 'RETRANCAS (MINIMO 2)';
      emergencia5.columns[0].width = 110;
      rowsEmergencia5.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsEmergencia5.cells[j].value = dataList[0]['0'] == 'Buen estado'
              ? '/'
              : dataList[0]['0'] == 'No aplica'
                  ? 'n/a'
                  : 'x';
        }

        rowsEmergencia5.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsEmergencia5.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsEmergencia5.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      emergencia5.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 490, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid posterior =
          syncfusion_flutter_pdf.PdfGrid();
      posterior.columns.add(count: 1);
      posterior.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsPosterior = posterior.headers[0];
      rowsPosterior.cells[0].value = 'PARTE POSTERIOR';
      frenteExterior.columns[0].width = 110;
      rowsPosterior.height = 10;
      rowsPosterior.cells[0].style = subHeaderStyle;
      posterior.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 495, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid lucesPosterior =
          syncfusion_flutter_pdf.PdfGrid();
      lucesPosterior.columns.add(count: 1);
      lucesPosterior.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsLucesPosterior =
          lucesPosterior.headers[0];
      rowsLucesPosterior.cells[0].style.stringFormat =
          syncfusion_flutter_pdf.PdfStringFormat(
              alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);
      rowsLucesPosterior.height = 30;

      rowsLucesPosterior.cells[0].value = '\nLUCES';
      lucesPosterior.columns[0].width = 40;

      rowsLucesPosterior.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      lucesPosterior.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 505, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid posterior1 =
          syncfusion_flutter_pdf.PdfGrid();
      posterior1.columns.add(count: 32);
      posterior1.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsPosterior1 = posterior1.headers[0];
      rowsPosterior1.cells[0].value = 'GALIBO (ALTURA)';
      posterior1.columns[0].width = 70;
      rowsPosterior1.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsPosterior1.cells[j].value = dataList[0]['0'] == 'Buen estado'
              ? '/'
              : dataList[0]['0'] == 'No aplica'
                  ? 'n/a'
                  : 'x';
        }

        rowsPosterior1.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsPosterior1.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsPosterior1.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      posterior1.draw(
        page: page,
        bounds: const Rect.fromLTWH(40, 505, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid posterior2 =
          syncfusion_flutter_pdf.PdfGrid();
      posterior2.columns.add(count: 32);
      posterior2.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsPosterior2 = posterior2.headers[0];
      rowsPosterior2.cells[0].value = 'DIRECCIONALES';
      posterior2.columns[0].width = 70;
      rowsPosterior2.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsPosterior2.cells[j].value = dataList[0]['0'] == 'Buen estado'
              ? '/'
              : dataList[0]['0'] == 'No aplica'
                  ? 'n/a'
                  : 'x';
        }

        rowsPosterior2.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsPosterior2.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsPosterior2.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      posterior2.draw(
        page: page,
        bounds: const Rect.fromLTWH(40, 510, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid posterior3 =
          syncfusion_flutter_pdf.PdfGrid();
      posterior3.columns.add(count: 32);
      posterior3.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsPosterior3 = posterior3.headers[0];
      rowsPosterior3.cells[0].value = 'DE ESTACIONAMIENTO';
      posterior3.columns[0].width = 70;
      rowsPosterior3.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsPosterior3.cells[j].value = dataList[0]['0'] == 'Buen estado'
              ? '/'
              : dataList[0]['0'] == 'No aplica'
                  ? 'n/a'
                  : 'x';
        }

        rowsPosterior3.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsPosterior3.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsPosterior3.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      posterior3.draw(
        page: page,
        bounds: const Rect.fromLTWH(40, 515, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid posterior4 =
          syncfusion_flutter_pdf.PdfGrid();
      posterior4.columns.add(count: 32);
      posterior4.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsPosterior4 = posterior4.headers[0];
      rowsPosterior4.cells[0].value = 'DE ADVERTENCIA';
      posterior4.columns[0].width = 70;
      rowsPosterior4.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsPosterior4.cells[j].value = dataList[0]['0'] == 'Buen estado'
              ? '/'
              : dataList[0]['0'] == 'No aplica'
                  ? 'n/a'
                  : 'x';
        }

        rowsPosterior4.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsPosterior4.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsPosterior4.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      posterior4.draw(
        page: page,
        bounds: const Rect.fromLTWH(40, 520, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid posterior5 =
          syncfusion_flutter_pdf.PdfGrid();
      posterior5.columns.add(count: 32);
      posterior5.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsPosterior5 = posterior5.headers[0];
      rowsPosterior5.cells[0].value = 'DE FRENADO';
      posterior5.columns[0].width = 70;
      rowsPosterior5.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsPosterior5.cells[j].value = dataList[0]['0'] == 'Buen estado'
              ? '/'
              : dataList[0]['0'] == 'No aplica'
                  ? 'n/a'
                  : 'x';
        }

        rowsPosterior5.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsPosterior5.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsPosterior5.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      posterior5.draw(
        page: page,
        bounds: const Rect.fromLTWH(40, 525, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid posterior6 =
          syncfusion_flutter_pdf.PdfGrid();
      posterior6.columns.add(count: 32);
      posterior6.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsPosterior6 = posterior6.headers[0];
      rowsPosterior6.cells[0].value = 'DE MARCHA ATRAS';
      posterior6.columns[0].width = 70;
      rowsPosterior6.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsPosterior6.cells[j].value = dataList[0]['0'] == 'Buen estado'
              ? '/'
              : dataList[0]['0'] == 'No aplica'
                  ? 'n/a'
                  : 'x';
        }

        rowsPosterior6.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsPosterior6.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsPosterior6.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      posterior6.draw(
        page: page,
        bounds: const Rect.fromLTWH(40, 530, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid posterior7 =
          syncfusion_flutter_pdf.PdfGrid();
      posterior7.columns.add(count: 32);
      posterior7.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsPosterior7 = posterior7.headers[0];
      rowsPosterior7.cells[0].value = 'REFLEJANTES';
      posterior7.columns[0].width = 110;
      rowsPosterior7.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsPosterior7.cells[j].value = dataList[0]['0'] == 'Buen estado'
              ? '/'
              : dataList[0]['0'] == 'No aplica'
                  ? 'n/a'
                  : 'x';
        }

        rowsPosterior7.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsPosterior7.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsPosterior7.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      posterior7.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 535, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid posterior8 =
          syncfusion_flutter_pdf.PdfGrid();
      posterior8.columns.add(count: 32);
      posterior8.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsPosterior8 = posterior8.headers[0];
      rowsPosterior8.cells[0].value = 'GUARDA FANGOS (LODERAS)';
      posterior8.columns[0].width = 110;
      rowsPosterior8.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsPosterior8.cells[j].value = dataList[0]['0'] == 'Buen estado'
              ? '/'
              : dataList[0]['0'] == 'No aplica'
                  ? 'n/a'
                  : 'x';
        }

        rowsPosterior8.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsPosterior8.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsPosterior8.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      posterior8.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 540, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid posterior9 =
          syncfusion_flutter_pdf.PdfGrid();
      posterior9.columns.add(count: 32);
      posterior9.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsPosterior9 = posterior9.headers[0];
      rowsPosterior9.cells[0].value = 'DISPOSITIVOS DE ASEGURAMIENTO';
      posterior9.columns[0].width = 110;
      rowsPosterior9.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsPosterior9.cells[j].value = dataList[0]['0'] == 'Buen estado'
              ? '/'
              : dataList[0]['0'] == 'No aplica'
                  ? 'n/a'
                  : 'x';
        }

        rowsPosterior9.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsPosterior9.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsPosterior9.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      posterior9.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 545, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid posterior10 =
          syncfusion_flutter_pdf.PdfGrid();
      posterior10.columns.add(count: 32);
      posterior10.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsPosterior10 =
          posterior10.headers[0];
      rowsPosterior10.cells[0].value = 'CERRADURA DE PUERTAS';
      posterior10.columns[0].width = 110;
      rowsPosterior10.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsPosterior10.cells[j].value = dataList[0]['0'] == 'Buen estado'
              ? '/'
              : dataList[0]['0'] == 'No aplica'
                  ? 'n/a'
                  : 'x';
        }

        rowsPosterior10.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsPosterior10.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsPosterior10.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      posterior10.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 550, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid posterior11 =
          syncfusion_flutter_pdf.PdfGrid();
      posterior11.columns.add(count: 32);
      posterior11.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsPosterior11 =
          posterior11.headers[0];
      rowsPosterior11.cells[0].value = 'DEFENSA';
      posterior11.columns[0].width = 110;
      rowsPosterior11.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsPosterior11.cells[j].value = dataList[0]['0'] == 'Buen estado'
              ? '/'
              : dataList[0]['0'] == 'No aplica'
                  ? 'n/a'
                  : 'x';
        }

        rowsPosterior11.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsPosterior11.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsPosterior11.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      posterior11.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 555, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid posterior12 =
          syncfusion_flutter_pdf.PdfGrid();
      posterior12.columns.add(count: 32);
      posterior12.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsPosterior12 =
          posterior12.headers[0];
      rowsPosterior12.cells[0].value = 'ESCAPE';
      posterior12.columns[0].width = 110;
      rowsPosterior12.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsPosterior12.cells[j].value = dataList[0]['0'] == 'Buen estado'
              ? '/'
              : dataList[0]['0'] == 'No aplica'
                  ? 'n/a'
                  : 'x';
        }

        rowsPosterior12.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsPosterior12.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsPosterior12.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      posterior12.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 560, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid remolque =
          syncfusion_flutter_pdf.PdfGrid();
      remolque.columns.add(count: 1);
      remolque.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsRemolque = remolque.headers[0];
      rowsRemolque.cells[0].value =
          'REMOLQUE, SEMIREMOLQUE (INCLUYENDO TIPO DE TANQUE) ';
      rowsRemolque.height = 10;
      rowsRemolque.cells[0].style = subHeaderStyle;
      remolque.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 565, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid remolque1 =
          syncfusion_flutter_pdf.PdfGrid();
      remolque1.columns.add(count: 32);
      remolque1.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsRemolque1 = remolque1.headers[0];
      rowsRemolque1.cells[0].value = 'FRENO REMOLQUE';
      remolque1.columns[0].width = 110;
      rowsRemolque1.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsRemolque1.cells[j].value = dataList[0]['0'] == 'Buen estado'
              ? '/'
              : dataList[0]['0'] == 'No aplica'
                  ? 'n/a'
                  : 'x';
        }

        rowsRemolque1.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsRemolque1.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsRemolque1.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      remolque1.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 575, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid remolque2 =
          syncfusion_flutter_pdf.PdfGrid();
      remolque2.columns.add(count: 32);
      remolque2.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsRemolque2 = remolque2.headers[0];
      rowsRemolque2.cells[0].value = 'LINEAS ELECTRICAS (SUJETAS)';
      remolque2.columns[0].width = 110;
      rowsRemolque2.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsRemolque2.cells[j].value = dataList[0]['0'] == 'Buen estado'
              ? '/'
              : dataList[0]['0'] == 'No aplica'
                  ? 'n/a'
                  : 'x';
        }

        rowsRemolque2.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsRemolque2.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsRemolque2.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      remolque2.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 580, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid remolque3 =
          syncfusion_flutter_pdf.PdfGrid();
      remolque3.columns.add(count: 32);
      remolque3.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsRemolque3 = remolque3.headers[0];
      rowsRemolque3.cells[0].value = 'CONEXIONES DE FRENOS';
      remolque3.columns[0].width = 110;
      rowsRemolque3.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsRemolque3.cells[j].value = dataList[0]['0'] == 'Buen estado'
              ? '/'
              : dataList[0]['0'] == 'No aplica'
                  ? 'n/a'
                  : 'x';
        }

        rowsRemolque3.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsRemolque3.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsRemolque3.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      remolque3.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 585, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid remolque4 =
          syncfusion_flutter_pdf.PdfGrid();
      remolque4.columns.add(count: 32);
      remolque4.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsRemolque4 = remolque4.headers[0];
      rowsRemolque4.cells[0].value = 'CONEXION QUINTA RUEDA';
      remolque4.columns[0].width = 110;
      rowsRemolque4.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsRemolque4.cells[j].value = dataList[0]['0'] == 'Buen estado'
              ? '/'
              : dataList[0]['0'] == 'No aplica'
                  ? 'n/a'
                  : 'x';
        }

        rowsRemolque4.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsRemolque4.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsRemolque4.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      remolque4.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 590, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid remolque5 =
          syncfusion_flutter_pdf.PdfGrid();
      remolque5.columns.add(count: 32);
      remolque5.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsRemolque5 = remolque5.headers[0];
      rowsRemolque5.cells[0].value = 'PATINES';
      remolque5.columns[0].width = 110;
      rowsRemolque5.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsRemolque5.cells[j].value = dataList[0]['0'] == 'Buen estado'
              ? '/'
              : dataList[0]['0'] == 'No aplica'
                  ? 'n/a'
                  : 'x';
        }

        rowsRemolque5.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsRemolque5.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsRemolque5.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      remolque5.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 595, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid remolque6 =
          syncfusion_flutter_pdf.PdfGrid();
      remolque6.columns.add(count: 32);
      remolque6.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsRemolque6 = remolque6.headers[0];
      rowsRemolque6.cells[0].value = 'CERRADURA DE PUERTAS';
      remolque6.columns[0].width = 110;
      rowsRemolque6.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsRemolque6.cells[j].value = dataList[0]['0'] == 'Buen estado'
              ? '/'
              : dataList[0]['0'] == 'No aplica'
                  ? 'n/a'
                  : 'x';
        }

        rowsRemolque6.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsRemolque6.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsRemolque6.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      remolque6.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 600, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid remolque7 =
          syncfusion_flutter_pdf.PdfGrid();
      remolque7.columns.add(count: 32);
      remolque7.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsRemolque7 = remolque7.headers[0];
      rowsRemolque7.cells[0].value = 'CARTELES DE RIESGO (4) O (8)';
      remolque7.columns[0].width = 110;
      rowsRemolque7.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsRemolque7.cells[j].value = dataList[0]['0'] == 'Buen estado'
              ? '/'
              : dataList[0]['0'] == 'No aplica'
                  ? 'n/a'
                  : 'x';
        }

        rowsRemolque7.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsRemolque7.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsRemolque7.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      remolque7.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 605, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid lucesRemolque =
          syncfusion_flutter_pdf.PdfGrid();
      lucesRemolque.columns.add(count: 1);
      lucesRemolque.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsLucesRemolque =
          lucesRemolque.headers[0];
      rowsLucesRemolque.cells[0].style.stringFormat =
          syncfusion_flutter_pdf.PdfStringFormat(
              alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);
      rowsLucesRemolque.height = 40;

      rowsLucesRemolque.cells[0].value = '\n\nLUCES';
      lucesRemolque.columns[0].width = 40;

      rowsLucesRemolque.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      lucesRemolque.draw(
        page: page,
        bounds: const Rect.fromLTWH(0, 610, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid remolque8 =
          syncfusion_flutter_pdf.PdfGrid();
      remolque8.columns.add(count: 32);
      remolque8.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsRemolque8 = remolque8.headers[0];
      rowsRemolque8.cells[0].value = 'DEMARCADORAS';
      remolque8.columns[0].width = 70;
      rowsRemolque8.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsRemolque8.cells[j].value = dataList[0]['0'] == 'Buen estado'
              ? '/'
              : dataList[0]['0'] == 'No aplica'
                  ? 'n/a'
                  : 'x';
        }

        rowsRemolque8.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsRemolque8.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsRemolque8.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      remolque8.draw(
        page: page,
        bounds: const Rect.fromLTWH(40, 610, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid remolque9 =
          syncfusion_flutter_pdf.PdfGrid();
      remolque9.columns.add(count: 32);
      remolque9.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsRemolque9 = remolque9.headers[0];
      rowsRemolque9.cells[0].value = 'DE IDENTIFICACION (PORTA PLACA)';
      remolque9.columns[0].width = 70;
      rowsRemolque9.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsRemolque9.cells[j].value = dataList[0]['0'] == 'Buen estado'
              ? '/'
              : dataList[0]['0'] == 'No aplica'
                  ? 'n/a'
                  : 'x';
        }

        rowsRemolque9.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsRemolque9.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsRemolque9.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      remolque9.draw(
        page: page,
        bounds: const Rect.fromLTWH(40, 615, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid remolque10 =
          syncfusion_flutter_pdf.PdfGrid();
      remolque10.columns.add(count: 32);
      remolque10.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsRemolque10 = remolque10.headers[0];
      rowsRemolque10.cells[0].value = 'DIRECCIONALES';
      remolque10.columns[0].width = 70;
      rowsRemolque10.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsRemolque10.cells[j].value = dataList[0]['0'] == 'Buen estado'
              ? '/'
              : dataList[0]['0'] == 'No aplica'
                  ? 'n/a'
                  : 'x';
        }

        rowsRemolque10.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsRemolque10.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsRemolque10.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      remolque10.draw(
        page: page,
        bounds: const Rect.fromLTWH(40, 620, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid remolque11 =
          syncfusion_flutter_pdf.PdfGrid();
      remolque11.columns.add(count: 32);
      remolque11.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsRemolque11 = remolque11.headers[0];
      rowsRemolque11.cells[0].value = 'DE ESTACIONAMIENTO';
      remolque11.columns[0].width = 70;
      rowsRemolque11.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsRemolque11.cells[j].value = dataList[0]['0'] == 'Buen estado'
              ? '/'
              : dataList[0]['0'] == 'No aplica'
                  ? 'n/a'
                  : 'x';
        }

        rowsRemolque11.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsRemolque11.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsRemolque11.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      remolque11.draw(
        page: page,
        bounds: const Rect.fromLTWH(40, 625, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid remolque12 =
          syncfusion_flutter_pdf.PdfGrid();
      remolque12.columns.add(count: 32);
      remolque12.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsRemolque12 = remolque12.headers[0];
      rowsRemolque12.cells[0].value = 'DE GALIBO (ALTURA)';
      remolque12.columns[0].width = 70;
      rowsRemolque12.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsRemolque12.cells[j].value = dataList[0]['0'] == 'Buen estado'
              ? '/'
              : dataList[0]['0'] == 'No aplica'
                  ? 'n/a'
                  : 'x';
        }

        rowsRemolque12.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsRemolque12.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsRemolque12.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      remolque12.draw(
        page: page,
        bounds: const Rect.fromLTWH(40, 630, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid remolque13 =
          syncfusion_flutter_pdf.PdfGrid();
      remolque13.columns.add(count: 32);
      remolque13.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsRemolque13 = remolque13.headers[0];
      rowsRemolque13.cells[0].value = 'DE ADVERTENCIA';
      remolque13.columns[0].width = 70;
      rowsRemolque13.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsRemolque13.cells[j].value = dataList[0]['0'] == 'Buen estado'
              ? '/'
              : dataList[0]['0'] == 'No aplica'
                  ? 'n/a'
                  : 'x';
        }

        rowsRemolque13.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsRemolque13.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsRemolque13.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      remolque13.draw(
        page: page,
        bounds: const Rect.fromLTWH(40, 635, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid remolque14 =
          syncfusion_flutter_pdf.PdfGrid();
      remolque14.columns.add(count: 32);
      remolque14.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsRemolque14 = remolque14.headers[0];
      rowsRemolque14.cells[0].value = 'DE FRENADO';
      remolque14.columns[0].width = 70;
      rowsRemolque14.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsRemolque14.cells[j].value = dataList[0]['0'] == 'Buen estado'
              ? '/'
              : dataList[0]['0'] == 'No aplica'
                  ? 'n/a'
                  : 'x';
        }

        rowsRemolque14.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsRemolque14.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsRemolque14.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      remolque14.draw(
        page: page,
        bounds: const Rect.fromLTWH(40, 640, 0, 0),
      );

      syncfusion_flutter_pdf.PdfGrid remolque15 =
          syncfusion_flutter_pdf.PdfGrid();
      remolque15.columns.add(count: 32);
      remolque15.headers.add(1);
      syncfusion_flutter_pdf.PdfGridRow rowsRemolque15 = remolque15.headers[0];
      rowsRemolque15.cells[0].value = 'DE MARCHA ATRAS';
      remolque15.columns[0].width = 70;
      rowsRemolque15.height = 5;
      for (int j = 1; j <= 31; j++) {
        if (j == day) {
          rowsRemolque15.cells[j].value = dataList[0]['0'] == 'Buen estado'
              ? '/'
              : dataList[0]['0'] == 'No aplica'
                  ? 'n/a'
                  : 'x';
        }

        rowsRemolque15.cells[j].stringFormat =
            syncfusion_flutter_pdf.PdfStringFormat(
                alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);

        rowsRemolque15.cells[j].style.font =
            syncfusion_flutter_pdf.PdfStandardFont(
          syncfusion_flutter_pdf.PdfFontFamily.helvetica,
          4, // Desired font size
        );
      }
      rowsRemolque15.cells[0].style.font =
          syncfusion_flutter_pdf.PdfStandardFont(
        syncfusion_flutter_pdf.PdfFontFamily.helvetica,
        4, // Desired font size
      );
      remolque15.draw(
        page: page,
        bounds: const Rect.fromLTWH(40, 645, 0, 0),
      );
    } //END FOR

    syncfusion_flutter_pdf.PdfGrid criterios = syncfusion_flutter_pdf.PdfGrid();
    criterios.columns.add(count: 1);
    criterios.headers.add(1);
    syncfusion_flutter_pdf.PdfGridRow rowsCriterios = criterios.headers[0];
    rowsCriterios.cells[0].value = 'CRITERIOS PARA EVALUAR LA INSPECCION';
    criterios.columns[0].width = 200;
    rowsCriterios.height = 10;
    rowsCriterios.cells[0].style = headerStyle;
    criterios.draw(
      page: page,
      bounds: const Rect.fromLTWH(0, 655, 0, 0),
    );

    syncfusion_flutter_pdf.PdfGrid criterio1 = syncfusion_flutter_pdf.PdfGrid();
    criterio1.columns.add(count: 6);
    criterio1.headers.add(1);
    syncfusion_flutter_pdf.PdfGridRow rowsCriterio1 = criterio1.headers[0];
    rowsCriterio1.cells[0].value = 'n/a';
    criterio1.columns[0].width = 20;

    rowsCriterio1.cells[1].value = 'No aplica';
    criterio1.columns[1].width = 40;

    rowsCriterio1.cells[2].value = '/';
    criterio1.columns[2].width = 20;

    rowsCriterio1.cells[3].value = 'Buen estado';
    criterio1.columns[3].width = 50;

    rowsCriterio1.cells[4].value = 'x';
    criterio1.columns[4].width = 20;

    rowsCriterio1.cells[5].value = 'Mal estado';
    criterio1.columns[5].width = 50;

    rowsCriterio1.height = 10;
    rowsCriterio1.cells[0].stringFormat = centerText;
    rowsCriterio1.cells[1].stringFormat = centerText;
    rowsCriterio1.cells[2].stringFormat = centerText;
    rowsCriterio1.cells[3].stringFormat = centerText;
    rowsCriterio1.cells[4].stringFormat = centerText;
    rowsCriterio1.cells[5].stringFormat = centerText;
    criterio1.draw(
      page: page,
      bounds: const Rect.fromLTWH(0, 670, 0, 0),
    );

    syncfusion_flutter_pdf.PdfGrid nombre = syncfusion_flutter_pdf.PdfGrid();
    nombre.columns.add(count: 1);
    nombre.headers.add(1);
    syncfusion_flutter_pdf.PdfGridRow rowsNombre = nombre.headers[0];
    rowsNombre.cells[0].value = '';
    rowsNombre.height = 50;
    nombre.draw(
      page: page,
      bounds: const Rect.fromLTWH(300, 655, 0, 0),
    );
    syncfusion_flutter_pdf.PdfGrid firma = syncfusion_flutter_pdf.PdfGrid();
    firma.columns.add(count: 1);
    firma.headers.add(1);
    syncfusion_flutter_pdf.PdfGridRow rowsFirma = firma.headers[0];
    rowsFirma.cells[0].value = 'Nombre y firma del operador';
    rowsFirma.height = 10;
    rowsFirma.cells[0].stringFormat = centerText;
    firma.draw(
      page: page,
      bounds: const Rect.fromLTWH(300, 705, 0, 0),
    );

    syncfusion_flutter_pdf.PdfGrid observaciones =
        syncfusion_flutter_pdf.PdfGrid();
    observaciones.columns.add(count: 1);
    observaciones.headers.add(1);
    syncfusion_flutter_pdf.PdfGridRow rowsObservaciones =
        observaciones.headers[0];
    rowsObservaciones.cells[0].value =
        'OBSERVACIONES SOBRE FALLAS PRESENTADAS EN EL MES';
    rowsObservaciones.height = 10;
    rowsObservaciones.cells[0].stringFormat = centerText;
    observaciones.draw(
      page: page,
      bounds: const Rect.fromLTWH(0, 720, 0, 0),
    );

    syncfusion_flutter_pdf.PdfGrid tblObservaciones =
        syncfusion_flutter_pdf.PdfGrid();
    tblObservaciones.columns.add(count: 4);
    tblObservaciones.headers.add(1);
    syncfusion_flutter_pdf.PdfGridRow rowsTblObservaciones =
        tblObservaciones.headers[0];
    rowsTblObservaciones.cells[0].value = 'Fecha';
    tblObservaciones.columns[0].width = 40;

    rowsTblObservaciones.cells[1].value = 'Hora';
    tblObservaciones.columns[1].width = 40;

    rowsTblObservaciones.cells[2].value = 'Lugar';

    rowsTblObservaciones.cells[3].value = 'Sistema o Componente';

    rowsTblObservaciones.height = 10;
    rowsTblObservaciones.cells[0].stringFormat = centerText;
    rowsTblObservaciones.cells[1].stringFormat = centerText;
    rowsTblObservaciones.cells[2].stringFormat = centerText;
    rowsTblObservaciones.cells[3].stringFormat = centerText;
    tblObservaciones.draw(
      page: page,
      bounds: const Rect.fromLTWH(0, 730, 0, 0),
    );
    syncfusion_flutter_pdf.PdfGrid tblCampos1 =
        syncfusion_flutter_pdf.PdfGrid();
    tblCampos1.columns.add(count: 4);
    tblCampos1.headers.add(1);
    syncfusion_flutter_pdf.PdfGridRow rowsTblCampos1 = tblCampos1.headers[0];
    rowsTblCampos1.cells[0].value = '';
    tblCampos1.columns[0].width = 40;

    rowsTblCampos1.cells[1].value = '';
    tblCampos1.columns[1].width = 40;

    rowsTblCampos1.cells[2].value = '';

    rowsTblCampos1.cells[3].value = '';

    rowsTblCampos1.height = 10;
    tblCampos1.draw(
      page: page,
      bounds: const Rect.fromLTWH(0, 740, 0, 0),
    );

    syncfusion_flutter_pdf.PdfGrid descripcion =
        syncfusion_flutter_pdf.PdfGrid();
    descripcion.columns.add(count: 1);
    descripcion.headers.add(1);
    syncfusion_flutter_pdf.PdfGridRow rowsDescripcion = descripcion.headers[0];
    rowsDescripcion.cells[0].value = 'Descripción';
    rowsDescripcion.height = 10;
    rowsDescripcion.cells[0].stringFormat = centerText;
    descripcion.draw(
      page: page,
      bounds: const Rect.fromLTWH(0, 755, 0, 0),
    );

    syncfusion_flutter_pdf.PdfGrid txtdescripcion =
        syncfusion_flutter_pdf.PdfGrid();
    txtdescripcion.columns.add(count: 1);
    txtdescripcion.headers.add(1);
    syncfusion_flutter_pdf.PdfGridRow rowsTxtDescripcion =
        txtdescripcion.headers[0];
    rowsTxtDescripcion.cells[0].value = '';
    rowsTxtDescripcion.height = 50;
    txtdescripcion.draw(
      page: page,
      bounds: const Rect.fromLTWH(0, 765, 0, 0),
    );

    syncfusion_flutter_pdf.PdfGrid manteni = syncfusion_flutter_pdf.PdfGrid();
    manteni.columns.add(count: 1);
    manteni.headers.add(1);
    syncfusion_flutter_pdf.PdfGridRow rowsManteni = manteni.headers[0];
    rowsManteni.cells[0].value =
        'Observaciones para el mantenimiento preventivo';
    rowsManteni.height = 10;
    rowsManteni.cells[0].stringFormat = centerText;
    manteni.draw(
      page: page,
      bounds: const Rect.fromLTWH(0, 815, 0, 0),
    );

    syncfusion_flutter_pdf.PdfGrid txtmanteni =
        syncfusion_flutter_pdf.PdfGrid();
    txtmanteni.columns.add(count: 1);
    txtmanteni.headers.add(1);
    syncfusion_flutter_pdf.PdfGridRow rowsTxtManteni = txtmanteni.headers[0];
    rowsTxtManteni.cells[0].value = '';
    rowsTxtManteni.height = 50;
    txtmanteni.draw(
      page: page,
      bounds: const Rect.fromLTWH(0, 825, 0, 0),
    );

    List<int> bytes = await document.save();
    document.dispose();
    saveAndLaunchFile(bytes, 'inspeccion.pdf');
  }
}
