import 'package:flutter/material.dart';
import 'package:rurallstrong/telas/tarefas/atualizartarefas_tela.dart';
import 'package:rurallstrong/telas/telateste.dart';

class TarefasTela extends StatefulWidget {
  const TarefasTela({Key? key}) : super(key: key);

  @override
  State<TarefasTela> createState() => _TarefasTelaState();
}

class _TarefasTelaState extends State<TarefasTela> {
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
            Container(
              width: 240,
              height: 95,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 8, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Text(
                        'TAREFAS',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        '11',
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 40,
                            fontWeight: FontWeight.w900),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 70,
                  ),
                  Column(
                    children: [
                      Text(
                        'URGENTE',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        '03',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 40,
                            fontWeight: FontWeight.w900),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            buildContainer('1202202', 'ASSUNTO 12/02/2024', '12/02/2024', 'SIM',
                'KSKSKSKSKKSKS', 'SIM', 'SOJA', 'MATUTINO'),
            SizedBox(
              height: 15,
            ),
            buildContainer('1202202', 'ASSUNTO 12/02/2024', '12/02/2024', 'SIM',
                'KSKSKSKSKKSKS', 'SIM', 'SOJA', 'MATUTINO'),
          ],
        ),
      ),
    );
  }

  Widget buildContainer(String id, String titulo, String data, String urgente,
      String descricao, String talhao, String producao, String periodo) {
    return Container(
      width: 400,
      height: 250,
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
            height: 20,
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
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AtualizarTarefasTela()),
                )
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'INICIAR',
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
}
/* import 'package:flutter/material.dart';
import 'package:rurallstrong/telas/tarefas/atualizartarefas_tela.dart';
import 'package:rurallstrong/telas/telateste.dart';

class TarefasTela extends StatefulWidget {
  const TarefasTela({Key? key}) : super(key: key);

  @override
  State<TarefasTela> createState() => _TarefasTelaState();
}

class _TarefasTelaState extends State<TarefasTela> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
                    SizedBox(width: 20),
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
                        backgroundColor: Color.fromRGBO(61, 190, 1, 0),
                        foregroundColor: Color.fromRGBO(61, 190, 1, 1),
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
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 240,
                height: 95,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildStatistic('TAREFAS', '11', Colors.green),
                    SizedBox(width: 70),
                    _buildStatistic('URGENTE', '03', Colors.red),
                  ],
                ),
              ),
              SizedBox(height: 20),
              _buildContainer(
                '1202202',
                'ASSUNTO 12/02/2024',
                '12/02/2024',
                'SIM',
                'KSKSKSKSKKSKS',
                'SIM',
                'SOJA',
                'MATUTINO',
              ),
              SizedBox(height: 15),
              _buildContainer(
                '1202202',
                'ASSUNTO 12/02/2024',
                '12/02/2024',
                'SIM',
                'KSKSKSKSKKSKS',
                'SIM',
                'SOJA',
                'MATUTINO',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatistic(String label, String value, Color color) {
    return Column(
      children: [
        Text(label, style: TextStyle(fontSize: 15)),
        Text(
          value,
          style: TextStyle(color: color, fontSize: 40, fontWeight: FontWeight.w900),
        ),
      ],
    );
  }

  Widget _buildContainer(String id, String titulo, String data, String urgente,
      String descricao, String talhao, String producao, String periodo) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color.fromRGBO(51, 51, 51, 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text('ID: ', style: TextStyle(color: Color.fromRGBO(190, 155, 1, 1), fontSize: 13, fontWeight: FontWeight.w900)),
                      Text(id, style: TextStyle(color: Color.fromRGBO(190, 155, 1, 1), fontSize: 13, fontWeight: FontWeight.w900)),
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
              SizedBox(height: 10),
              Row(
                children: [
                  _buildDetail('TITULO: ', titulo),
                  SizedBox(width: 20),
                  _buildDetail('DATA: ', data),
                ],
              ),
              SizedBox(height: 7),
              Row(
                children: [
                  _buildDetail('URGENTE: ', urgente),
                  SizedBox(width: 20),
                  _buildDetail('DESCRIÇÃO: ', descricao),
                ],
              ),
              SizedBox(height: 7),
              Row(
                children: [
                  _buildDetail('TALHÃO: ', talhao),
                  SizedBox(width: 20),
                  _buildDetail('PRODUÇÃO: ', producao),
                ],
              ),
              SizedBox(height: 7),
              Row(
                children: [
                  _buildDetail('PERIODO: ', periodo),
                ],
              ),
              SizedBox(height: 20),
              Container(
                width: constraints.maxWidth, // Matches parent width
                height: 45,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(61, 190, 1, 1),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AtualizarTarefasTela()),
                  ),
                  child: Center(
                    child: Text(
                      'INICIAR',
                      style: TextStyle(color: Colors.black, fontSize: 17.0, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildDetail(String label, String value) {
    return Row(
      children: [
        Text(label, style: TextStyle(color: Color.fromRGBO(61, 190, 1, 1), fontSize: 13, fontWeight: FontWeight.w900)),
        Text(value, style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w900)),
      ],
    );
  }
}
 */