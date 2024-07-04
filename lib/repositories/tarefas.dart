import 'dart:async';
import 'package:firebase_database/firebase_database.dart';

Future<List<Map<String, dynamic>>> obterTarefas() async {
  DatabaseReference tarefasRef =
      FirebaseDatabase.instance.ref().child('Tarefas');

  try {
    // Lista para armazenar as tarefas
    List<Map<String, dynamic>> tarefas = [];

    DatabaseEvent event = await tarefasRef.once();

    if (event.snapshot.value != null) {
      Map<dynamic, dynamic>? dados =
          event.snapshot.value as Map<dynamic, dynamic>?;

      // Processar os dados das tarefas
      if (dados != null) {
        dados.forEach((key, value) {
          Map<String, dynamic> tarefa = {
            'id': key,
            'titulo': value['titulo'],
            'data': value['data'],
            'urgente': value['urgente'],
            'descricao': value['descricao'],
            'talhao': value['talhao'],
            'producao': value['producao'],
            'periodo': value['periodo'],
          };

          // Adicionar a tarefa à lista de tarefas
          tarefas.add(tarefa);
        });
      }
    }

    return tarefas;
  } catch (error) {
    print('Erro ao obter dados de tarefas do Firebase: $error');
    throw error;
  }
}
