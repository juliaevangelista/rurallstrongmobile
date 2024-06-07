import 'package:flutter/material.dart';
import 'package:rurallstrong/telas/config/colaboradorconfig_tela.dart';
import 'package:rurallstrong/telas/config/fazendaconfig_tela.dart';
import 'package:rurallstrong/telas/config/fornecedorconfig_tela.dart';
import 'package:rurallstrong/telas/config/producaoconfig_tela.dart';
import 'package:rurallstrong/telas/config/setoresconfig_tela.dart';
import 'package:rurallstrong/telas/config/talhaoconfig_tela.dart';
import 'package:rurallstrong/telas/config/veiculoconfig_tela.dart';
import 'package:rurallstrong/telas/telateste.dart';

class ConfiguracaoTela extends StatefulWidget {
  const ConfiguracaoTela({Key? key}) : super(key: key);

  @override
  _ConfiguracaoTelaState createState() => _ConfiguracaoTelaState();
}

class _ConfiguracaoTelaState extends State<ConfiguracaoTela> {
  void _navigateToTeste(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TelaTeste()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 60, 10, 25),
                  child: Text(
                    'Configuração',
                    style: TextStyle(
                      color: Color.fromRGBO(61, 190, 1, 1),
                      fontSize: 50,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 280,
                  margin: EdgeInsets.only(right: 30),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ColaboradorConfigTela()),
                          )
                        },
                        child: Container(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.arrow_right,
                                    color: Colors.grey[350],
                                    size: 50,
                                  ),
                                  Text(
                                    'COLABORADOR',
                                    style: TextStyle(
                                      color: Color.fromRGBO(61, 190, 1, 1),
                                      fontSize: 25,
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                color: Colors.grey[500],
                                thickness: 0.5,
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TalhaoConfigTela()),
                          )
                        },
                        child: Container(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.arrow_right,
                                    color: Colors.grey[350],
                                    size: 50,
                                  ),
                                  Text(
                                    'TALHÃO',
                                    style: TextStyle(
                                      color: Color.fromRGBO(61, 190, 1, 1),
                                      fontSize: 25,
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                color: Colors.grey[500],
                                thickness: 0.5,
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VeiculoConfigTela()),
                          )
                        },
                        child: Container(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.arrow_right,
                                    color: Colors.grey[350],
                                    size: 50,
                                  ),
                                  Text(
                                    'VEICULO',
                                    style: TextStyle(
                                      color: Color.fromRGBO(61, 190, 1, 1),
                                      fontSize: 25,
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                color: Colors.grey[500],
                                thickness: 0.3,
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SetoresConfigTela()),
                          )
                        },
                        child: Container(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.arrow_right,
                                    color: Colors.grey[350],
                                    size: 50,
                                  ),
                                  Text(
                                    'SETORES',
                                    style: TextStyle(
                                      color: Color.fromRGBO(61, 190, 1, 1),
                                      fontSize: 25,
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                color: Colors.grey[500],
                                thickness: 0.5,
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProducaoConfigTela()),
                          )
                        },
                        child: Container(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.arrow_right,
                                    color: Colors.grey[350],
                                    size: 50,
                                  ),
                                  Text(
                                    'PRODUÇAO',
                                    style: TextStyle(
                                      color: Color.fromRGBO(61, 190, 1, 1),
                                      fontSize: 25,
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                color: Colors.grey[500],
                                thickness: 0.5,
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FornecedorConfigTela()),
                          )
                        },
                        child: Container(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.arrow_right,
                                    color: Colors.grey[350],
                                    size: 50,
                                  ),
                                  Text(
                                    'FORNECEDOR',
                                    style: TextStyle(
                                      color: Color.fromRGBO(61, 190, 1, 1),
                                      fontSize: 25,
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                color: Colors.grey[500],
                                thickness: 0.5,
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FazendaConfigTela()),
                          )
                        },
                        child: Container(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.arrow_right,
                                    color: Colors.grey[350],
                                    size: 50,
                                  ),
                                  Text(
                                    'FAZENDA',
                                    style: TextStyle(
                                      color: Color.fromRGBO(61, 190, 1, 1),
                                      fontSize: 25,
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                color: Colors.grey[500],
                                thickness: 0.3,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
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
