import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:rurallstrong/telas/monitoramento/monitoramento_tela.dart';
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
            StreamBuilder<DatabaseEvent>(
              stream: _producoesRef.onValue,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  DataSnapshot data = snapshot.data!.snapshot;
                  Map<dynamic, dynamic>? producoesData =
                      (data.value as Map<dynamic, dynamic>?);
                  if (producoesData != null) {
                    return Column(
                      children: [
                        for (var producao in producoesData.entries)
                          dados(
                            context,
                            producao.value['name'],
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
    String previstaValue;
    if (prevista != null) {
      if (prevista is String) {
        DateTime dateTime = DateTime.parse(prevista);
        previstaValue =
            '${dateTime.day.toString().padLeft(2, '0')}/${dateTime.month.toString().padLeft(2, '0')}/${dateTime.year} ${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
      } else {
        previstaValue = prevista.toString();
      }
    } else {
      previstaValue = 'N/A';
    }

    // Verificar dataInicial
    String dataInicialValue;
    if (dataInicial != null) {
      if (dataInicial is String) {
        DateTime dateTime = DateTime.parse(dataInicial);
        dataInicialValue =
            '${dateTime.day.toString().padLeft(2, '0')}/${dateTime.month.toString().padLeft(2, '0')}/${dateTime.year} ${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
      } else {
        dataInicialValue = dataInicial.toString();
      }
    } else {
      dataInicialValue = 'N/A';
    }

    // Verificar idFazenda
    String idFazendaText = idFazenda != null ? idFazenda.toString() : 'N/A';

    // Verificar talhao
    String talhaoValue = talhao != null ? talhao.toString() : 'N/A';

    // Verificar size
    String getSizeValue(dynamic size) {
      if (size != null) {
        if (size is int) {
          return size.toString();
        } else if (size is String) {
          double? doubleValue = double.tryParse(size);
          if (doubleValue != null) {
            return doubleValue.toString();
          } else {
            return 'N/A';
          }
        } else {
          return 'N/A';
        }
      } else {
        return 'N/A';
      }
    }

    return GestureDetector(
      onTap: () {
        // Navegar para outra tela aqui
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MonitoramentoTela(
                    name: name,
                    talhao: talhao,
                    cultivar: cultivarValue,
                    prevista: previstaValue,
                    dataInicial: dataInicialValue,
                    idFazenda: idFazendaText,
                    size: getSizeValue(size),
                  )),
        );
      },
      child: Container(
        margin: EdgeInsets.all(10),
        width: 350,
        height: 175,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 330,
                      height: 60,
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
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
                            getSizeValue(size),
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
        ),
      ),
    );
  }
}
