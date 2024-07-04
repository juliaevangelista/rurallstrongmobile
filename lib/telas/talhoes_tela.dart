import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:rurallstrong/controllers/geolocalizacao_controller.dart';
import 'package:rurallstrong/servicos/autenticao_servico.dart';
import 'package:rurallstrong/telas/inicio_tela.dart';
import 'package:rurallstrong/telas/telateste.dart';

class TalhoesTela extends StatefulWidget {
  const TalhoesTela({Key? key}) : super(key: key);

  @override
  State<TalhoesTela> createState() => _TalhoesTelaState();
}

class _TalhoesTelaState extends State<TalhoesTela> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nometalhaoController = TextEditingController();
  TextEditingController _hectaresController = TextEditingController();
  TextEditingController _fazendaController = TextEditingController();
  String localizacao = '';
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
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 80,
                      height: 80,
                      margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                      child: Image.asset(
                        'assets/Ico APP Rurall-13.png',
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
                            MaterialPageRoute(
                                builder: (context) => TelaTeste()),
                          );
                        },
                        child: Text(
                          'TALHÃO',
                          style: TextStyle(fontSize: 20),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 350,
                height: 460,
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
                    Geolocalizador(context),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      'OBS: Centralize no mapa a localização',
                      style: TextStyle(color: Colors.red, fontSize: 12),
                    ),
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
                                  'NOME',
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
                                          fontWeight: FontWeight.bold),
                                      filled: true,
                                      fillColor: Colors.white,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color:
                                                Color.fromRGBO(61, 190, 1, 1),
                                            width: 2.0),
                                        borderRadius: BorderRadius.circular(
                                            8.0), // Cor da borda quando o campo não está focado
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 10.0, horizontal: 7.0),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.never,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'TAMANHO HÉCTARES',
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
                                          fontWeight: FontWeight.bold),
                                      filled: true,
                                      fillColor: Colors.white,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color:
                                                Color.fromRGBO(61, 190, 1, 1),
                                            width: 2.0),
                                        borderRadius: BorderRadius.circular(
                                            8.0), // Cor da borda quando o campo não está focado
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 10.0, horizontal: 7.0),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.never,
                                    ),
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
                                      labelText: 'PRIMAVERA',
                                      labelStyle: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                      filled: true,
                                      fillColor: Colors.white,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color:
                                                Color.fromRGBO(61, 190, 1, 1),
                                            width: 2.0),
                                        borderRadius: BorderRadius.circular(
                                            8.0), // Cor da borda quando o campo não está focado
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 10.0, horizontal: 7.0),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.never,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            )))
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      String localizacaoAtual = await _obterLocalizacao();
                      String? userId = await AutenticaoServico().obterId();
                      if (userId != null) {
                        Map<String, dynamic> data = {
                          'nometalhao': _nometalhaoController.text,
                          'tamanhohectares': _hectaresController.text,
                          'fazenda': _fazendaController.text,
                          'localizacao': localizacaoAtual,
                          // Adicione outros campos conforme necessário
                        };
                        FirebaseFirestore.instance
                            .collection('users/$userId/dados_talhao')
                            .add(data)
                            .then((value) {
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
                    }
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
        ));
  }

  void _limparCampos() {
    _nometalhaoController.clear();
    _hectaresController.clear();
    _fazendaController.clear();
  }

  Future<String> _obterLocalizacao() async {
    // Obtenha a posição atual do dispositivo
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      // Formate os dados de localização como uma string
      return 'Latitude: ${position.latitude}, Longitude: ${position.longitude}';
    } catch (e) {
      print('Erro ao obter a localização: $e');
      return '';
    }
  }

  Widget Geolocalizador(BuildContext context) {
    return Container(
      width: 320,
      height: 70,
      decoration: BoxDecoration(
        color: Color.fromRGBO(61, 190, 1, 1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TelaTeste()),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/Ico APP Rurall-33.png',
              width: 55.0,
              height: 55.0,
            ),
            SizedBox(width: 8.0),
            ChangeNotifierProvider<GeolocalizacaoController>(
              create: (context) => GeolocalizacaoController(),
              child: Builder(builder: (context) {
                final local = context.watch<GeolocalizacaoController>();
                String mensagem = local.erro == ''
                    ? '${local.lat}, ${local.long}'
                    : local.erro;
                return Center(
                    child: Text(
                  mensagem,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w800,
                  ),
                ));
              }),
            ),
          ],
        ),
      ),
    );
  }
}
