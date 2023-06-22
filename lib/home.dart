import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'client.dart' as Cliente;

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: Cliente.Client.fetchAll(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.waiting) {
          Response response = snapshot.data;
          final data = jsonDecode(response.body);
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(data[index]['title']),
              );
            },
          );
        } else {
          return const Text("Carregando");
        }
      },
    );
  }
}
