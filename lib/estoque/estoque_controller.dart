import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../models/livros_model.dart';

class EstoqueController {
  Dio dio = new Dio();
  LivroModel livroModel = LivroModel();

  Future<List<LivroModel>> listarLivros() async {
    List<LivroModel> livros = List.empty(growable: true);
    try {
      dynamic response = await dio.get(
          'http://localhost:8080/api/universoliterario/funcionario/livrosApi',
          options: Options(contentType: 'application/json; charset=UTF-8'));
      if (response.statusCode == 200) {
        for (Map<String, dynamic> item in response.data) {
          
          LivroModel p = LivroModel();
          p.setTitulo(titulo: item.values.elementAt(1));
          p.setQuantidade(quantidade: item.values.elementAt(3));
          p.setStatusLivro(statusLivro: item.values.elementAt(7));

          if (item.values.elementAt(6) != null)
            p.setImagem(base64.decode(item.values.elementAt(6)));
          else
            p.setImagem(base64.decode(
                'https://www.arquivomedico.com.br/arquivomedicov3/assets/images/sem_imagem.png'));
          print(item.values.elementAt(1));
          print(item.values.elementAt(3));
          print(item.values.elementAt(6));
          print(item.values.elementAt(7));
          livros.add(p);
        }
      }
    } catch (e) {
      print(e);
    }
    return livros;
  }
}