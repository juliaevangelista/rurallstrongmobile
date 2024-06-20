import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:rurallstrong/telas/telateste.dart';

class ProducaoListaTela extends StatefulWidget {
  const ProducaoListaTela({Key? key}) : super(key: key);

  @override
  State<ProducaoListaTela> createState() => _ProducaoListaTelaState();
}

class _ProducaoListaTelaState extends State<ProducaoListaTela> {
  final DatabaseReference _producaoRef = FirebaseDatabase.instance.ref().child('Producoes');

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
                      'PRODUCAO',
                      style: TextStyle(fontSize: 19),
                    ),
                  ),
                ],
              ),
            ),
            StreamBuilder<DatabaseEvent>(
              stream: _producaoRef.onValue,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  DataSnapshot data = snapshot.data!.snapshot;
                  Map<dynamic, dynamic>? producaoData = data.value as Map<dynamic, dynamic>?;
                  if (producaoData != null) {
                    List<Widget> producaoContainers = [];
                    for (var producao in producaoData.entries) {
                      producaoContainers.add(
                        producaoContainer(
                          context,
                          producao.value['name'],
                          producao.value['size'],
                          producao.value['idFazenda'],
                          producao.value['chave'],
                          producao.value['cultivar'],
                          producao.value['semente'],
                          producao.value['talhao'],
                        ),
                      );
                    }
                    return GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: producaoContainers,
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

  Widget producaoContainer(
    BuildContext context,
    dynamic name,
    dynamic size,
    dynamic idFazenda,
    dynamic chave,
    dynamic cultivar,
    dynamic semente,
    dynamic talhao,
  ) {
    // Verificar name
    String nameValue = name != null ? name.toString() : 'N/A';

    // Verificar size
    String sizeValue = size != null ? size.toString() : 'N/A';

    // Verificar idFazenda
    String idFazendaValue = idFazenda != null ? idFazenda.toString() : 'N/A';

    // Verificar chave
    String chaveValue = chave != null ? chave.toString() : 'N/A';

    // Verificar cultivar
    String cultivarValue = cultivar != null ? cultivar.toString() : 'N/A';

    // Verificar semente
    String sementeValue = semente != null ? semente.toString() : 'N/A';

    // Verificar talhao
    String talhaoValue = talhao != null ? talhao.toString() : 'N/A';

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
              nameValue,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
            ),
            SizedBox(height: 2),
            Text(
              'TAMANHO (HECTARES)',
              style: TextStyle(fontSize: 8),
            ),
            Text(
              sizeValue,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
            ),
            SizedBox(height: 2),
            Text(
              'FAZENDA',
              style: TextStyle(fontSize: 8),
            ),
            Text(
              idFazendaValue,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
            ),
            SizedBox(height: 2),
            Text(
              'CHAVE',
              style: TextStyle(fontSize: 8),
            ),
            Text(
              chaveValue,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
            ),
            SizedBox(height: 2),
            Text(
              'CULTIVAR',
              style: TextStyle(fontSize: 8),
            ),
            Text(
              cultivarValue,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
            ),
            SizedBox(height: 2),
            Text(
              'SEMENTE',
              style: TextStyle(fontSize: 8),
            ),
            Text(
              sementeValue,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
            ),
            SizedBox(height: 2),
            Text(
              'TALHÃO',
              style: TextStyle(fontSize: 8),
            ),
            Text(
              talhaoValue,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }
}
