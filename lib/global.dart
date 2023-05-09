library my_prj.globals;
import 'package:intl/intl.dart';

bool isLoggedIn = false;
late String unidad;
late String operador;
late String no_viaje;
late String ruta;
late String respuestas;
DateTime now = DateTime.now();
DateTime date = DateTime(now.year, now.month, now.day);
final formatter = DateFormat('yyy-MM-dd');
String dateString = formatter.format(date);

late int revisionInterna;
bool isDoneCheckList = false;
List<int> selectedIndex = List<int>.filled(96, 0);
