// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'register_entity.dart';

class ProfileEntity {
  final String nome;
  final int idPessoa;
  final List<RegisterEntity> registros;

  ProfileEntity({
    required this.nome,
    required this.idPessoa,
    required this.registros,
  });

  ProfileEntity copyWith({
    String? nome,
    int? idPessoa,
    List<RegisterEntity>? registros,
  }) {
    return ProfileEntity(
      nome: nome ?? this.nome,
      idPessoa: idPessoa ?? this.idPessoa,
      registros: registros ?? this.registros,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nome': nome,
      'idPessoa': idPessoa,
      'registros': registros.map((x) => x.toMap()).toList(),
    };
  }

  factory ProfileEntity.fromMap(Map<String, dynamic> map) {
    return ProfileEntity(
      nome: map['nome'] as String,
      idPessoa: map['idPessoa'] as int,
      registros: List<RegisterEntity>.from(
        (map['registros'] as List<int>).map<RegisterEntity>(
          (x) => RegisterEntity.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileEntity.fromJson(String source) =>
      ProfileEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'PerfilEntity(nome: $nome, idPessoa: $idPessoa, registros: $registros)';

  @override
  bool operator ==(covariant ProfileEntity other) {
    if (identical(this, other)) return true;

    return other.nome == nome &&
        other.idPessoa == idPessoa &&
        listEquals(other.registros, registros);
  }

  @override
  int get hashCode => nome.hashCode ^ idPessoa.hashCode ^ registros.hashCode;
}
