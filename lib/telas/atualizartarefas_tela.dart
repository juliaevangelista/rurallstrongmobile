import 'package:flutter/material.dart';
import 'package:rurallstrong/telas/telateste.dart';

class AtualizarTarefasTela extends StatefulWidget {
  const AtualizarTarefasTela({Key? key}) : super(key: key);

  @override
  _AtualizarTarefasTelaState createState() => _AtualizarTarefasTelaState();
}

class _AtualizarTarefasTelaState extends State<AtualizarTarefasTela> {
  bool tarefaConcluida = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    width: 80,
                    height: 80,
                    margin: EdgeInsets.fromLTRB(20, 15, 20, 7),
                    child: Image.asset(
                      'assets/icon-tarefas.png',
                      fit: BoxFit.contain,
                    ),
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
                        'TAREFAS',
                        style: TextStyle(fontSize: 23),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            buildContainer('1202202', 'ASSUNTO 12/02/2024', '12/02/2024', 'SIM',
                'KSKSKSKSKKSKS', 'SIM', 'SOJA', 'MATUTINO'),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    margin: EdgeInsets.fromLTRB(20, 15, 20, 7),
                    child: Image.asset(
                      'assets/APLICATIVO-16.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    margin: EdgeInsets.fromLTRB(20, 15, 20, 7),
                    child: Image.asset(
                      'assets/APLICATIVO-16.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    margin: EdgeInsets.fromLTRB(20, 15, 20, 7),
                    child: Image.asset(
                      'assets/APLICATIVO-16.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildContainer(String id, String titulo, String data, String urgente,
      String descricao, String talhao, String producao, String periodo) {
    return Container(
      width: 400,
      height: 500,
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color.fromRGBO(51, 51, 51, 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
          child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'ID: ',
                    style: TextStyle(
                        color: Color.fromRGBO(190, 155, 1, 1),
                        fontSize: 13,
                        fontWeight: FontWeight.w900),
                  ),
                  Text(
                    id,
                    style: TextStyle(
                        color: Color.fromRGBO(190, 155, 1, 1),
                        fontSize: 13,
                        fontWeight: FontWeight.w900),
                  ),
                ],
              ),
              Container(
                width: 45,
                height: 45,
                child: Image.asset(
                  'assets/icon-urgente.png',
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'TITULO: ',
                        style: TextStyle(
                            color: Color.fromRGBO(61, 190, 1, 1),
                            fontSize: 13,
                            fontWeight: FontWeight.w900),
                      ),
                      Text(
                        titulo,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Row(
                    children: [
                      Text(
                        'DATA: ',
                        style: TextStyle(
                            color: Color.fromRGBO(61, 190, 1, 1),
                            fontSize: 13,
                            fontWeight: FontWeight.w900),
                      ),
                      Text(
                        data,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Row(
                    children: [
                      Text(
                        'URGENTE: ',
                        style: TextStyle(
                            color: Color.fromRGBO(61, 190, 1, 1),
                            fontSize: 13,
                            fontWeight: FontWeight.w900),
                      ),
                      Text(
                        urgente,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Row(
                    children: [
                      Text(
                        'DESCRIÇÃO: ',
                        style: TextStyle(
                            color: Color.fromRGBO(61, 190, 1, 1),
                            fontSize: 13,
                            fontWeight: FontWeight.w900),
                      ),
                      Text(
                        descricao,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'TALHÃO: ',
                        style: TextStyle(
                            color: Color.fromRGBO(61, 190, 1, 1),
                            fontSize: 13,
                            fontWeight: FontWeight.w900),
                      ),
                      Text(
                        talhao,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Row(
                    children: [
                      Text(
                        'PRODUÇÃO: ',
                        style: TextStyle(
                            color: Color.fromRGBO(61, 190, 1, 1),
                            fontSize: 13,
                            fontWeight: FontWeight.w900),
                      ),
                      Text(
                        producao,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Row(
                    children: [
                      Text(
                        'PERIODO: ',
                        style: TextStyle(
                            color: Color.fromRGBO(61, 190, 1, 1),
                            fontSize: 13,
                            fontWeight: FontWeight.w900),
                      ),
                      Text(
                        periodo,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            margin: EdgeInsets.only(top: 10, left: 10, right: 10),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: '',
                labelStyle:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0),
                floatingLabelBehavior: FloatingLabelBehavior.never,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Data de hoje: ',
                  style: TextStyle(color: Colors.green, fontSize: 10),
                ),
                Text(
                  '19/02/2024',
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          BotaoCamera(),
          SizedBox(
            height: 25,
          ),
          Container(
            width: 120,
            height: 45,
            decoration: BoxDecoration(
              color: Color.fromRGBO(61, 190, 1, 1),
              borderRadius: BorderRadius.circular(7),
            ),
            child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                icon: Icon(Icons.close),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Implemente a lógica para a primeira opção aqui
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor:
                                  Colors.black, // Cor de fundo do botão
                              backgroundColor:
                                  Colors.grey, // Cor do texto do botão
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10), // Borda arredondada
                              ),
                              fixedSize: Size(210, 50),
                            ),
                            child: Text('AGUARDANDO'),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Implemente a lógica para a segunda opção aqui
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor:
                                  Colors.black, // Cor de fundo do botão
                              backgroundColor:
                                  Colors.orange, // Cor do texto do botão
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10), // Borda arredondada
                              ),
                              fixedSize: Size(210, 50),
                            ),
                            child: Text('EM PROGRESSO'),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Implemente a lógica para a terceira opção aqui
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor:
                                  Colors.black, // Cor de fundo do botão
                              backgroundColor:
                                  Colors.green, // Cor do texto do botão
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10), // Borda arredondada
                              ),
                              fixedSize: Size(210, 50),
                            ),
                            child: Text('CONCLUIDO'),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Implemente a lógica para a quarta opção aqui
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor:
                                  Colors.black, // Cor de fundo do botão
                              backgroundColor:
                                  Colors.red, // Cor do texto do botão
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10), // Borda arredondada
                              ),
                              fixedSize: Size(210, 50),
                            ),
                            child: Text('NÃO EXECUTADA'),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                              onPressed: () => {},
                              style: ElevatedButton.styleFrom(
                                foregroundColor:
                                    Colors.black, // Cor de fundo do botão
                                backgroundColor:
                                    Colors.blue, // Cor do texto do botão
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      10), // Borda arredondada
                                ),
                                //fixedSize: Size(210, 50),
                              ),
                              child: Text('SALVAR')),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'ATUALIZAR',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }

  Widget BotaoCamera() {
    return Container(
      width: 150,
      height: 55,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () => {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icon-camera.png',
              width: 55.0,
              height: 55.0,
            ),
            SizedBox(width: 8.0),
            Text(
              'FOTO',
              style: TextStyle(
                color: Color.fromRGBO(61, 190, 1, 1),
                fontSize: 20.0,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
