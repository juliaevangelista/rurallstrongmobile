import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:rurallstrong/telas/monitoramento_tela.dart';
import 'package:rurallstrong/telas/telateste.dart';

class ProducaoAtivasTela extends StatefulWidget {
  const ProducaoAtivasTela({super.key});

  @override
  State<ProducaoAtivasTela> createState() => _ProducaoAtivasTelaState();
}

class _ProducaoAtivasTelaState extends State<ProducaoAtivasTela> {
  final DatabaseReference _producoesRef =
      FirebaseDatabase.instance.ref().child('Producoes');

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
                    width: 80,
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
                      'PRODUÇÂO',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            FutureBuilder<DataSnapshot>(
              future: _producoesRef.once().then((event) => event.snapshot),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  Map<dynamic, dynamic>? producoesData =
                      (snapshot.data?.value as Map<dynamic, dynamic>?);
                  if (producoesData != null) {
                    return Column(
                      children: [
                        for (var producao in producoesData.entries)
                          dados(
                            context,
                            producao.value['cultivar'],
                            producao.value['prevista'],
                            producao.value['dataInicial'],
                            producao.value['idFazenda'],
                            producao.value['name'],
                            producao.value['talhao'],
                            producao.value['size'],
                          ),
                      ],
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

  Widget dados(
    BuildContext context,
    dynamic cultivar,
    dynamic prevista,
    dynamic dataInicial,
    dynamic idFazenda,
    dynamic name,
    dynamic talhao,
    dynamic size,
  ) {
// Verificar cultivar
    String cultivarValue = cultivar != null ? cultivar.toString() : 'N/A';

    // Verificar prevista
    String previstaValue = prevista != null ? prevista.toString() : 'N/A';

    // Verificar dataInicial
    String dataInicialValue =
        dataInicial != null ? dataInicial.toString() : 'N/A';

    // Verificar idFazenda
    String idFazendaText = idFazenda != null ? idFazenda.toString() : 'N/A';

    // Verificar talhao
    String talhaoValue = talhao != null ? talhao.toString() : 'N/A';

    // Verificar size
// Verificar size
    var sizeValue = size != null
        ? (size is int
            ? size.toDouble()
            : (size is String ? double.tryParse(size) ?? 'N/A' : 'N/A'))
        : 'N/A';

    return GestureDetector(
      onTap: () {
        // Navegar para outra tela aqui
        Navigator.push(
          context,
            MaterialPageRoute(builder: (context) => MonitoramentoTela(name: name, talhao: talhao)),
        );
      },
      child: Container(
        margin: EdgeInsets.all(10),
        width: 350,
        height: 160,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 330,
                  height: 55,
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.only(top: 7),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'NOME',
                            style: TextStyle(
                              color: Color.fromRGBO(61, 190, 1, 1),
                              fontSize: 11,
                            ),
                          ),
                          Text(
                            cultivarValue,
                            style: TextStyle(
                              color: Color.fromRGBO(61, 190, 1, 1),
                              fontSize: 15,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 90,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'TALHÃO',
                            style: TextStyle(
                              color: Color.fromRGBO(61, 190, 1, 1),
                              fontSize: 11,
                            ),
                          ),
                          Text(
                            talhaoValue,
                            style: TextStyle(
                              color: Color.fromRGBO(61, 190, 1, 1),
                              fontSize: 15,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'DATA INICIAL',
                        style: TextStyle(color: Colors.black, fontSize: 11),
                      ),
                      Text(
                        dataInicialValue,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        'DATA FINAL',
                        style: TextStyle(color: Colors.black, fontSize: 11),
                      ),
                      Text(
                        previstaValue,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 50),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'PLANTANDO HÉCTARES',
                        style: TextStyle(color: Colors.black, fontSize: 11),
                      ),
                      Text(
                        '${sizeValue}',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        'FAZENDA',
                        style: TextStyle(color: Colors.black, fontSize: 11),
                      ),
                      Text(
                        idFazendaText,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
