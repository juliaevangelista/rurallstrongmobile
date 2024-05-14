import 'dart:async';

import 'package:firebase_database/firebase_database.dart';

Future<List<String>> cultivo() async {
  DatabaseReference cultivoRef = FirebaseDatabase.instance.ref().child('Cultivar');

  try {
    // Crie um StreamController para lidar com os eventos em tempo real
    StreamController<List<String>> controller = StreamController();

    cultivoRef.onValue.listen((event) {
      // Verifique se o evento possui dados
      if (event.snapshot.value != null) {
        Map<dynamic, dynamic>? dados = event.snapshot.value as Map<dynamic, dynamic>?;

        List<String> nomes = [];

        // Processar os dados
        if (dados != null) {
          dados.forEach((key, value) {
            nomes.add(value['nome']);
          });

          // Adicionar os nomes ao StreamController
          controller.add(nomes);
        }
      } else {
        // Se não houver dados, adicione uma lista vazia ao StreamController
        controller.add([]);
      }
    });

    // Retorne o StreamController.stream como um Future
    return controller.stream.first;
  } catch (error) {
    print('Erro ao obter dados de cultivo do Firebase: $error');
    throw error;
  }
}
