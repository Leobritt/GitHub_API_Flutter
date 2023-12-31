import 'package:flutter/material.dart';
import 'package:flutter_application_api_git/models/repository.dart';
import 'package:url_launcher/url_launcher.dart';

class ListRepository extends StatelessWidget {
  const ListRepository({super.key, required this.repositoriesList});

  final List<Repository> repositoriesList;

  @override
  Widget build(BuildContext context) {
    //é um widget que constrói e renderiza dinamicamente os itens da lista sob demanda
    return ListView.builder(
      itemBuilder: (context, index) {
        return Card(
          elevation: 5.0,
          child: Padding(
            padding: const EdgeInsets.all(7.0),
            child: Column(
              children: [
                ListTile(
                  title: Text(repositoriesList[index].name),
                  subtitle: Text(repositoriesList[index].description),
                ),
                ButtonBar(
                  children: <Widget>[
                    TextButton(
                      onPressed: () async {
                        var url = repositoriesList[index].url;
                        //usano url launcher para abrir uma url

                        // ignore: deprecated_member_use
                        if (await canLaunch(url)) {
                          // ignore: deprecated_member_use
                          await launch(url);
                        }
                      },
                      child: const Text('Open repository'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
      itemCount: repositoriesList.length,
    );
  }
}
