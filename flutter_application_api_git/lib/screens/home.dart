import 'package:flutter/material.dart';
import 'package:flutter_application_api_git/components/list_repository.dart';
import 'package:flutter_application_api_git/components/repository_form.dart';
import 'package:flutter_application_api_git/models/repository.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _repositories = <Repository>[]; // Lista de objetos Repository
  var _loading = false;

  //funçao de busca com await fazendo uma req get
  Future<void> searchRepository(String repo) async {
    var response = await http.get(Uri.parse(
        "https://api.github.com/search/repositories?q=$repo&page=0&per_page=10"));

    //convertendo uma string Json em repository
    var data = jsonDecode(response.body);

    setState(() {
      _loading = false;
      //transformando em lista
      //usando o map para iteirar e retornar um item
      _repositories =
          (data['items'] as List).map((e) => Repository.fromJson(e)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Center(child: Text('API GIT')),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            //chamando o search repository fução da class repository_form
            FormRepository(onSearch: searchRepository, loading: _loading),
            Expanded(
              child: _repositories.isNotEmpty
                  //chamando o método ListRepository e passando
                  ? ListRepository(repositoriesList: _repositories)
                  : const SizedBox(), // Tratamento quando a lista está vazia
            ),
          ],
        ),
      ),
    );
  }
}
