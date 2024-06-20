import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rurallstrong/telas/armadilhas/armadilhas_tela.dart';
import 'package:rurallstrong/telas/config/configuracao_tela.dart';
import 'package:rurallstrong/telas/dados_tela.dart';
import 'package:rurallstrong/telas/monitoramento/producao_tela.dart';
import 'package:rurallstrong/telas/talhoes_tela.dart';
import 'package:rurallstrong/telas/tarefas/tarefas_tela.dart';
import 'package:rurallstrong/telas/telateste.dart';

class ButtonData {
  final String label;
  final String imagePath;
  final Widget destinationScreen;

  ButtonData(this.label, this.imagePath, this.destinationScreen);
}

class InicioTela extends StatelessWidget {
  final List<ButtonData> buttons = [
    ButtonData('TAREFAS', 'assets/icon-tarefas.png', TarefasTela()),
    ButtonData('MONITORAMENTO', 'assets/icon-monitoramento.png', ProducaoTela()),
    ButtonData('ARMADILHAS', 'assets/icon-armadilhas.png', ArmadilhaTela()),
    ButtonData('APLICAÇÕES', 'assets/icon-aplicacoes.png', TelaTeste()),
    ButtonData('ALERTAS', 'assets/icon-alertas.png', TelaTeste()),
    ButtonData('CICLOS', 'assets/icon-ciclos.png', TelaTeste()),
    ButtonData('TALHÕES', 'assets/icon-talhoes.png', TalhoesTela()),
    ButtonData('SUPORTE', 'assets/icon-suporte.png', TelaTeste()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            buildHeader(),
            buildGridView(context),
            buildDadosPonto(context),
            buildMonitoramento(),
            buildButtonConfig(context)
          ],
        ),
      ),
    );
  }

  Widget buildHeader() {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.fromLTRB(0.w, 25.0.h, 25.w, 0),
            height: 60.h,
            alignment: Alignment.center,
            child: Image.asset(
              'assets/Ico-APP-Rurall-15.png',
              fit: BoxFit.contain,
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(top: 25.0.h), 
            child: buildUserInfo()
          ),
        ),
      ],
    );
  }

  Widget buildUserInfo() {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nome de Usuário',
              style: TextStyle(
                color: Colors.white,
                fontSize: 11.sp,
              ),
            ),
            Text(
              '020101',
              style: TextStyle(
                color: Colors.white,
                fontSize: 11.sp,
              ),
            ),
            Text(
              'Fazenda Nova',
              style: TextStyle(
                color: Colors.white,
                fontSize: 11.sp,
              ),
            ),
          ],
        ),
        SizedBox(width: 7.w),
        buildUserAvatar(),
      ],
    );
  }

  Widget buildUserAvatar() {
    return Container(
      margin: EdgeInsets.fromLTRB(1.0.w, 10.0.h, 10.0.w, 10.0.h),
      width: 55.w,
      height: 55.h,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.r),
        child: Image.network(
          'https://s2-techtudo.glbimg.com/L9wb1xt7tjjL-Ocvos-Ju0tVmfc=/0x0:1200x800/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_08fbf48bc0524877943fe86e43087e7a/internal_photos/bs/2023/q/l/TIdfl2SA6J16XZAy56Mw/canvaai.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget buildGridView(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF333333),
        borderRadius: BorderRadius.circular(8.r),
      ),
      height: 240.0.h,
      margin: EdgeInsets.fromLTRB(10.w, 15.h, 10.w, 15.h),
      padding: EdgeInsets.zero,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
        itemCount: buttons.length,
        itemBuilder: (context, index) {
          return buildGridItem(context, index);
        },
      ),
    );
  }

  Widget buildGridItem(BuildContext context, int index) {
    return Card(
      elevation: 0.0,
      color: Color.fromARGB(0, 158, 158, 158),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => buttons[index].destinationScreen,
            ),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 62.w,
              height: 62.h,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Image.asset(
                buttons[index].imagePath,
                width: 40.0.w,
                height: 40.0.h,
              ),
            ),
            SizedBox(height: 8.0.h),
            Text(
              buttons[index].label,
              style: TextStyle(
                color: Colors.white,
                fontSize: 8.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDadosPonto(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildCustomButtonPontoDados(
            'assets/icon-dados.png',
            'DADOS',
            () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DadosTela()),
              );
            },
          ),
          SizedBox(width: 70.0.w),
          _buildCustomButtonPontoDados(
            'assets/icon-ponto.png',
            'PONTO',
            () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TelaTeste()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCustomButtonPontoDados(
      String imagePath, String text, VoidCallback onPressed) {
    return Container(
      width: 145.w,
      height: 50.h,
      decoration: BoxDecoration(
        color: Color.fromRGBO(61, 190, 1, 1),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: onPressed,
        child: Padding(
          padding: EdgeInsets.zero,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                imagePath,
                width: 55.0.w,
                height: 55.0.h,
              ),
              SizedBox(width: 8.0.w),
              Text(
                text,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0.sp,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMonitoramento() {
    return Container(
      margin: EdgeInsets.fromLTRB(5.w, 20.h, 5.w, 20.h),
      width: double.infinity,
      height: 300.h,
      decoration: BoxDecoration(
        color: Color.fromRGBO(51, 51, 51, 1),
      ),
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.5,
        ),
        children: [
          buildContainer(
              123.w,
              300.h,
              50.h,
              300.h,
              'MONITORAMENTO DE TALHÃO 2',
              'MATUTINO',
              'TESTE TESTE TESTE TESTE TESTE TESTE TESTE TESTE TESTE TESTE'),
          buildContainer(
              123.w,
              300.h,
              50.h,
              300.h,
              'MONITORAMENTO DE TALHÃO 2',
              'MATUTINO',
              'TESTE TESTE TESTE TESTE TESTE TESTE TESTE TESTE TESTE TESTE'),
          buildContainer(
              123.w,
              300.h,
              50.h,
              300.h,
              'MONITORAMENTO DE TALHÃO 2',
              'MATUTINO',
              'TESTE TESTE TESTE TESTE TESTE TESTE TESTE TESTE TESTE TESTE'),
        ],
      ),
    );
  }

  Widget buildContainer(
    double width,
    double height,
    double firstContainerHeight,
    double secondContainerHeight,
    String textGreen,
    String textTurn,
    String textWhite,
  ) {
    return Container(
      padding: EdgeInsets.fromLTRB(5.w, 0.h, 5.w, 0.h),
      width: width,
      height: height,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5.0.r),
                topRight: Radius.circular(5.0.r),
              ),
            ),
            child: Container(
              width: double.infinity,
              height: firstContainerHeight,
              decoration: BoxDecoration(
                color: Color.fromRGBO(61, 190, 1, 1),
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: Container(
                padding: EdgeInsets.all(4.w),
                child: Text(
                  textGreen,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              height: secondContainerHeight,
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 1),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(5.0.r),
                  bottomRight: Radius.circular(5.0.r),
                ),
              ),
              child: Container(
                padding: EdgeInsets.fromLTRB(8.w, 2.h, 8.w, 3.h),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        textTurn,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13.0.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      textWhite,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10.0.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildButtonConfig(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 120.w,
          height: 120.h,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ConfiguracaoTela()),
              );
            },
            child: Image.asset(
              'assets/config.jpg',
              fit: BoxFit.contain,
            ),
          ),
        )
      ],
    );
  }
}
