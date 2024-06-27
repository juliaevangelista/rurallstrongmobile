import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:rurallstrong/_comum/meu_snackbar.dart';
import 'package:rurallstrong/servicos/autenticao_servico.dart';
import 'package:rurallstrong/telas/telateste.dart';

class LoginTela extends StatefulWidget {
  const LoginTela({Key? key}) : super(key: key);

  @override
  State<LoginTela> createState() => _LoginTelaState();
}

class _LoginTelaState extends State<LoginTela> {
  bool queroEntrar = true;
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;

  TextEditingController _emailControler = TextEditingController();
  TextEditingController _senhaControler = TextEditingController();
  TextEditingController _cpfCnpjControler = TextEditingController();
  TextEditingController _nomeControler = TextEditingController();
  TextEditingController _celularControler = TextEditingController();

  AutenticaoServico _autenServico = AutenticaoServico();

  final maskFormatterCpf = MaskTextInputFormatter(
      mask: '###.###.###-##', filter: {"#": RegExp(r'[0-9]')});
  final maskFormatterCnpj = MaskTextInputFormatter(
      mask: '##.###.###/####-##', filter: {"#": RegExp(r'[0-9]')});
  final maskFormatterPhone = MaskTextInputFormatter(
      mask: '(##) #####-####', filter: {"#": RegExp(r'[0-9]')});

  bool isCpfSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 85, 0, 0),
              height: 150,
              alignment: Alignment.center,
              child: Container(
                child: Image.asset(
                  'assets/APLICATIVO-16.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 60),
              padding: const EdgeInsets.all(30),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
                      child: TextFormField(
                        controller: _emailControler,
                        decoration: InputDecoration(
                          label: Center(child: Text('E-mail')),
                          labelStyle: TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 7.0),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "O e-mail não pode ser vazio";
                          }
                          if (value.length < 5) {
                            return "O e-mail é muito curto";
                          }
                          if (!value.contains("@")) {
                            return "E-mail inválido";
                          }
                          return null;
                        },
                        style: const TextStyle(color: Colors.black),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Container(
                      margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
                      child: TextFormField(
                        controller: _senhaControler,
                        decoration: InputDecoration(
                          label: Center(child: Text('Senha')),
                          labelStyle: TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 7.0),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          suffixIcon: IconButton(
                            icon: Icon(_obscureText
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                          ),
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "A senha não pode ser vazia";
                          }
                          if (value.length < 8) {
                            return "A senha é muito curta";
                          }
                          return null;
                        },
                        style: const TextStyle(color: Colors.black),
                        obscureText: _obscureText,
                      ),
                    ),
                    Visibility(
                      visible: !queroEntrar,
                      child: Column(
                        children: [
                          SizedBox(height: 10,),
                          ToggleButtons(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: Text(
                                  "CPF",
                                  style: TextStyle(
                                    color: isCpfSelected
                                        ? Colors.white
                                        : Color.fromRGBO(61, 190, 1, 1),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: Text(
                                  "CNPJ",
                                  style: TextStyle(
                                    color: !isCpfSelected
                                        ? Colors.white
                                        : Color.fromRGBO(61, 190, 1, 1),
                                  ),
                                ),
                              ),
                            ],
                            isSelected: [isCpfSelected, !isCpfSelected],
                            onPressed: (int index) {
                              setState(() {
                                isCpfSelected = index == 0;
                                _cpfCnpjControler
                                    .clear(); // Clear the input field
                              });
                            },
                            borderRadius: BorderRadius.circular(8.0),
                            selectedColor: Colors.white,
                            fillColor: Color.fromRGBO(61, 190, 1, 1),
                            borderColor: Color.fromRGBO(61, 190, 1, 1),
                            selectedBorderColor: Color.fromRGBO(61, 190, 1, 1),
                            splashColor: Colors.greenAccent,
                            constraints: BoxConstraints(
                              minHeight: 30.0,
                              minWidth: 60.0,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(40, 16, 40, 0),
                            child: TextFormField(
                              controller: _cpfCnpjControler,
                              decoration: InputDecoration(
                                label: Center(child: Text('CPF/CNPJ')),
                                labelStyle: TextStyle(color: Colors.grey),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 7.0),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                              ),
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return "O CPF/CNPJ não pode ser vazio";
                                }
                                if (isCpfSelected && value.length != 14) {
                                  return "O CPF é inválido";
                                }
                                if (!isCpfSelected && value.length != 18) {
                                  return "O CNPJ é inválido";
                                }
                                return null;
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                isCpfSelected
                                    ? maskFormatterCpf
                                    : maskFormatterCnpj,
                              ],
                              keyboardType: TextInputType.number,
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                          SizedBox(height: 16.0),
                          Container(
                            margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
                            child: TextFormField(
                              controller: _nomeControler,
                              decoration: InputDecoration(
                                label: Center(child: Text('Nome')),
                                labelStyle: TextStyle(color: Colors.grey),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 7.0),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                              ),
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return "O nome não pode ser vazio";
                                }
                                if (value.length < 5) {
                                  return "O nome é muito curto";
                                }
                                return null;
                              },
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                          SizedBox(height: 16.0),
                          Container(
                            margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
                            child: TextFormField(
                              controller: _celularControler,
                              decoration: InputDecoration(
                                label: Center(child: Text('Celular')),
                                labelStyle: TextStyle(color: Colors.grey),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 7.0),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                              ),
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return "O Número do Whatsapp não pode ser vazio";
                                }
                                if (value.length != 11) {
                                  return "O Número do Whatsapp é inválido";
                                }
                                return null;
                              },
                              inputFormatters: [maskFormatterPhone],
                              keyboardType: TextInputType.phone,
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        botaoPrincipalClicado();
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Color.fromRGBO(61, 190, 1, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Text(
                        (queroEntrar) ? "ENTRAR" : "CADASTRAR",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.grey[400],
                        backgroundColor: Color.fromRGBO(61, 190, 1, 0),
                      ),
                      onPressed: () {
                        setState(() {
                          queroEntrar = !queroEntrar;
                        });
                      },
                      child: Text(
                        (queroEntrar)
                            ? "CRIAR MEU CADASTRO"
                            : "Já tem uma conta? Entre!",
                        style: TextStyle(
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            buildMapeChat(context),
          ],
        ),
      ),
    );
  }

  Widget buildMapeChat(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildCustomButtonMapeChat(
            'assets/icon-app.png',
            () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TelaTeste()),
              );
            },
          ),
          SizedBox(width: 70.0),
          _buildCustomButtonMapeChat(
            'assets/icon-chat.png',
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

  Widget _buildCustomButtonMapeChat(String imagePath, VoidCallback onPressed) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
      width: 80,
      height: 60,
      decoration: BoxDecoration(
        color: Color.fromRGBO(61, 190, 1, 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Row(
            children: [
              Image.asset(
                imagePath,
                width: 75.0,
                height: 75.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  botaoPrincipalClicado() {
    String email = _emailControler.text;
    String senha = _senhaControler.text;
    String cpfCnpj = _cpfCnpjControler.text;
    String nome = _nomeControler.text;
    String celular = _celularControler.text;
    if (_formKey.currentState!.validate()) {
      if (queroEntrar) {
        print("Entrada Validada");
        _autenServico
            .logarUsuarios(email: email, senha: senha)
            .then((String? erro) {
          if (erro != null) {
            mostrarSnackBar(context: context, texto: erro);
          }
        });
      } else {
        print("Cadastro Validado");
        _autenServico
            .cadastrarUsuario(
                email: email,
                senha: senha,
                cpf: cpfCnpj.length == 11 ? cpfCnpj : null,
                cnpj: cpfCnpj.length == 14 ? cpfCnpj : null,
                nome: nome,
                celular: celular)
            .then((String? erro) {
          if (erro != null) {
            mostrarSnackBar(context: context, texto: erro);
          }
        });
      }
    } else {
      print("Form Inválido");
    }
  }
}
