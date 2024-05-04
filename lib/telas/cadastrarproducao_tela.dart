import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:rurallstrong/servicos/autenticao_servico.dart';
import 'package:rurallstrong/telas/telateste.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';

class CadastrarProducaoTela extends StatefulWidget {
  const CadastrarProducaoTela({Key? key}) : super(key: key);

  @override
  State<CadastrarProducaoTela> createState() => _CadastrarProducaoTelaState();
}

class _CadastrarProducaoTelaState extends State<CadastrarProducaoTela> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _cultivoProducaoController = TextEditingController();
  TextEditingController _nomeProducaoController = TextEditingController();
  TextEditingController _hectaresController = TextEditingController();
  TextEditingController _fazendaController = TextEditingController();
  TextEditingController _nometalhaoController = TextEditingController();
  DateTime _dataInicial = DateTime.now();
  DateTime _dataFinal = DateTime.now();
  final DatabaseReference _producaoRef =
      FirebaseDatabase.instance.reference().child('producao');

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
              //padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
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
                    width: 65,
                    height: 65,
                    margin: EdgeInsets.fromLTRB(20, 15, 20, 7),
                    child: Image.asset(
                      'assets/icon-pragas-verde.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    width: 10,
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
                        'PRODUÇÃO',
                        style: TextStyle(fontSize: 19),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 350,
              height: 600,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Botao(context),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                      //margin: EdgeInsets.only(top: 60),
                      padding: const EdgeInsets.all(30),
                      child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'CULTIVO',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                child: TextFormField(
                                  controller: _cultivoProducaoController,
                                  decoration: InputDecoration(
                                    labelText: 'MILHO',
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromRGBO(61, 190, 1, 1),
                                          width: 2.0),
                                      borderRadius: BorderRadius.circular(
                                          8.0), // Cor da borda quando o campo não está focado
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 7.0),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                    suffixIcon: ImageIcon(
                                      AssetImage(
                                          'assets/icon-button.png'), // Aqui você pode substituir pelo ícone desejado
                                      color: Colors.black,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Campo obrigatório';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'NOME',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                child: TextFormField(
                                  controller: _nomeProducaoController,
                                  decoration: InputDecoration(
                                    labelText: 'MILHO 14H BAYER',
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromRGBO(61, 190, 1, 1),
                                          width: 2.0),
                                      borderRadius: BorderRadius.circular(
                                          8.0), // Cor da borda quando o campo não está focado
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 7.0),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Campo obrigatório';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'PLANTANDO HÉCTARES',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                child: TextFormField(
                                  controller: _hectaresController,
                                  decoration: InputDecoration(
                                    labelText: '125,5',
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromRGBO(61, 190, 1, 1),
                                          width: 2.0),
                                      borderRadius: BorderRadius.circular(
                                          8.0), // Cor da borda quando o campo não está focado
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 7.0),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                    suffixIcon: ImageIcon(
                                      AssetImage(
                                          'assets/icon-button.png'), // Aqui você pode substituir pelo ícone desejado
                                      color: Colors.black,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Campo obrigatório';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'FAZENDA',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                child: TextFormField(
                                  controller: _fazendaController,
                                  decoration: InputDecoration(
                                    labelText: 'FAZENDA PRIMAVERA',
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromRGBO(61, 190, 1, 1),
                                          width: 2.0),
                                      borderRadius: BorderRadius.circular(
                                          8.0), // Cor da borda quando o campo não está focado
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 7.0),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                    suffixIcon: ImageIcon(
                                      AssetImage(
                                          'assets/icon-button.png'), // Aqui você pode substituir pelo ícone desejado
                                      color: Colors.black,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Campo obrigatório';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'TALHÃO',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                child: TextFormField(
                                  controller: _nometalhaoController,
                                  decoration: InputDecoration(
                                    labelText: 'TALHÃO 09',
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromRGBO(61, 190, 1, 1),
                                          width: 2.0),
                                      borderRadius: BorderRadius.circular(
                                          8.0), // Cor da borda quando o campo não está focado
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 7.0),
                                    floatingLabelBehavior: FloatingLabelBehavior
                                        .never, // 'assets/icon-button.png'
                                    suffixIcon: ImageIcon(
                                      AssetImage(
                                          'assets/icon-button.png'), // Aqui você pode substituir pelo ícone desejado
                                      color: Colors.black,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Campo obrigatório';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          )))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: ElevatedButton(
                onPressed: () {
                  salvarDadosProducao();
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black, // Cor de fundo do botão
                  backgroundColor: Color.fromRGBO(61, 190, 1,
                      1), // Cor do texto do botão quando pressionado
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        10.0), // Borda arredondada do botão
                  ),
                ),
                child: Text(
                  "SALVAR",
                  style: TextStyle(
                    fontSize: 22.0, // Tamanho da fonte do texto
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _limparCampos() {
    _cultivoProducaoController.clear();
    _nomeProducaoController.clear();
    _hectaresController.clear();
    _fazendaController.clear();
    _nometalhaoController.clear();
  }

  Widget Botao(context) {
    return Container(
      width: 320,
      height: 75,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              _selecionarDataInicial();
            },
            child: Container(
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'DATA INICIAL',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.0,
                    ),
                  ),
                  Text(
                    '${_dataInicial.day.toString().padLeft(2, '0')}/${_dataInicial.month.toString().padLeft(2, '0')}/${_dataInicial.year}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 50),
          GestureDetector(
            onTap: () {
              _selecionarDataFinal();
            },
            child: Container(
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'DATA FINAL',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.0,
                    ),
                  ),
                  Text(
                    '${_dataFinal.day.toString().padLeft(2, '0')}/${_dataFinal.month.toString().padLeft(2, '0')}/${_dataFinal.year}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void salvarDadosProducao() {
    if (_formKey.currentState!.validate()) {
      // Aqui você pode chamar o método para obter o ID do usuário
      AutenticaoServico().obterId().then((userId) {
        if (userId != null) {
          Map<String, dynamic> data = {
            'cultivo': _cultivoProducaoController.text,
            'nomeproducao': _nomeProducaoController.text,
            'tamanhohectares': _hectaresController.text,
            'fazenda': _fazendaController.text,
            'nometalhao': _nometalhaoController.text,
            'datainicial': _dataInicial.toString(),
            'datafinal': _dataFinal.toString(),
            // Adicione outros campos conforme necessário
          };

          // Salvando os dados no Realtime Database
          _producaoRef.child(userId).push().set(data).then((_) {
            _limparCampos();
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Dados enviados com sucesso!'),
            ));
          }).catchError((error) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Erro ao enviar os dados: $error'),
            ));
          });
        }
      });
    }
  }

  void _selecionarDataInicial() {
    DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      minTime: DateTime(2020, 1, 1),
      maxTime: DateTime(2030, 12, 31),
      onChanged: (date) {},
      onConfirm: (date) {
        setState(() {
          _dataInicial = date;
        });
      },
      currentTime: _dataInicial,
    );
  }

  void _selecionarDataFinal() {
    DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      minTime: DateTime(2020, 1, 1),
      maxTime: DateTime(2030, 12, 31),
      onChanged: (date) {},
      onConfirm: (date) {
        setState(() {
          _dataFinal = date;
        });
      },
      currentTime: _dataFinal,
    );
  }
}
