import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rurallstrong/telas/inicio_tela.dart';
import 'package:rurallstrong/telas/tarefas/tarefas_tela.dart';
import 'package:rurallstrong/telas/telateste.dart';

class AtualizarTarefasTela extends StatefulWidget {
  const AtualizarTarefasTela({Key? key}) : super(key: key);

  @override
  _AtualizarTarefasTelaState createState() => _AtualizarTarefasTelaState();
}

class _AtualizarTarefasTelaState extends State<AtualizarTarefasTela> {
  bool tarefaConcluida = false;
  File? _selectedImage;
  String imageUrl = '';
  List<File> _images = []; // Lista para armazenar as imagens

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
          logo('assets/icon-tarefas.png', 80),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Color.fromRGBO(61, 190, 1, 1),
              backgroundColor: Color.fromRGBO(61, 190, 1, 0),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TarefasTela()),
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
      width: 165,
      height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Color.fromRGBO(61, 190, 1, 1),
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        onPressed: () async {
          try {
            final ImagePicker imagePicker = ImagePicker();
            XFile? file =
                await imagePicker.pickImage(source: ImageSource.camera);
            if (file == null) return;
            setState(() {
              _selectedImage = File(file.path);
              _images.add(File(file.path)); // Adicione a nova imagem à lista
            });
            String uniqueFileName =
                DateTime.now().millisecondsSinceEpoch.toString();
            Reference referenceRoot = FirebaseStorage.instance.ref();
            Reference referenceDirImages = referenceRoot.child('images');
            Reference referenceImageToUpload =
                referenceDirImages.child(uniqueFileName);
            await referenceImageToUpload.putFile(File(file.path));
            imageUrl = await referenceImageToUpload.getDownloadURL();
            print('URL da imagem: $imageUrl');
          } catch (error) {
            // Manipula erros
            print('Erro ao enviar a imagem para o Firebase Storage: $error');
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
        // Lógica para o botão de diálogo
        Navigator.of(context).pop(); // Fecha o diálogo
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Status atualizado com sucesso!'),
          ),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => TarefasTela()), // Redireciona para a tela de tarefas
        );
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
        if (_selectedImage != null)
          Container(
            width: 100,
            height: 100,
            margin: EdgeInsets.fromLTRB(20, 15, 20, 10),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: FileImage(_selectedImage!),
                fit: BoxFit.cover,
              ),
            ),
          )
        else
          Container(
            width: 100,
            height: 100,
            margin: EdgeInsets.fromLTRB(20, 15, 20, 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              
            ),
            child: Image.asset(
              'assets/APLICATIVO-16.png',
              fit: BoxFit.contain,
            ),
          ),
        ..._images.map((image) {
          return Container(
            width: 100,
            height: 100,
            margin: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: FileImage(image),
                fit: BoxFit.cover,
              ),
            ),
          );
        }).toList(),
      ],
    ),
  );
}

}
