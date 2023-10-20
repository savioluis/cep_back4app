// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CepBack4appModel {
  String? id;
  String? criadoEm;
  String? cep;
  String? cidade;
  String? estado;
  String? rua;
  String? bairro;

  CepBack4appModel({
    this.id,
    this.criadoEm,
    this.cep,
    this.cidade,
    this.estado,
    this.rua,
    this.bairro,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'criadoEm': criadoEm,
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
      criadoEm: map['createdAt'] != null ? map['createdAt'] as String : null,
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
    return 'CepBack4appModel(id: $id, criadoEm: $criadoEm, cep: $cep, cidade: $cidade, estado: $estado, rua: $rua, bairro: $bairro)';
  }

  CepBack4appModel copyWith({
    String? id,
    String? criadoEm,
    String? cep,
    String? cidade,
    String? estado,
    String? rua,
    String? bairro,
  }) {
    return CepBack4appModel(
      id: id ?? this.id,
      criadoEm: criadoEm ?? this.criadoEm,
      cep: cep ?? this.cep,
      cidade: cidade ?? this.cidade,
      estado: estado ?? this.estado,
      rua: rua ?? this.rua,
      bairro: bairro ?? this.bairro,
    );
  }

  @override
  bool operator ==(covariant CepBack4appModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.criadoEm == criadoEm &&
        other.cep == cep &&
        other.cidade == cidade &&
        other.estado == estado &&
        other.rua == rua &&
        other.bairro == bairro;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        criadoEm.hashCode ^
        cep.hashCode ^
        cidade.hashCode ^
        estado.hashCode ^
        rua.hashCode ^
        bairro.hashCode;
  }
}
