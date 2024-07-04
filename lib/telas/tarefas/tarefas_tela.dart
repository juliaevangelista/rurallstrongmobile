import 'package:flutter/material.dart';
import 'package:rurallstrong/repositories/tarefas.dart';
import 'package:rurallstrong/telas/inicio_tela.dart';
import 'package:rurallstrong/telas/tarefas/atualizartarefas_tela.dart';
import 'package:rurallstrong/telas/telateste.dart';
import 'package:firebase_database/firebase_database.dart';

class TarefasTela extends StatefulWidget {
  const TarefasTela({Key? key}) : super(key: key);

  @override
  State<TarefasTela> createState() => _TarefasTelaState();
}

class _TarefasTelaState extends State<TarefasTela> {
  List<Map<String, dynamic>> _tarefas = [];

  @override
  void initState() {
    super.initState();
    _carregarTarefas();
  }

  Future<void> _carregarTarefas() async {
    try {
      List<Map<String, dynamic>> tarefas = await obterTarefas();

      setState(() {
        _tarefas = tarefas;
      });
    } catch (error) {
      print('Erro ao carregar as tarefas: $error');
      // Tratar erro conforme necessário
    }
  }
  String formatarData(dynamic data) {
      if (data != null && data is String && data.isNotEmpty) {
        try {
          DateTime dateTime = DateTime.parse(data);
          return '${dateTime.day.toString().padLeft(2, '0')}/${dateTime.month.toString().padLeft(2, '0')}/${dateTime.year} ${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
        } catch (e) {
          return 'N/A';
        }
      } else {
        return 'N/A';
      }
    }

    // Converter urgente para String verificando se é verdadeiro
    String verificarUrgente(dynamic urgente) {
      if (urgente != null && (urgente == true || urgente.toString().toLowerCase() == 'true')) {
        return 'SIM';
      } else {
        return 'NÃO';
      }
    }

    // Verificar talhao
    String verificarTalhao(dynamic talhao) {
      return talhao != null ? talhao.toString() : 'N/A';
    }

    // Verificar producao
    String verificarProducao(dynamic producao) {
      return producao != null ? producao.toString() : 'N/A';
    }

    // Verificar periodo
    String verificarPeriodo(dynamic periodo) {
      return periodo != null ? periodo.toString() : 'N/A';
    }

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
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => InicioTela()),
                        );
                      },
                      child: Container(
                        width: 65,
                        height: 65,
                        margin: EdgeInsets.fromLTRB(20, 15, 20, 7),
                        child: Image.asset(
                          'assets/APLICATIVO-17.png',
                          fit: BoxFit.contain,
                        ),
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
                        style: TextStyle(fontSize: 18), // Reduzido o tamanho da fonte
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width * 0.8, // Ajustado para largura relativa
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
                    SizedBox(width: 40), // Aumentado o espaço entre os números
                    _buildStatistic('URGENTE', '03', Colors.red),
                  ],
                ),
              ),
              SizedBox(height: 20),
              ..._tarefas.map((tarefa) => GestureDetector(
                onTap: () => _mostrarDetalhesTarefa(context, tarefa),
                child: _buildContainer(
                  tarefa['id'],
                  tarefa['titulo'],
                  tarefa['data'],
                  tarefa['urgente'],
                  tarefa['descricao'],
                  tarefa['talhao'],
                  tarefa['producao'],
                  tarefa['periodo'],
                ),
              )).toList(),
            ],
          ),
        ),
      ),
    );
  }

  void _mostrarDetalhesTarefa(BuildContext context, Map<String, dynamic> tarefa) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color.fromRGBO(51, 51, 51, 1),
          title: Text('Detalhes da Tarefa', style: TextStyle(color: Colors.white),),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDetail('ID: ', tarefa['id'] != null ? tarefa['id'].toString() : 'N/A'),
                _buildDetail('TÍTULO: ', tarefa['titulo'] != null ? tarefa['titulo'].toString() : 'N/A'),
                _buildDetail('DATA: ', formatarData(tarefa['data'])),
                _buildDetail('URGENTE: ', verificarUrgente(tarefa['urgente'])),
                _buildDetail('DESCRIÇÃO: ', tarefa['descricao'] != null ? tarefa['descricao'].toString() : 'N/A'),
                _buildDetail('TALHÃO: ', verificarTalhao(tarefa['talhao'])),
                _buildDetail('PRODUÇÃO: ', verificarProducao(tarefa['producao'])),
                _buildDetail('PERÍODO: ', verificarPeriodo(tarefa['periodo'])),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Fechar'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildStatistic(String label, String value, Color color) {
    return Column(
      children: [
        Text(label, style: TextStyle(fontSize: 18)), // Reduzido o tamanho da fonte
        Text(
          value,
          style: TextStyle(color: color, fontSize: 28, fontWeight: FontWeight.w900), // Ajustado o tamanho da fonte
        ),
      ],
    );
  }

Widget _buildContainer(
  dynamic id,
  dynamic titulo,
  dynamic data,
  dynamic urgente,
  dynamic descricao,
  dynamic talhao,
  dynamic producao,
  dynamic periodo,
) {
  // Função para formatar a data
  String formatarData(dynamic data) {
    if (data != null && data is String && data.isNotEmpty) {
      try {
        DateTime dateTime = DateTime.parse(data);
        return '${dateTime.day.toString().padLeft(2, '0')}/${dateTime.month.toString().padLeft(2, '0')}/${dateTime.year} ${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
      } catch (e) {
        return 'N/A';
      }
    } else {
      return 'N/A';
    }
  }

  // Função para verificar se é urgente
  String verificarUrgente(dynamic urgente) {
    if (urgente != null && (urgente == true || urgente.toString().toLowerCase() == 'true')) {
      return 'SIM';
    } else {
      return 'NÃO';
    }
  }

  // Função para verificar e retornar um valor ou "N/A"
  String verificarValor(dynamic valor) {
    return valor != null ? valor.toString() : 'N/A';
  }

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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('ID: ', style: TextStyle(color: Color.fromRGBO(190, 155, 1, 1), fontSize: 12, fontWeight: FontWeight.w900)),
                    Text(id != null ? id.toString() : 'N/A', style: TextStyle(color: Color.fromRGBO(190, 155, 1, 1), fontSize: 12, fontWeight: FontWeight.w900)),
                  ],
                ),
                Container(
                  width: 40,
                  height: 40,
                  child: Image.asset(
                    'assets/icon-urgente.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildDetail('TITULO: ', verificarValor(titulo)),
                      _buildDetail('URGENTE: ', verificarUrgente(urgente)),
                      _buildDetail('TALHÃO: ', verificarValor(talhao)),
                      _buildDetail('PERIODO: ', verificarValor(periodo)),
                    ],
                  ),
                ),
                SizedBox(width: 20), // Espaço entre as colunas
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildDetail('DATA: ', formatarData(data)),
                      _buildDetail('DESCRIÇÃO: ', verificarValor(descricao)),
                      _buildDetail('PRODUÇÃO: ', verificarValor(producao)),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              width: constraints.maxWidth, // Matches parent width
              height: 40, // Altura do botão
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
                    style: TextStyle(color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.w700), // Estilo do texto do botão
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
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: TextStyle(color: Color.fromRGBO(61, 190, 1, 1), fontSize: 12, fontWeight: FontWeight.w900),
      ),
      SizedBox(height: 4), // Espaço entre o rótulo e o valor
      Text(
        value,
        style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w400),
      ),
      SizedBox(height: 8), // Espaço entre os detalhes
    ],
  );
}

}
