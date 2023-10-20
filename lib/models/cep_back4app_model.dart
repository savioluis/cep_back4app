// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CepBack4appModel {
  String? id;
  String? cep;
  String? cidade;
  String? estado;
  String? rua;
  String? bairro;

  CepBack4appModel({
    this.id,
    this.cep,
    this.cidade,
    this.estado,
    this.rua,
    this.bairro,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'cep': cep,
      'cidade': cidade,
      'estado': estado,
      'rua': rua,
      'bairro': bairro,
    };
  }

  factory CepBack4appModel.fromMap(Map<String, dynamic> map) {
    return CepBack4appModel(
      id: map['objectId'] != null ? map['objectId'] as String : null,
      cep: map['cep'] != null ? map['cep'] as String : null,
      cidade: map['cidade'] != null ? map['cidade'] as String : null,
      estado: map['estado'] != null ? map['estado'] as String : null,
      rua: map['rua'] != null ? map['rua'] as String : null,
      bairro: map['bairro'] != null ? map['bairro'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CepBack4appModel.fromJson(String source) =>
      CepBack4appModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CepBack4appModel(id: $id, cep: $cep, cidade: $cidade, estado: $estado, rua: $rua, bairro: $bairro)';
  }
}
