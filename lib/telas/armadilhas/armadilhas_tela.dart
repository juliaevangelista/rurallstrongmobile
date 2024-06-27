import 'package:flutter/material.dart';
import 'package:rurallstrong/repositories/talhao.dart';
import 'package:rurallstrong/telas/armadilhas/form_armadilha_tela.dart';
import 'package:rurallstrong/telas/telateste.dart';
import 'package:rurallstrong/controllers/geolocalizacao_controller.dart';
import 'package:provider/provider.dart';

class ArmadilhaTela extends StatefulWidget {
  const ArmadilhaTela({Key? key}) : super(key: key);

  @override
  State<ArmadilhaTela> createState() => _ArmadilhaTelaState();
}

class _ArmadilhaTelaState extends State<ArmadilhaTela> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<String> nomesTalhoes = [];
  String _selectedTalhao = '';
  TextEditingController _nometalhaoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _carregarNomesTalhoes();
  }

  Future<void> _carregarNomesTalhoes() async {
    try {
      List<String> nomes = await talhoes();
      setState(() {
        nomesTalhoes = nomes;
      });
    } catch (error) {
      print('Erro ao carregar nomes das Talhoes: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            SizedBox(height: 20),
            _buildForm(),
            SizedBox(height: 25),
            _buildInfoContainer(),
            SizedBox(height: 25),
            _buildInfoContainer(),
            SizedBox(height: 25),
            _buildCreateButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
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
              'assets/APLICATIVO-16.png',
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(width: 80),
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
              'ARMADILHAS',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'TALHÃO',
              style: TextStyle(color: Colors.black, fontSize: 13),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: DropdownButtonFormField<String>(
                value: _selectedTalhao.isNotEmpty ? _selectedTalhao : null,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedTalhao = newValue!;
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
                items: nomesTalhoes
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                      child: Text(
                        value,
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoContainer() {
    return Container(
      width: 350,
      height: 130,
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
                padding: EdgeInsets.only(top: 5),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildInfoColumn('CÓDIGO', '099'),
                    SizedBox(width: 130),
                    _buildInfoColumn('TALHÃO', 'TALHÃO 09'),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          _buildLocationInfo(),
        ],
      ),
    );
  }

  Widget _buildInfoColumn(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(color: Color.fromRGBO(61, 190, 1, 1), fontSize: 11),
        ),
        Text(
          value,
          style: TextStyle(
            color: Color.fromRGBO(61, 190, 1, 1),
            fontSize: 15,
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    );
  }

  Widget _buildLocationInfo() {
    return Container(
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
              String mensagem =
                  local.erro == '' ? '${local.lat}, ${local.long}' : local.erro;
              return Center(
                child: Text(
                  mensagem,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildCreateButton() {
    return Container(
      margin: EdgeInsets.zero,
      width: 180,
      height: 80,
      decoration: BoxDecoration(
        color: Color.fromRGBO(0, 0, 0, 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MonitorarTela()),
          );
        },
        child: Row(
          children: [
            Image.asset(
              'assets/icon-armadilhas.png',
              width: 75.0,
              height: 75.0,
            ),
            Text(
              'CRIAR',
              style: TextStyle(
                color: Color.fromRGBO(61, 190, 1, 1),
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
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
