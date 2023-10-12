import 'dart:convert';
import 'dart:typed_data';

class LivroModel {
  late final int id;
  late final String titulo;
  late final Uint8List? imagem;
  late final String statusLivro;
  late final int quantidade;

  LivroModel({id, titulo, imagem, statusLivro, quantidade});

  int get getId {
    return id;
  }

  String get getTitulo {
    return titulo;
  }

  Uint8List get getImagem {
    return imagem!;
  }

  String get getStatusLivro {
    return statusLivro;
  }

  int get getQuantidade {
    return quantidade;
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "titulo": titulo,
        "imagem": imagem,
        "statusLivro": statusLivro,
        "quantidade": quantidade
      };

  String toJson() => jsonEncode(toMap());

  factory LivroModel.fromMap(Map<String, dynamic> map) {
    return LivroModel(
        id: map['id'],
        titulo: map['titulo'],
        imagem: map['imagem'],
        statusLivro: map['statusLivro'],
        quantidade: map['quantidade']);
  }

  factory LivroModel.fromJson(String json) =>
      LivroModel.fromMap(jsonDecode(json));

  void setId(elementAt) {
    this.id = elementAt;
  }

  void setTitulo({required titulo}) {
    this.titulo = titulo;
  }

  void setImagem(Uint8List decode) {
    this.imagem = decode;
  }

  void setStatusLivro({required statusLivro}) {
    this.statusLivro = statusLivro;
  }

  void setQuantidade({required quantidade}) {
    this.quantidade = quantidade;
  }
}