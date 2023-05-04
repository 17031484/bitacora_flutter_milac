class generalChecklistData {
  late int id;
  late DateTime fecha;
  late int noViaje;
  late int idOperador;
  late String respuestas;

  generalChecklistData(
      {required this.id,
      required this.fecha,
      required this.noViaje,
      required this.idOperador,
      required this.respuestas});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fecha': fecha,
      'noViaje': noViaje,
      'idOperador': idOperador,
      'respuestas': respuestas
    };
  }
}
