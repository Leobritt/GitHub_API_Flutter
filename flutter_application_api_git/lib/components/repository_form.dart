import 'package:flutter/material.dart';

import 'button.dart';

class FormRepository extends StatefulWidget {
  const FormRepository(
      {super.key, required this.onSearch, required bool loading});

  //
  final Function onSearch;

  @override
  State<FormRepository> createState() => _FormRepositoryState();
}

class _FormRepositoryState extends State<FormRepository> {
  final _formKey = GlobalKey<FormState>();
  var _search = "";
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            autofocus: true,
            /* onChanged define uma função de retorno de chamada que é executada sempre 
            que o valor do widget de entrada é alterado pelo usuário.*/
            onChanged: (value) => setState(() {
              _search = value;
            }),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Button(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                //acessando a ver do widget
                widget.onSearch(_search);
              }
            },
            text: 'Search',
          ),
        ],
      ),
    );
  }
}
