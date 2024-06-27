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
            cabecalho(),
            SizedBox(height: 20),
            construirContainer('1202202', 'ASSUNTO 12/02/2024', '12/02/2024',
                'SIM', 'KSKSKSKSKKSKS', 'SIM', 'SOJA', 'MATUTINO'),
            rodape(),
          ],
        ),
      ),
    );
  }

  Widget cabecalho() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
      ),
      height: 120,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          logo('assets/APLICATIVO-17.png', 65),
          SizedBox(width: 20),
          logo('assets/icon-tarefas.png', 80),
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
            ),
          ),
        ],
      ),
    );
  }

  Widget logo(String caminho, double tamanho) {
    return Container(
      width: tamanho,
      height: tamanho,
      margin: EdgeInsets.fromLTRB(20, 15, 20, 7),
      child: Image.asset(
        caminho,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget construirContainer(
      String id,
      String titulo,
      String data,
      String urgente,
      String descricao,
      String talhao,
      String producao,
      String periodo) {
    return Container(
      width: 400,
      height: 500,
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color.fromRGBO(51, 51, 51, 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          linhaSuperior(id),
          SizedBox(height: 10),
          detalhesTarefa(
              titulo, data, urgente, descricao, talhao, producao, periodo),
          SizedBox(height: 15),
          campoTexto(),
          SizedBox(height: 15),
          dataAtual(),
          SizedBox(height: 15),
          botaoCamera(),
          SizedBox(height: 25),
          botaoAtualizar(),
        ],
      ),
    );
  }

  Widget linhaSuperior(String id) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            textoAmarelo('ID: '),
            textoAmarelo(id),
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
    );
  }

  Widget textoAmarelo(String texto) {
    return Text(
      texto,
      style: TextStyle(
        color: Color.fromRGBO(190, 155, 1, 1),
        fontSize: 13,
        fontWeight: FontWeight.w900,
      ),
    );
  }

  Widget textoVerde(String texto) {
    return Text(
      texto,
      style: TextStyle(
        color: Color.fromRGBO(61, 190, 1, 1),
        fontSize: 13,
        fontWeight: FontWeight.w900,
      ),
    );
  }

  Widget detalhesTarefa(String titulo, String data, String urgente,
      String descricao, String talhao, String producao, String periodo) {
    return Row(
      children: [
        colunaDetalhes(titulo, data, urgente, descricao),
        SizedBox(width: 20),
        colunaDetalhes(talhao, producao, periodo, ''),
      ],
    );
  }

  Widget colunaDetalhes(
      String primeiro, String segundo, String terceiro, String quarto) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        linhaDetalhe('TITULO: ', primeiro),
        SizedBox(height: 7),
        linhaDetalhe('DATA: ', segundo),
        SizedBox(height: 7),
        linhaDetalhe('URGENTE: ', terceiro),
        SizedBox(height: 7),
        if (quarto.isNotEmpty) linhaDetalhe('DESCRIÇÃO: ', quarto),
      ],
    );
  }

  Widget linhaDetalhe(String titulo, String valor) {
    return Row(
      children: [
        textoVerde(titulo),
        Text(
          valor,
          style: TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    );
  }

  Widget campoTexto() {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 10, right: 10),
      child: TextFormField(
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 19,
        ),
        decoration: InputDecoration(
          labelText: '',
          labelStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w900,
          ),
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
    );
  }

  Widget dataAtual() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
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
    );
  }

  Widget botaoCamera() {
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

  Widget botaoAtualizar() {
    return Container(
      width: 120,
      height: 45,
      decoration: BoxDecoration(
        color: Color.fromRGBO(61, 190, 1, 1),
        borderRadius: BorderRadius.circular(7),
      ),
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          mostrarDialogoAtualizacao();
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
    );
  }

  void mostrarDialogoAtualizacao() {
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
              botaoDialogo('AGUARDANDO', Colors.grey),
              SizedBox(height: 10),
              botaoDialogo('EM PROGRESSO', Colors.orange),
              SizedBox(height: 10),
              botaoDialogo('CONCLUIDO', Colors.green),
              SizedBox(height: 10),
              botaoDialogo('NÃO EXECUTADA', Colors.red),
              SizedBox(height: 10),
              botaoDialogo('SALVAR', Colors.blue),
            ],
          ),
        );
      },
    );
  }

  Widget botaoDialogo(String texto, Color cor) {
    return ElevatedButton(
      onPressed: () {
        // Implemente a lógica para cada opção aqui
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: cor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        fixedSize: Size(210, 50),
      ),
      child: Text(
        texto,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget rodape() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          logo('assets/APLICATIVO-16.png', 50),
          logo('assets/APLICATIVO-16.png', 50),
          logo('assets/APLICATIVO-16.png', 50),
        ],
      ),
    );
  }
}
