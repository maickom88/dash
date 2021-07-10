import 'dart:convert';

class CompanyModel {
  final String name;
  final String cnpj;
  final String pep;
  final String ordinary;
  final String totalAut;
  final String totalDec;
  final int county;
  final int industry;
  final int myId;
  CompanyModel({
    required this.name,
    required this.cnpj,
    required this.pep,
    required this.ordinary,
    required this.totalAut,
    required this.totalDec,
    required this.county,
    required this.industry,
    required this.myId,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'cnpj': cnpj,
      'pep': pep,
      'ordinary': ordinary,
      'total_aut': totalAut,
      'total_dec': totalDec,
      'county': county,
      'industry': industry,
      'my_id': myId,
    };
  }

  factory CompanyModel.fromMap(Map<String, dynamic> map) {
    return CompanyModel(
      name: map['name'],
      cnpj: map['cnpj'],
      pep: map['pep'],
      ordinary: map['ordinary'],
      totalAut: map['total_aut'],
      totalDec: map['total_dec'],
      county: map['county'],
      industry: map['industry'],
      myId: map['my_id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CompanyModel.fromJson(String source) =>
      CompanyModel.fromMap(json.decode(source));
}
