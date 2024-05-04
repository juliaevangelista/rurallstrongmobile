import 'package:flutter/material.dart';
import 'package:rurallstrong/telas/daninhas_tela.dart';
import 'package:rurallstrong/telas/doencas_tela.dart';
import 'package:rurallstrong/telas/pragas_tela.dart';
//import 'package:rural_strong/telas/telateste.dart';

class MonitoramentoTela extends StatefulWidget {
  const MonitoramentoTela({Key? key}) : super(key: key);

  @override
  State<MonitoramentoTela> createState() => _MonitoramentoTelaState();
}

class _MonitoramentoTelaState extends State<MonitoramentoTela> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
            height: 120,
            alignment: Alignment.center,
            child: Image.asset(
              'assets/APLICATIVO-16.png',
              fit: BoxFit.contain,
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Center(
              child: Text('MONITORAR',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),
          Container(
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
                                        fontSize: 11),
                                  ),
                                  Text(
                                    'MILHO 14H BAYER',
                                    style: TextStyle(
                                        color: Color.fromRGBO(61, 190, 1, 1),
                                        fontSize: 15,
                                        fontWeight: FontWeight.w900),
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
                                        fontSize: 11),
                                  ),
                                  Text(
                                    'TALHÃO 09',
                                    style: TextStyle(
                                        color: Color.fromRGBO(61, 190, 1, 1),
                                        fontSize: 15,
                                        fontWeight: FontWeight.w900),
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
                                style: TextStyle(
                                    color: Colors.black, fontSize: 11),
                              ),
                              Text(
                                '21/02/2024',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w900),
                              ),
                              Text(
                                'DATA FINAL',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 11),
                              ),
                              Text(
                                '04/04/2024',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w900),
                              ),
                            ],
                          ),
                          SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'PLANTANDO HÉCTARES',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 11),
                              ),
                              Text(
                                '125,5',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w900),
                              ),
                              Text(
                                'FAZENDA',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 11),
                              ),
                              Text(
                                'FAZENDA PRIMAVERA',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w900),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
          SizedBox(
            height: 20,
          ),
          buildButtons(context),
        ],
      ),
    );
  }

  Widget buildButtons(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildCustomButtons(
            'assets/icon-praga.png',
            'PRAGAS',
            () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PragasTela()),
              );
            },
          ),
          _buildCustomButtons(
            'assets/icon-daninhas.png',
            'DANINHAS',
            () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DaninhasTela()),
              );
            },
          ),
          _buildCustomButtons(
            'assets/icon-doencas.png',
            'DOENÇAS',
            () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DoencasTela()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCustomButtons(
      String imagePath, String text, VoidCallback onPressed) {
    return Container(
      width: 250,
      height: 50,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color.fromRGBO(61, 190, 1, 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              imagePath,
              width: 55.0,
              height: 55.0,
            ),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 25, right: 25),
                  child: Text(
                    text,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
