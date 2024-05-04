import 'package:flutter/material.dart';
import 'package:rurallstrong/servicos/autenticao_servico.dart';

class TelaTeste extends StatelessWidget {
  const TelaTeste({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
            padding: EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                AutenticaoServico().deslogar();
              },
              child: Text(
                'Deslogar',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ), 
    );
  }

}