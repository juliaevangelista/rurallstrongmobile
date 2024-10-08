import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rurallstrong/controllers/geolocalizacao_controller.dart';
import 'package:rurallstrong/servicos/autenticao_servico.dart';
import 'package:rurallstrong/telas/inicio_tela.dart';
import 'package:rurallstrong/telas/telateste.dart';
import 'package:provider/provider.dart';

class DoencasTela extends StatefulWidget {
  const DoencasTela({Key? key}) : super(key: key);

  @override
  State<DoencasTela> createState() => _DoencasTelaState();
}

class _DoencasTelaState extends State<DoencasTela> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _especieController = TextEditingController();
  TextEditingController _estagioController = TextEditingController();

  String localizacao = '';
  String imageUrl = '';
  File? _selectedImage;

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
                    width: 65,
                    height: 65,
                    margin: EdgeInsets.fromLTRB(20, 15, 10, 7),
                    child: Image.asset(
                      'assets/icon-doencas-verde.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 15),
                    child: ElevatedButton(
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
                          'MONITORAR',
                          style: TextStyle(fontSize: 20),
                        )),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              height: 100,
              width: 400,
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'NOME:',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        'MILHO 14H BAYER',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 45,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'FAZENDA:',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        'FAZENDA PRIMAVERA',
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
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Geolocalizador(context),
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
                              'ESPÉCIE',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: TextFormField(
                                controller: _especieController,
                                decoration: InputDecoration(
                                  labelText: 'PERCEVEJOS',
                                  labelStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                  filled: true,
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color.fromRGBO(61, 190, 1, 1),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(
                                        8.0)), // Cor da borda quando o campo não está focado
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
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
                              'ESTÁGIO',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: TextFormField(
                                controller: _estagioController,
                                decoration: InputDecoration(
                                  labelText: 'OVOS',
                                  labelStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                  filled: true,
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color.fromRGBO(61, 190, 1, 1),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(
                                        8.0)), // Cor da borda quando o campo não está focado
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 7.0),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Container(
                              width: 165,
                              height: 60,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  foregroundColor:
                                      Color.fromRGBO(61, 190, 1, 1),
                                  backgroundColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                ),
                                onPressed: () async {
                                  try {
                                    final ImagePicker imagePicker =
                                        ImagePicker();
                                    XFile? file = await imagePicker.pickImage(
                                        source: ImageSource.camera);
                                    if (file == null) return;
                                    String uniqueFileName = DateTime.now()
                                        .millisecondsSinceEpoch
                                        .toString();
                                    Reference referenceRoot =
                                        FirebaseStorage.instance.ref();
                                    Reference referenceDirImages =
                                        referenceRoot.child('images');
                                    Reference referenceImageToUpload =
                                        referenceDirImages
                                            .child(uniqueFileName);
                                    await referenceImageToUpload
                                        .putFile(File(file.path));
                                    imageUrl = await referenceImageToUpload
                                        .getDownloadURL();
                                    print('URL da imagem: $imageUrl');
                                  } catch (error) {
                                    // Manipula erros
                                    print(
                                        'Erro ao enviar a imagem para o Firebase Storage: $error');
                                  }
                                },
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
                            ),
                            _selectedImage != null
                                  ? Container(
                                      width: 100,
                                      height: 100,
                                      margin:
                                          EdgeInsets.fromLTRB(20, 15, 20, 10),
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: FileImage(_selectedImage!),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    )
                                  : Container(
                                      width: 100,
                                      height: 100,
                                      margin:
                                          EdgeInsets.fromLTRB(20, 15, 20, 10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.grey[300],
                                      ),
                                      child: Icon(Icons.image,
                                          size: 50, color: Colors.grey),
                                    ),
                          ],
                        )))
              ],
            ),
            Container(
              //margin: EdgeInsets.only(top: 20),
              child: ElevatedButton(
                  onPressed: () async {
                  if (imageUrl.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please upload an image')));

                    return;
                  }
                  if (_formKey.currentState!.validate()) {
                    String localizacaoAtual = await _obterLocalizacao();
                    String? userId = await AutenticaoServico().obterId();
                    if (userId != null) {
                      Map<String, dynamic> data = {
                        'especie': _especieController.text,
                      'estagio': _estagioController.text,
                      'localizacao': localizacaoAtual,
                      'imageUrl': imageUrl
                        // Adicione outros campos conforme necessário
                      };
                      FirebaseFirestore.instance
                          .collection('users/$userId/dados_monitoramento_doencas')
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
                  "ENVIAR",
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
    _especieController.clear();
    _estagioController.clear();
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
