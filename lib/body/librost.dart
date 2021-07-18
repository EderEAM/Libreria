class Client{
  int id;
  String NombreLibro;
  String autor;
 String cate;
  String fecha;
  String estado;
  Client ({this.id, this.NombreLibro, this.autor,this.cate,this.fecha,this.estado});


  Map<String, dynamic> toMap() => {
    "id": id,
    "name": NombreLibro,
    "auto": autor,
   "catego": cate,
    "fecha": fecha,
    "estado": estado,
  };


  factory Client.fromMap(Map<String, dynamic> json) => new Client(
    id: json["id"],
    NombreLibro: json["name"],
    autor: json["auto"],
    cate: json["catego"],
    fecha: json["fecha"],
    estado: json["estado"],
    );
}