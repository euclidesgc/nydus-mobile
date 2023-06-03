// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'registro_entity.dart';

class PerfilEntity {
  final String name;
  final int idPessoa;
  final String foto;
  final List<RegistroEntity> registros;

  PerfilEntity({
    required this.name,
    required this.idPessoa,
    required this.foto,
    required this.registros,
  });

  PerfilEntity.empty({
    this.name = '',
    this.idPessoa = 0,
    this.foto = '',
    this.registros = const <RegistroEntity>[],
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'idPessoa': idPessoa,
      'foto': foto,
      'registros': registros.map((x) => x.toMap()).toList(),
    };
  }

  factory PerfilEntity.fromMap(Map<String, dynamic> map) {
    return PerfilEntity(
      name: map['name'] as String,
      idPessoa: map['idPessoa'] as int,
      foto: map['foto'] as String,
      registros: List<RegistroEntity>.from(
        (map['registros'] as List<int>).map<RegistroEntity>(
          (x) => RegistroEntity.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory PerfilEntity.fromJson(String source) =>
      PerfilEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  PerfilEntity copyWith({
    String? name,
    int? idPessoa,
    String? foto,
    List<RegistroEntity>? registros,
  }) {
    return PerfilEntity(
      name: name ?? this.name,
      idPessoa: idPessoa ?? this.idPessoa,
      foto: foto ?? this.foto,
      registros: registros ?? this.registros,
    );
  }

  @override
  String toString() {
    return 'PerfilEntity(name: $name, idPessoa: $idPessoa, foto: $foto, registros: $registros)';
  }

  @override
  bool operator ==(covariant PerfilEntity other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.idPessoa == idPessoa &&
        other.foto == foto &&
        listEquals(other.registros, registros);
  }

  @override
  int get hashCode {
    return name.hashCode ^
        idPessoa.hashCode ^
        foto.hashCode ^
        registros.hashCode;
  }
}
