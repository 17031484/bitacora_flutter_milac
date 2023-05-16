import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_app/navbar.dart';
import '../global.dart' as globals;
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
                String rutaCorta = globals.ruta.substring(0, 20) + '...';
                List<Map> records = snapshot.data!;
                return Center(
                  child: Column(
                    children: records.map((record) {
                      String buttonText = 'Viaje: ' +
                          record['no_viaje'].toString() +
                          '\nFecha: ' +
                          record['fecha'] +
                          '\nRuta: ' +
                          rutaCorta;
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          width: 350,
                          height: 100,
                          child: ElevatedButton(
                              onPressed: () {
                                _createPDF(record);
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

  Future<void> _createPDF(record) async {
    List<Map<String, dynamic>> dataList =
        jsonDecode(record['respuestas']).cast<Map<String, dynamic>>();
    //print(dataList[0]['0']);
    //print(dataList);
    String dateString = record['fecha'];
    DateFormat dateFormat = DateFormat('yyyy-MM-dd');
    DateTime date = dateFormat.parse(dateString);
    int day = date.day;
    String month = getStringMonth(date.month);
    int year = date.year;

    syncfusion_flutter_pdf.PdfDocument document =
        syncfusion_flutter_pdf.PdfDocument();

    document.pageSettings.size = syncfusion_flutter_pdf.PdfPageSize.legal;

    final page = document.pages.add();

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
        'Nombre del operador: ${globals.operador}           firma: _______________________',
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

    syncfusion_flutter_pdf.PdfGridCellStyle headerStyle =
        syncfusion_flutter_pdf.PdfGridCellStyle();
    headerStyle.backgroundBrush = syncfusion_flutter_pdf.PdfSolidBrush(
        syncfusion_flutter_pdf.PdfColor(0, 0, 0));
    headerStyle.textBrush = syncfusion_flutter_pdf.PdfBrushes.white;
    headerStyle.stringFormat = syncfusion_flutter_pdf.PdfStringFormat(
        alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);
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
    for (int i = 1; i <= 31; i++) {
      rowsRevisionInterna.cells[i].value = '${i}';
      rowsRevisionInterna.cells[i].stringFormat =
          syncfusion_flutter_pdf.PdfStringFormat(
              alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);
      ;
    }

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
    rowsRevisionIntern1.height = 10;
    for (int i = 1; i <= 31; i++) {
      if (i == day) {
        rowsRevisionIntern1.cells[i].value = dataList[0]['0'] == 'Buen estado'
            ? '/'
            : dataList[0]['0'] == 'No aplica'
                ? 'n/a'
                : 'x';
      } else
        rowsRevisionIntern1.cells[i].value = '';

      rowsRevisionIntern1.cells[i].stringFormat =
          syncfusion_flutter_pdf.PdfStringFormat(
              alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);
    }

    rowsRevisionIntern1.cells[0].style.font =
        syncfusion_flutter_pdf.PdfStandardFont(
      syncfusion_flutter_pdf.PdfFontFamily.helvetica,
      4, // Desired font size
    );

    revisionInterna1.draw(
      page: page,
      bounds: const Rect.fromLTWH(0, 90, 0, 0),
    );

    syncfusion_flutter_pdf.PdfGrid revisionInterna2 =
        syncfusion_flutter_pdf.PdfGrid();
    revisionInterna2.columns.add(count: 32);
    revisionInterna2.headers.add(1);
    syncfusion_flutter_pdf.PdfGridRow rowsRevisionIntern2 =
        revisionInterna2.headers[0];
    rowsRevisionIntern2.cells[0].value = 'INDICADOR DE PRESION DE AIRE/VACIO';
    revisionInterna2.columns[0].width = 110;
    rowsRevisionIntern2.height = 10;
    for (int i = 1; i <= 31; i++) {
      if (i == day) {
        rowsRevisionIntern2.cells[i].value = dataList[0]['0'] == 'Buen estado'
            ? '/'
            : dataList[0]['0'] == 'No aplica'
                ? 'n/a'
                : 'x';
      } else
        rowsRevisionIntern2.cells[i].value = '';

      rowsRevisionIntern2.cells[i].stringFormat =
          syncfusion_flutter_pdf.PdfStringFormat(
              alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);
    }

    rowsRevisionIntern2.cells[0].style.font =
        syncfusion_flutter_pdf.PdfStandardFont(
      syncfusion_flutter_pdf.PdfFontFamily.helvetica,
      4, // Desired font size
    );
    revisionInterna2.draw(
      page: page,
      bounds: const Rect.fromLTWH(0, 100, 0, 0),
    );

    syncfusion_flutter_pdf.PdfGrid revisionInterna3 =
        syncfusion_flutter_pdf.PdfGrid();
    revisionInterna3.columns.add(count: 32);
    revisionInterna3.headers.add(1);
    syncfusion_flutter_pdf.PdfGridRow rowsRevisionIntern3 =
        revisionInterna3.headers[0];
    rowsRevisionIntern3.cells[0].value =
        'DEPOSITO DE ADVERTENCIA DE POCO AIRE O VACIO';
    revisionInterna3.columns[0].width = 110;
    rowsRevisionIntern3.height = 10;
    for (int i = 1; i <= 31; i++) {
      if (i == day) {
        rowsRevisionIntern3.cells[i].value = dataList[0]['0'] == 'Buen estado'
            ? '/'
            : dataList[0]['0'] == 'No aplica'
                ? 'n/a'
                : 'x';
      } else
        rowsRevisionIntern3.cells[i].value = '';

      rowsRevisionIntern3.cells[i].stringFormat =
          syncfusion_flutter_pdf.PdfStringFormat(
              alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);
    }

    rowsRevisionIntern3.cells[0].style.font =
        syncfusion_flutter_pdf.PdfStandardFont(
      syncfusion_flutter_pdf.PdfFontFamily.helvetica,
      4, // Desired font size
    );
    revisionInterna3.draw(
      page: page,
      bounds: const Rect.fromLTWH(0, 110, 0, 0),
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
    rowsTableroInstrumentos.height = 100;

    rowsTableroInstrumentos.cells[0].value = '\n\n\n\nTABLERO DE INSTRUMENTOS';
    tableroInstrumentos.columns[0].width = 40;

    rowsTableroInstrumentos.cells[0].style.font =
        syncfusion_flutter_pdf.PdfStandardFont(
      syncfusion_flutter_pdf.PdfFontFamily.helvetica,
      4, // Desired font size
    );
    tableroInstrumentos.draw(
      page: page,
      bounds: const Rect.fromLTWH(0, 120, 0, 0),
    );

    syncfusion_flutter_pdf.PdfGrid revisionInterna4 =
        syncfusion_flutter_pdf.PdfGrid();
    revisionInterna4.columns.add(count: 32);
    revisionInterna4.headers.add(1);
    syncfusion_flutter_pdf.PdfGridRow rowsRevisionIntern4 =
        revisionInterna4.headers[0];
    rowsRevisionIntern4.cells[0].value = 'VELOCIMETRO';
    revisionInterna4.columns[0].width = 70;
    rowsRevisionIntern4.height = 10;
    for (int i = 1; i <= 31; i++) {
      if (i == day) {
        rowsRevisionIntern4.cells[i].value = dataList[0]['0'] == 'Buen estado'
            ? '/'
            : dataList[0]['0'] == 'No aplica'
                ? 'n/a'
                : 'x';
      } else
        rowsRevisionIntern4.cells[i].value = '';

      rowsRevisionIntern4.cells[i].stringFormat =
          syncfusion_flutter_pdf.PdfStringFormat(
              alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);
    }

    rowsRevisionIntern4.cells[0].style.font =
        syncfusion_flutter_pdf.PdfStandardFont(
      syncfusion_flutter_pdf.PdfFontFamily.helvetica,
      4, // Desired font size
    );
    revisionInterna4.draw(
      page: page,
      bounds: const Rect.fromLTWH(40, 120, 0, 0),
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
    rowslucesTablero.height = 60;

    rowslucesTablero.cells[0].value = '\n\n\n\nLUCES DEL TABLERO';
    lucesTablero.columns[0].width = 20;

    rowslucesTablero.cells[0].style.font =
        syncfusion_flutter_pdf.PdfStandardFont(
      syncfusion_flutter_pdf.PdfFontFamily.helvetica,
      4, // Desired font size
    );
    lucesTablero.draw(
      page: page,
      bounds: const Rect.fromLTWH(40, 130, 0, 0),
    );

    syncfusion_flutter_pdf.PdfGrid revisionInterna5 =
        syncfusion_flutter_pdf.PdfGrid();
    revisionInterna5.columns.add(count: 32);
    revisionInterna5.headers.add(1);
    syncfusion_flutter_pdf.PdfGridRow rowsRevisionInterna5 =
        revisionInterna5.headers[0];
    rowsRevisionInterna5.cells[0].value = 'DIRECCIONALES';
    revisionInterna5.columns[0].width = 50;
    rowsRevisionInterna5.height = 10;
    for (int i = 1; i <= 31; i++) {
      if (i == day) {
        rowsRevisionInterna5.cells[i].value = dataList[0]['0'] == 'Buen estado'
            ? '/'
            : dataList[0]['0'] == 'No aplica'
                ? 'n/a'
                : 'x';
      } else
        rowsRevisionInterna5.cells[i].value = '';

      rowsRevisionInterna5.cells[i].stringFormat =
          syncfusion_flutter_pdf.PdfStringFormat(
              alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);
    }

    rowsRevisionInterna5.cells[0].style.font =
        syncfusion_flutter_pdf.PdfStandardFont(
      syncfusion_flutter_pdf.PdfFontFamily.helvetica,
      4, // Desired font size
    );
    revisionInterna5.draw(
      page: page,
      bounds: const Rect.fromLTWH(60, 130, 0, 0),
    );

    syncfusion_flutter_pdf.PdfGrid revisionInterna6 =
        syncfusion_flutter_pdf.PdfGrid();
    revisionInterna6.columns.add(count: 32);
    revisionInterna6.headers.add(1);
    syncfusion_flutter_pdf.PdfGridRow rowsRevisionInterna6 =
        revisionInterna6.headers[0];
    rowsRevisionInterna6.cells[0].value = 'ESTACIONAMIENTO';
    revisionInterna6.columns[0].width = 50;
    rowsRevisionInterna6.height = 10;
    for (int i = 1; i <= 31; i++) {
      if (i == day) {
        rowsRevisionInterna6.cells[i].value = dataList[0]['0'] == 'Buen estado'
            ? '/'
            : dataList[0]['0'] == 'No aplica'
                ? 'n/a'
                : 'x';
      } else
        rowsRevisionInterna6.cells[i].value = '';

      rowsRevisionInterna6.cells[i].stringFormat =
          syncfusion_flutter_pdf.PdfStringFormat(
              alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);
    }

    rowsRevisionInterna6.cells[0].style.font =
        syncfusion_flutter_pdf.PdfStandardFont(
      syncfusion_flutter_pdf.PdfFontFamily.helvetica,
      4, // Desired font size
    );
    revisionInterna6.draw(
      page: page,
      bounds: const Rect.fromLTWH(60, 140, 0, 0),
    );

    syncfusion_flutter_pdf.PdfGrid revisionInterna7 =
        syncfusion_flutter_pdf.PdfGrid();
    revisionInterna7.columns.add(count: 32);
    revisionInterna7.headers.add(1);
    syncfusion_flutter_pdf.PdfGridRow rowsRevisionInterna7 =
        revisionInterna7.headers[0];
    rowsRevisionInterna7.cells[0].value = 'GALIBO (ALTURA)';
    revisionInterna7.columns[0].width = 50;
    rowsRevisionInterna7.height = 10;
    for (int i = 1; i <= 31; i++) {
      if (i == day) {
        rowsRevisionInterna7.cells[i].value = dataList[0]['0'] == 'Buen estado'
            ? '/'
            : dataList[0]['0'] == 'No aplica'
                ? 'n/a'
                : 'x';
      } else
        rowsRevisionInterna7.cells[i].value = '';

      rowsRevisionInterna7.cells[i].stringFormat =
          syncfusion_flutter_pdf.PdfStringFormat(
              alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);
    }

    rowsRevisionInterna7.cells[0].style.font =
        syncfusion_flutter_pdf.PdfStandardFont(
      syncfusion_flutter_pdf.PdfFontFamily.helvetica,
      4, // Desired font size
    );
    revisionInterna7.draw(
      page: page,
      bounds: const Rect.fromLTWH(60, 150, 0, 0),
    );

    syncfusion_flutter_pdf.PdfGrid revisionInterna8 =
        syncfusion_flutter_pdf.PdfGrid();
    revisionInterna8.columns.add(count: 32);
    revisionInterna8.headers.add(1);
    syncfusion_flutter_pdf.PdfGridRow rowsRevisionInterna8 =
        revisionInterna8.headers[0];
    rowsRevisionInterna8.cells[0].value = 'INTERIOR';
    revisionInterna8.columns[0].width = 50;
    rowsRevisionInterna8.height = 10;
    for (int i = 1; i <= 31; i++) {
      if (i == day) {
        rowsRevisionInterna8.cells[i].value = dataList[0]['0'] == 'Buen estado'
            ? '/'
            : dataList[0]['0'] == 'No aplica'
                ? 'n/a'
                : 'x';
      } else
        rowsRevisionInterna8.cells[i].value = '';

      rowsRevisionInterna8.cells[i].stringFormat =
          syncfusion_flutter_pdf.PdfStringFormat(
              alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);
    }

    rowsRevisionInterna8.cells[0].style.font =
        syncfusion_flutter_pdf.PdfStandardFont(
      syncfusion_flutter_pdf.PdfFontFamily.helvetica,
      4, // Desired font size
    );
    revisionInterna8.draw(
      page: page,
      bounds: const Rect.fromLTWH(60, 160, 0, 0),
    );

    syncfusion_flutter_pdf.PdfGrid revisionInterna9 =
        syncfusion_flutter_pdf.PdfGrid();
    revisionInterna9.columns.add(count: 32);
    revisionInterna9.headers.add(1);
    syncfusion_flutter_pdf.PdfGridRow rowsRevisionInterna9 =
        revisionInterna9.headers[0];
    rowsRevisionInterna9.cells[0].value = 'ADVERTENCIA';
    revisionInterna9.columns[0].width = 50;
    rowsRevisionInterna9.height = 10;
    for (int i = 1; i <= 31; i++) {
      if (i == day) {
        rowsRevisionInterna9.cells[i].value = dataList[0]['0'] == 'Buen estado'
            ? '/'
            : dataList[0]['0'] == 'No aplica'
                ? 'n/a'
                : 'x';
      } else
        rowsRevisionInterna9.cells[i].value = '';

      rowsRevisionInterna9.cells[i].stringFormat =
          syncfusion_flutter_pdf.PdfStringFormat(
              alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);
    }

    rowsRevisionInterna9.cells[0].style.font =
        syncfusion_flutter_pdf.PdfStandardFont(
      syncfusion_flutter_pdf.PdfFontFamily.helvetica,
      4, // Desired font size
    );
    revisionInterna9.draw(
      page: page,
      bounds: const Rect.fromLTWH(60, 170, 0, 0),
    );

    syncfusion_flutter_pdf.PdfGrid revisionInterna10 =
        syncfusion_flutter_pdf.PdfGrid();
    revisionInterna10.columns.add(count: 32);
    revisionInterna10.headers.add(1);
    syncfusion_flutter_pdf.PdfGridRow rowsRevisionInterna10 =
        revisionInterna10.headers[0];
    rowsRevisionInterna10.cells[0].value = 'DEMARCADORAS';
    revisionInterna10.columns[0].width = 50;
    rowsRevisionInterna10.height = 10;
    for (int i = 1; i <= 31; i++) {
      if (i == day) {
        rowsRevisionInterna10.cells[i].value = dataList[0]['0'] == 'Buen estado'
            ? '/'
            : dataList[0]['0'] == 'No aplica'
                ? 'n/a'
                : 'x';
      } else
        rowsRevisionInterna10.cells[i].value = '';

      rowsRevisionInterna10.cells[i].stringFormat =
          syncfusion_flutter_pdf.PdfStringFormat(
              alignment: syncfusion_flutter_pdf.PdfTextAlignment.center);
    }

    rowsRevisionInterna10.cells[0].style.font =
        syncfusion_flutter_pdf.PdfStandardFont(
      syncfusion_flutter_pdf.PdfFontFamily.helvetica,
      4, // Desired font size
    );
    revisionInterna10.draw(
      page: page,
      bounds: const Rect.fromLTWH(60, 180, 0, 0),
    );

    List<int> bytes = await document.save();
    document.dispose();
    saveAndLaunchFile(bytes, 'inspeccion.pdf');
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
}
