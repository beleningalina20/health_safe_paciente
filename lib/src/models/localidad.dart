class Localidad {
  int codigoPostal;
  String descripcion;
  DateTime? createdAt;
  DateTime? updatedAt;

  Localidad({
    required this.codigoPostal,
    required this.descripcion,
    this.createdAt,
    this.updatedAt,
  });

  factory Localidad.fromJson(Map<String, dynamic> json) => Localidad(
        codigoPostal: json["codpostal"],
        descripcion: json["descripcion"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  @override
  String toString() => descripcion;
}
