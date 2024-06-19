import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:rurallstrong/telas/telateste.dart';

class FornecedorListaTela extends StatefulWidget {
  const FornecedorListaTela({Key? key}) : super(key: key);

  @override
  State<FornecedorListaTela> createState() => _FornecedorListaTelaState();
}

class _FornecedorListaTelaState extends State<FornecedorListaTela> {
  final DatabaseReference _talhoesRef = FirebaseDatabase.instance.ref().child('Talhoes');

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
                      )),
                ],
              ),
            ),
            StreamBuilder<DatabaseEvent>(
              stream: _talhoesRef.onValue,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  DataSnapshot data = snapshot.data!.snapshot;
                  Map<dynamic, dynamic>? talhoesData = data.value as Map<dynamic, dynamic>?;
                  if (talhoesData != null) {
                    List<Widget> talhaoContainers = [];
                    for (var talhao in talhoesData.entries) {
                      talhaoContainers.add(
                        talhaoContainer(
                          context,
                          talhao.value['name'],
                          talhao.value['size'],
                          talhao.value['idFazenda'],
                          talhao.value['chave'],
                        ),
                      );
                    }
                    return GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: talhaoContainers,
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

  Widget talhaoContainer(
    BuildContext context,
    dynamic name,
    dynamic tamanhoHectares,
    dynamic fazenda,
    dynamic cod,
  ) {
    // Verificar name
    String nameValue = name != null ? name.toString() : 'N/A';

    // Verificar tamanhoHectares
    String tamanhoHectaresValue = tamanhoHectares != null ? tamanhoHectares.toString() : 'N/A';

    // Verificar fazenda
    String fazendaValue = fazenda != null ? fazenda.toString() : 'N/A';

    // Verificar cod
    String codValue = cod != null ? cod.toString() : 'N/A';

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
                    'NOME',
                    style: TextStyle(
                      fontSize: 8,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    nameValue,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'TAMANHO HECTARES',
                    style: TextStyle(
                      fontSize: 8,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    tamanhoHectaresValue,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'FAZENDA',
                    style: TextStyle(
                      fontSize: 8,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    fazendaValue,
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
                    'COD.',
                    style: TextStyle(
                      fontSize: 8,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    codValue,
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
