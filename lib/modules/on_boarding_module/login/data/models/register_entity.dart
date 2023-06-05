// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RegisterEntity {
  final int idRegistro;
  final int idColaborador;
  final String descricao;
  final String matricula;
  final String dataAdmissao;
  final String dataTermino;
  final String dataInicio;
  final String tipoColaborador;
  final String cargo;
  final String setor;
  final int idEmpregador;
  final String empregador;
  final String apelidoEmpregador;
  final String ufEmpregador;
  final String cidadeEmpregador;

  RegisterEntity({
    required this.idRegistro,
    required this.idColaborador,
    required this.descricao,
    required this.matricula,
    required this.dataAdmissao,
    required this.dataTermino,
    required this.dataInicio,
    required this.tipoColaborador,
    required this.cargo,
    required this.setor,
    required this.idEmpregador,
    required this.empregador,
    required this.apelidoEmpregador,
    required this.ufEmpregador,
    required this.cidadeEmpregador,
  });

  RegisterEntity copyWith({
    int? idRegistro,
    int? idColaborador,
    String? descricao,
    String? matricula,
    String? dataAdmissao,
    String? dataTermino,
    String? dataInicio,
    String? tipoColaborador,
    String? cargo,
    String? setor,
    int? idEmpregador,
    String? empregador,
    String? apelidoEmpregador,
    String? ufEmpregador,
    String? cidadeEmpregador,
  }) {
    return RegisterEntity(
      idRegistro: idRegistro ?? this.idRegistro,
      idColaborador: idColaborador ?? this.idColaborador,
      descricao: descricao ?? this.descricao,
      matricula: matricula ?? this.matricula,
      dataAdmissao: dataAdmissao ?? this.dataAdmissao,
      dataTermino: dataTermino ?? this.dataTermino,
      dataInicio: dataInicio ?? this.dataInicio,
      tipoColaborador: tipoColaborador ?? this.tipoColaborador,
      cargo: cargo ?? this.cargo,
      setor: setor ?? this.setor,
      idEmpregador: idEmpregador ?? this.idEmpregador,
      empregador: empregador ?? this.empregador,
      apelidoEmpregador: apelidoEmpregador ?? this.apelidoEmpregador,
      ufEmpregador: ufEmpregador ?? this.ufEmpregador,
      cidadeEmpregador: cidadeEmpregador ?? this.cidadeEmpregador,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idRegistro': idRegistro,
      'idColaborador': idColaborador,
      'descricao': descricao,
      'matricula': matricula,
      'dataAdmissao': dataAdmissao,
      'dataTermino': dataTermino,
      'dataInicio': dataInicio,
      'tipoColaborador': tipoColaborador,
      'cargo': cargo,
      'setor': setor,
      'idEmpregador': idEmpregador,
      'empregador': empregador,
      'apelidoEmpregador': apelidoEmpregador,
      'ufEmpregador': ufEmpregador,
      'cidadeEmpregador': cidadeEmpregador,
    };
  }

  factory RegisterEntity.fromMap(dynamic map) {
    return RegisterEntity(
      idRegistro: map['idRegistro'] as int,
      idColaborador: map['idColaborador'] as int,
      descricao: map['descricao'] as String,
      matricula: map['matricula'] as String,
      dataAdmissao: map['dataAdmissao'] as String,
      dataTermino: map['dataTermino'] as String,
      dataInicio: map['dataInicio'] as String,
      tipoColaborador: map['tipoColaborador'] as String,
      cargo: map['cargo'] as String,
      setor: map['setor'] as String,
      idEmpregador: map['idEmpregador'] as int,
      empregador: map['empregador'] as String,
      apelidoEmpregador: map['apelidoEmpregador'] as String,
      ufEmpregador: map['ufEmpregador'] as String,
      cidadeEmpregador: map['cidadeEmpregador'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterEntity.fromJson(String source) =>
      RegisterEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RegistroEntity(idRegistro: $idRegistro, idColaborador: $idColaborador, descricao: $descricao, matricula: $matricula, dataAdmissao: $dataAdmissao, dataTermino: $dataTermino, dataInicio: $dataInicio, tipoColaborador: $tipoColaborador, cargo: $cargo, setor: $setor, idEmpregador: $idEmpregador, empregador: $empregador, apelidoEmpregador: $apelidoEmpregador, ufEmpregador: $ufEmpregador, cidadeEmpregador: $cidadeEmpregador)';
  }

  @override
  bool operator ==(covariant RegisterEntity other) {
    if (identical(this, other)) return true;

    return other.idRegistro == idRegistro &&
        other.idColaborador == idColaborador &&
        other.descricao == descricao &&
        other.matricula == matricula &&
        other.dataAdmissao == dataAdmissao &&
        other.dataTermino == dataTermino &&
        other.dataInicio == dataInicio &&
        other.tipoColaborador == tipoColaborador &&
        other.cargo == cargo &&
        other.setor == setor &&
        other.idEmpregador == idEmpregador &&
        other.empregador == empregador &&
        other.apelidoEmpregador == apelidoEmpregador &&
        other.ufEmpregador == ufEmpregador &&
        other.cidadeEmpregador == cidadeEmpregador;
  }

  @override
  int get hashCode {
    return idRegistro.hashCode ^
        idColaborador.hashCode ^
        descricao.hashCode ^
        matricula.hashCode ^
        dataAdmissao.hashCode ^
        dataTermino.hashCode ^
        dataInicio.hashCode ^
        tipoColaborador.hashCode ^
        cargo.hashCode ^
        setor.hashCode ^
        idEmpregador.hashCode ^
        empregador.hashCode ^
        apelidoEmpregador.hashCode ^
        ufEmpregador.hashCode ^
        cidadeEmpregador.hashCode;
  }
}
