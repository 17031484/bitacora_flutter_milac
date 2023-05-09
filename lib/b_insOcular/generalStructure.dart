class generalChecklistData {
  late int id;
  late DateTime fecha;
  late int noViaje;
  late String unidad;
  late int idOperador;
  late String respuestas;

  generalChecklistData(
      {required this.id,required this.fecha,
      required this.noViaje,
      required this.unidad,
      required this.idOperador,
      required this.respuestas});

  Map<String, dynamic> toMap() {
    return {
      'fecha': fecha,
      'noViaje': noViaje,
      'unidad': unidad,
      'idOperador': idOperador,
      'respuestas': respuestas
    };
  }
}
