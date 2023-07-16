import 'package:flutter/material.dart';
import 'package:flutter_application_api_git/components/button.dart';
import 'package:flutter_application_api_git/models/repository.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

  //funcao de pesquisa e n tem retorno
}

class _HomePageState extends State<HomePage> {
  var text = "hello git!";
  var _repositories = <Repository>[]; // Lista de objetos Repository

  //funçao de busca com await fazendo uma req get
  Future<void> searchRepository() async {
    var response = await http.get(Uri.parse(
        "https://api.github.com/search/repositories?q=flutter&page=0&per_page=10"));

    var data = jsonDecode(response.body);

    setState(() {
      //transformando em lista
      //usando o map para iteirar e retornar um item
      _repositories =
          (data['items'] as List).map((e) => Repository.fromJson(e)).toList();
      _repositories.forEach((element) {
        print(element.name);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Start'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              text,
              style: const TextStyle(
                fontSize: 24.0,
              ),
            ),
            Button(
              onPressed: searchRepository,
              text: 'clica aqui',
            ),
          ],
        ),
      ),
    );
  }
}
