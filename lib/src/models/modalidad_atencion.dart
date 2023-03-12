class ModalidadAtencion {
  int idModalidadAtencion;
  String descripcion;
  DateTime? createdAt;
  DateTime? updatedAt;

  ModalidadAtencion({
    required this.idModalidadAtencion,
    required this.descripcion,
    this.createdAt,
    this.updatedAt,
  });

  factory ModalidadAtencion.fromJson(Map<String, dynamic> json) =>
      ModalidadAtencion(
        idModalidadAtencion: json["idmodalidad"],
        descripcion: json["descripcion"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  @override
  String toString() => descripcion;
}
