import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:rurallstrong/telas/telateste.dart';

class VeiculoListaTela extends StatefulWidget {
  const VeiculoListaTela({Key? key}) : super(key: key);

  @override
  State<VeiculoListaTela> createState() => _VeiculoListaTelaState();
}

class _VeiculoListaTelaState extends State<VeiculoListaTela> {
  final DatabaseReference _veiculoRef = FirebaseDatabase.instance.ref().child('Veiculos');

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
                      'VEICULO',
                      style: TextStyle(fontSize: 19),
                    ),
                  ),
                ],
              ),
            ),
            StreamBuilder<DatabaseEvent>(
              stream: _veiculoRef.onValue,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  DataSnapshot data = snapshot.data!.snapshot;
                  Map<dynamic, dynamic>? veiculoData = data.value as Map<dynamic, dynamic>?;
                  if (veiculoData != null) {
                    List<Widget> veiculoContainers = [];
                    for (var veiculo in veiculoData.entries) {
                      veiculoContainers.add(
                        veiculoContainer(
                          context,
                          veiculo.value['nome'],
                          veiculo.value['combustivel'],
                          veiculo.value['idFazenda'],
                          veiculo.value['modelo'],
                          veiculo.value['placa'],
                          veiculo.value['setor'],
                        ),
                      );
                    }
                    return GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: veiculoContainers,
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

  Widget veiculoContainer(
    BuildContext context,
    dynamic nome,
    dynamic combustivel,
    dynamic idFazenda,
    dynamic modelo,
    dynamic placa,
    dynamic setor,
  ) {
    // Verificar nome
    String nomeValue = nome != null ? nome.toString() : 'N/A';

    // Verificar combustivel
    String combustivelValue = combustivel != null ? combustivel.toString() : 'N/A';

    // Verificar idFazenda
    String idFazendaValue = idFazenda != null ? idFazenda.toString() : 'N/A';

    // Verificar modelo
    String modeloValue = modelo != null ? modelo.toString() : 'N/A';

    // Verificar placa
    String placaValue = placa != null ? placa.toString() : 'N/A';

    // Verificar setor
    String setorValue = setor != null ? setor.toString() : 'N/A';

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
                    nomeValue,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'COMBUSTÍVEL',
                    style: TextStyle(
                      fontSize: 8,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    combustivelValue,
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
                    'MODELO',
                    style: TextStyle(
                      fontSize: 8,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    modeloValue,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'PLACA',
                    style: TextStyle(
                      fontSize: 8,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    placaValue,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'SETOR',
                    style: TextStyle(
                      fontSize: 8,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    setorValue,
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
