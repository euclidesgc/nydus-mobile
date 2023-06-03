// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RegistroEntity {
  final int idRegistro;
  final int idColaborador;
  final int idEmpregador;
  final String descricao;

  RegistroEntity({
    required this.idRegistro,
    required this.idColaborador,
    required this.idEmpregador,
    required this.descricao,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idRegistro': idRegistro,
      'idColaborador': idColaborador,
      'idEmpregador': idEmpregador,
      'descricao': descricao,
    };
  }

  factory RegistroEntity.fromMap(Map<String, dynamic> map) {
    return RegistroEntity(
      idRegistro: map['idRegistro'] as int,
      idColaborador: map['idColaborador'] as int,
      idEmpregador: map['idEmpregador'] as int,
      descricao: map['descricao'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegistroEntity.fromJson(String source) =>
      RegistroEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  RegistroEntity copyWith({
    int? idRegistro,
    int? idColaborador,
    int? idEmpregador,
    String? descricao,
  }) {
    return RegistroEntity(
      idRegistro: idRegistro ?? this.idRegistro,
      idColaborador: idColaborador ?? this.idColaborador,
      idEmpregador: idEmpregador ?? this.idEmpregador,
      descricao: descricao ?? this.descricao,
    );
  }

  @override
  String toString() {
    return 'RegistroEntity(idRegistro: $idRegistro, idColaborador: $idColaborador, idEmpregador: $idEmpregador, descricao: $descricao)';
  }

  @override
  bool operator ==(covariant RegistroEntity other) {
    if (identical(this, other)) return true;

    return other.idRegistro == idRegistro &&
        other.idColaborador == idColaborador &&
        other.idEmpregador == idEmpregador &&
        other.descricao == descricao;
  }

  @override
  int get hashCode {
    return idRegistro.hashCode ^
        idColaborador.hashCode ^
        idEmpregador.hashCode ^
        descricao.hashCode;
  }
}
