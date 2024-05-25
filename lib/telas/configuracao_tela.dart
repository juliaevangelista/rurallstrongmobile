import 'package:flutter/material.dart';

class ConfiguracaoTela extends StatefulWidget {
  const ConfiguracaoTela({Key? key}) : super(key: key);

  @override
  _ConfiguracaoTelaState createState() => _ConfiguracaoTelaState();
}

class _ConfiguracaoTelaState extends State<ConfiguracaoTela> {
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
                          color: Color.fromRGBO(61, 190, 1, 1), fontSize: 50),
                    ),
                  )
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
                        Container(
                          child: Column(
                            children: [
                              /* Divider(
                                color: Colors.grey[500],
                                thickness: 1,
                              ), */
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
                        Container(
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
                        Container(
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
                        Container(
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
                        Container(
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
                        Container(
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
                        Container(
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
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
