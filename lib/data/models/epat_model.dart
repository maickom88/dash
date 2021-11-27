import 'dart:convert';

class EpatModel {
  final String aiim;
  final String drt;
  final String autuado;
  final String assunto;
  final String data;
  EpatModel({
    required this.aiim,
    required this.drt,
    required this.autuado,
    required this.assunto,
    required this.data,
  });

  Map<String, dynamic> toMap() {
    return {
      'aiim': aiim,
      'drt': drt,
      'autuado': autuado,
      'assunto': assunto,
      'data': data,
    };
  }

  factory EpatModel.fromMap(Map<String, dynamic> map) {
    return EpatModel(
      aiim: map['aiim'],
      drt: map['drt'],
      autuado: map['autuado'],
      assunto: map['assunto'] ?? '-',
      data: map['data'],
    );
  }

  String toJson() => json.encode(toMap());

  factory EpatModel.fromJson(String source) =>
      EpatModel.fromMap(json.decode(source));
}
