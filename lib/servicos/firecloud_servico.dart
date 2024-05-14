import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseService {
  final DatabaseReference _database = FirebaseDatabase.instance.reference();

  Future<void> atualizarDados() async {
    try {
      // Atualize os 5 nós específicos aqui
      await _atualizarNo('nó1', 'Novo valor para nó1');
      await _atualizarNo('nó2', 'Novo valor para nó2');
      await _atualizarNo('nó3', 'Novo valor para nó3');
      await _atualizarNo('nó4', 'Novo valor para nó4');
      await _atualizarNo('nó5', 'Novo valor para nó5');
    } catch (error) {
      print('Erro ao atualizar dados: $error');
    }
  }

  Future<void> _atualizarNo(String nomeNo, String novoValor) async {
    await _database.child(nomeNo).set(novoValor);
  }
}

class DadosTela extends StatelessWidget {
  final FirebaseService firebaseService = FirebaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Restante do seu código...
          ElevatedButton(
            onPressed: () async {
              await firebaseService.atualizarDados();
            },
            child: Text('ATUALIZAR'),
          ),
          // Restante do seu código...
        ],
      ),
    );
  }
}
