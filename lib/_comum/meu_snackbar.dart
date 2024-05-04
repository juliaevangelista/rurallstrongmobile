import 'package:flutter/material.dart';

mostrarSnackBar({required BuildContext context, required String texto, bool isErro = true}){
  SnackBar snackBar = SnackBar(
    content: Text(texto),
    backgroundColor: (isErro)? Colors.red: Colors.green,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
    );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}