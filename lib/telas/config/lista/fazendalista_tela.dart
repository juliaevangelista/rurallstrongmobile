import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:rurallstrong/telas/telateste.dart';

class FazendaListaTela extends StatefulWidget {
  const FazendaListaTela({Key? key}) : super(key: key);

  @override
  State<FazendaListaTela> createState() => _FazendaListaTelaState();
}

class _FazendaListaTelaState extends State<FazendaListaTela> {
  final DatabaseReference _fazendaRef = FirebaseDatabase.instance.ref().child('Fazendas');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              height: 120,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 65,
                    height: 65,
                    margin: EdgeInsets.fromLTRB(20, 15, 20, 7),
                    child: Image.asset(
                      'assets/APLICATIVO-17.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 65,
                    height: 65,
                    margin: EdgeInsets.fromLTRB(20, 15, 20, 7),
                    child: Image.asset(
                      'assets/icon-app.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Color.fromRGBO(61, 190, 1, 1),
                      backgroundColor: Color.fromRGBO(61, 190, 1, 0),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TelaTeste()),
                      );
                    },
                    child: Text(
                      'FAZENDAS',
                      style: TextStyle(fontSize: 19),
                    ),
                  ),
                ],
              ),
            ),
            StreamBuilder<DatabaseEvent>(
              stream: _fazendaRef.onValue,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  DataSnapshot data = snapshot.data!.snapshot;
                  Map<dynamic, dynamic>? fazendaData = data.value as Map<dynamic, dynamic>?;
                  if (fazendaData != null) {
                    List<Widget> fazendaContainers = [];
                    for (var fazenda in fazendaData.entries) {
                      fazendaContainers.add(
                        fazendaContainer(
                          context,
                          fazenda.value['nomeFazenda'],
                          fazenda.value['endereco'],
                          fazenda.value['hectares'],
                          fazenda.value['idFazenda'],
                          fazenda.value['idProprietario'],
                        ),
                      );
                    }
                    return GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: fazendaContainers,
                    );
                  } else {
                    return Text('No data available');
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget fazendaContainer(
    BuildContext context,
    dynamic nomeFazenda,
    dynamic endereco,
    dynamic hectares,
    dynamic idFazenda,
    dynamic idProprietario,
  ) {
    // Verificar e converter para String ou 'N/A' se nulo
    String nomeFazendaValue = nomeFazenda != null ? nomeFazenda.toString() : 'N/A';
    String enderecoValue = endereco != null ? endereco.toString() : 'N/A';
    String hectaresValue = hectares != null ? hectares.toString() : 'N/A';
    String idFazendaValue = idFazenda != null ? idFazenda.toString() : 'N/A';
    String idProprietarioValue = idProprietario != null ? idProprietario.toString() : 'N/A';

    return Container(
      width: 150,
      height: 220,
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 30,
              width: 30,
              child: Image.asset(
                'assets/icon-talhoes.png',
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 2),
            Text(
              'NOME',
              style: TextStyle(fontSize: 8),
            ),
            Text(
              nomeFazendaValue,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
            ),
            SizedBox(height: 2),
            Text(
              'ENDEREÇO',
              style: TextStyle(fontSize: 8),
            ),
            Text(
              enderecoValue,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
            ),
            SizedBox(height: 2),
            Text(
              'HECTARES',
              style: TextStyle(fontSize: 8),
            ),
            Text(
              hectaresValue,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
            ),
            SizedBox(height: 2),
            Text(
              'ID FAZENDA',
              style: TextStyle(fontSize: 8),
            ),
            Text(
              idFazendaValue,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
            ),
            SizedBox(height: 2),
            Text(
              'ID PROPRIETÁRIO',
              style: TextStyle(fontSize: 8),
            ),
            Text(
              idProprietarioValue,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }
}
