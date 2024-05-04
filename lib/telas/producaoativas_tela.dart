import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rurallstrong/repositories/producoes_repositorio.dart';
import 'package:rurallstrong/servicos/autenticao_servico.dart';
import 'package:rurallstrong/telas/monitoramento_tela.dart';
import 'package:rurallstrong/telas/telateste.dart';

class ProducaoAtivasTela extends StatefulWidget {
  const ProducaoAtivasTela({Key? key}) : super(key: key);

  @override
  State<ProducaoAtivasTela> createState() => _ProducaoAtivasTelaState();
}

class _ProducaoAtivasTelaState extends State<ProducaoAtivasTela> {
  String? userId;
  List<Map<String, dynamic>>? producoes;

  @override
  void initState() {
    super.initState();
    _fetchUserId();
  }

  Future<void> _fetchUserId() async {
    userId = await AutenticaoServico().obterId();
    setState(() {}); // Atualiza o estado após obter o ID do usuário
  }

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
            if (userId != null)
              FutureBuilder<List<Map<String, dynamic>>>(
                future: FirebaseRepository().getFirestoreData('users/$userId/dados_producao'),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    // Exemplo de como usar os dados recuperados
                    producoes = snapshot.data!;
                    return Column(
                      children: [
                        for (var producao in producoes!)
                          dados(
                            context,
                            producao['cultivo'],
                            producao['datafinal'],
                            producao['datainicial'],
                            producao['fazenda'],
                            producao['nomeproducao'],
                            producao['nometalhao'],
                            producao['tamanhohectares'],
                          ),
                      ],
                    );
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
    String cultivo,
    Timestamp datafinal,
    Timestamp datainicial,
    String fazenda,
    String nomeproducao,
    String nometalhao,
    String tamanhohectares,
  ) {
    String dataFinalFormatada = _formatarData(datafinal.toDate());
    String dataInicialFormatada = _formatarData(datainicial.toDate());
    return GestureDetector(
      onTap: () {
        // Navegar para outra tela aqui
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MonitoramentoTela()),
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
                            cultivo,
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
                            nometalhao,
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
                        dataInicialFormatada,
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
                        dataFinalFormatada,
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
                        tamanhohectares,
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
                        fazenda,
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
  String _formatarData(DateTime data) {
    return "${data.day}/${data.month}/${data.year}";
  }
}
