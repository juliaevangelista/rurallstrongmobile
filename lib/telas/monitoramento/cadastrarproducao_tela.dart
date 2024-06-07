// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:rurallstrong/repositories/fazendas.dart';
import 'package:rurallstrong/repositories/talhao.dart';
import 'package:rurallstrong/telas/telateste.dart';
import 'package:rurallstrong/repositories/cultivo.dart';
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
      FirebaseDatabase.instance.ref().child('Producoes');
  List<String> nomesCultivos = [];
  List<String> nomesFazendas = [];
  List<String> nomesTalhoes = [];
  String _selectedCultivo = ''; // Valor inicial do dropdown
  String _selectedFazenda = ''; // Valor inicial do dropdown
  String _selectedTalhao = '';
  @override
  void initState() {
    super.initState();
    _carregarNomesCultivos();
    _carregarNomesFazendas();
    _carregarNomesTalhoes();
  }

  Future<void> _carregarNomesCultivos() async {
    try {
      List<String> nomes = await cultivo();
      setState(() {
        nomesCultivos = nomes;
      });
    } catch (error) {
      print('Erro ao carregar nomes de cultivos: $error');
    }
  }

  Future<void> _carregarNomesFazendas() async {
    try {
      List<String> nomes = await fazenda();
      setState(() {
        nomesFazendas = nomes;
      });
    } catch (error) {
      print('Erro ao carregar nomes das Fazendas: $error');
    }
  }

  Future<void> _carregarNomesTalhoes() async {
    try {
      List<String> nomes = await talhoes();
      setState(() {
        nomesTalhoes = nomes;
      });
    } catch (error) {
      print('Erro ao carregar nomes das Fazendas: $error');
    }
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
              height: 640,
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
                                margin: EdgeInsets.only(top: 5),
                                child: DropdownButtonFormField<String>(
                                  value:
                                      _cultivoProducaoController.text.isNotEmpty
                                          ? _cultivoProducaoController.text
                                          : null,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      _selectedCultivo = newValue!;
                                      _cultivoProducaoController.text =
                                          newValue;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromRGBO(61, 190, 1, 1),
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  icon: ImageIcon(
                                    AssetImage('assets/icon-button.png'),
                                    color: Colors.black,
                                  ),
                                  items: [
                                    DropdownMenuItem<String>(
                                      value:
                                          null, // Valor nulo para o item vazio
                                      child: Container(
                                        //alignment: Alignment.center,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 0),
                                        child: Text(
                                          'MILHO',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    ...nomesCultivos
                                        .where((nome) => nome.isNotEmpty)
                                        .map<DropdownMenuItem<String>>(
                                      (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Container(
                                            //alignment: Alignment.center,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 0),
                                            child: Text(
                                              value,
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
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
                                    /* suffixIcon: ImageIcon(
                                      AssetImage(
                                          'assets/icon-button.png'), // Aqui você pode substituir pelo ícone desejado
                                      color: Colors.black,
                                    ), */
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
                                child: SingleChildScrollView(
                                  child: DropdownButtonFormField<String>(
                                    value: _fazendaController.text.isNotEmpty
                                        ? _fazendaController.text
                                        : null,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        _selectedFazenda = newValue!;
                                        _fazendaController.text = newValue;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color.fromRGBO(61, 190, 1, 1),
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                    /* icon: ImageIcon(
                                      AssetImage(
                                          'assets/icon-button.png'), // Substitua pelo ícone desejado
                                      color: Colors.black,
                                    ), */
                                    items: [
                                      DropdownMenuItem<String>(
                                        value:
                                            null, // Valor nulo para o item vazio
                                        child: Container(
                                          //alignment: Alignment.center,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 0),
                                          child: Text(
                                            'PRIMAVERA',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      ...nomesFazendas
                                          .where((nome) => nome.isNotEmpty)
                                          .map<DropdownMenuItem<String>>(
                                        (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Container(
                                              //alignment: Alignment.center,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 0),
                                              child: Text(
                                                value,
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
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
                                child: DropdownButtonFormField<String>(
                                  value: _nometalhaoController.text.isNotEmpty
                                      ? _nometalhaoController.text
                                      : null,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      _selectedTalhao = newValue!;
                                      _nometalhaoController.text = newValue;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromRGBO(61, 190, 1, 1),
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  /* icon: ImageIcon(
                                    AssetImage(
                                        'assets/icon-button.png'), // Aqui você pode substituir pelo ícone desejado
                                    color: Colors.black,
                                  ), */
                                  items: [
                                    DropdownMenuItem<String>(
                                      value:
                                          null, // Valor nulo para o item vazio
                                      child: Container(
                                        //alignment: Alignment.center,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 0),
                                        child: Text(
                                          'TALHÃO 09',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    ...nomesTalhoes
                                        .where((nome) => nome.isNotEmpty)
                                        .map<DropdownMenuItem<String>>(
                                      (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Container(
                                            //alignment: Alignment.center,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 0),
                                            child: Text(
                                              value,
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
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

  void salvarDadosProducao() async {
    if (_formKey.currentState!.validate()) {
      String? idFazenda = await getIdFazendaPorNome(_fazendaController.text);
      String? idTalhao = await getIdTalhaoPorNome(_nometalhaoController.text);

      if (idFazenda != null) {
        Map<String, dynamic> data = {
          'cultivar': _cultivoProducaoController.text,
          'name': _nomeProducaoController.text,
          'size': _hectaresController.text,
          'nomeFazenda': _fazendaController.text,
          'idFazenda': idFazenda,
          'nometalhao': _nometalhaoController.text,
          'talhao': idTalhao,
          'dataInicial': _dataInicial.toString(),
          'prevista': _dataFinal.toString(),
          // Adicione outros campos conforme necessário
        };

        // Salvando os dados no Realtime Database sem usar o userId como chave
        _producaoRef.push().set(data).then((_) {
          _limparCampos();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Dados enviados com sucesso!'),
          ));
        }).catchError((error) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Erro ao enviar os dados: $error'),
          ));
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Fazenda não encontrada.'),
        ));
      }
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
