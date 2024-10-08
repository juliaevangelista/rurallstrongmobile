import 'dart:async';

import 'package:firebase_database/firebase_database.dart';

Future<List<String>> fazenda() async {
  DatabaseReference fazendaRef = FirebaseDatabase.instance.ref().child('Fazendas');

  try {
    // Crie um StreamController para lidar com os eventos em tempo real
    StreamController<List<String>> controller = StreamController();

    fazendaRef.onValue.listen((event) {
      // Verifique se o evento possui dados
      if (event.snapshot.value != null) {
        Map<dynamic, dynamic>? dados = event.snapshot.value as Map<dynamic, dynamic>?;

        List<String> nomes = [];

        // Processar os dados
        if (dados != null) {
          dados.forEach((key, value) {
            // Extrair o nome da fazenda de cada nó e adicioná-lo à lista de nomes
            nomes.add(value['nomeFazenda']);
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
    print('Erro ao obter dados de fazenda do Firebase: $error');
    throw error;
  }
}

Future<String?> getIdFazendaPorNome(String nomeFazenda) async {
  DatabaseReference fazendaRef = FirebaseDatabase.instance.ref().child('Fazendas');

  try {
    DatabaseEvent snapshot = await fazendaRef.orderByChild('nomeFazenda').equalTo(nomeFazenda).once();

    if (snapshot.snapshot.value != null) {
      Map<dynamic, dynamic>? dados = snapshot.snapshot.value as Map<dynamic, dynamic>?;

      if (dados != null) {
        // Retorna o ID da primeira fazenda encontrada com o nome correspondente
        return dados.keys.first as String?;
      }
    }

    return null;
  } catch (error) {
    print('Erro ao obter ID da fazenda por nome do Firebase: $error');
    throw error;
  }
}

