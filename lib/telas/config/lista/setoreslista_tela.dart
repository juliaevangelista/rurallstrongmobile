import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:rurallstrong/telas/telateste.dart';

class SetoresListaTela extends StatefulWidget {
  const SetoresListaTela({Key? key}) : super(key: key);

  @override
  State<SetoresListaTela> createState() => _SetoresListaTelaState();
}

class _SetoresListaTelaState extends State<SetoresListaTela> {
  final DatabaseReference _setoresRef = FirebaseDatabase.instance.ref().child('Setores');

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
                      'TALHÃO',
                      style: TextStyle(fontSize: 19),
                    ),
                  ),
                ],
              ),
            ),
            StreamBuilder<DatabaseEvent>(
              stream: _setoresRef.onValue,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  DataSnapshot data = snapshot.data!.snapshot;
                  Map<dynamic, dynamic>? setoresData = data.value as Map<dynamic, dynamic>?;
                  if (setoresData != null) {
                    List<Widget> setoresContainers = [];
                    for (var setor in setoresData.entries) {
                      setoresContainers.add(
                        setoresContainer(
                          context,
                          setor.value['titulo'],
                          setor.value['descricao'],
                          setor.value['idFazenda'],
                          setor.value['chave'],
                        ),
                      );
                    }
                    return GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: setoresContainers,
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

  Widget setoresContainer(
    BuildContext context,
    dynamic titulo,
    dynamic descricao,
    dynamic idFazenda,
    dynamic chave,
  ) {
    // Verificar titulo
    String tituloValue = titulo != null ? titulo.toString() : 'N/A';

    // Verificar descricao
    String descricaoValue = descricao != null ? descricao.toString() : 'N/A';

    // Verificar idFazenda
    String idFazendaValue = idFazenda != null ? idFazenda.toString() : 'N/A';

    // Verificar chave
    String chaveValue = chave != null ? chave.toString() : 'N/A';

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
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
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
                  Text(
                    'TÍTULO',
                    style: TextStyle(
                      fontSize: 8,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    tituloValue,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'DESCRIÇÃO',
                    style: TextStyle(
                      fontSize: 8,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    descricaoValue,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'ID FAZENDA',
                    style: TextStyle(
                      fontSize: 8,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    idFazendaValue,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                    ),
                  ),
                  SizedBox(height: 2),
                ],
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'CHAVE',
                    style: TextStyle(
                      fontSize: 8,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    chaveValue,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
