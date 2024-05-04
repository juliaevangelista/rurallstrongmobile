import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class GeolocalizacaoController extends ChangeNotifier {
  double lat = 0.0;
  double long = 0.0;
  String erro = '';
  late bool _mounted;

  GeolocalizacaoController() {
    _mounted = true; // Definir como true quando o widget é criado
    getPosicao();
  }

  void getPosicao() async {
    try {
      Position posicao = await _posicaoAtual();
      lat = posicao.latitude;
      long = posicao.longitude;
    } catch (e) {
      erro = e.toString();
    }
    if (!_mounted) return; // Verificar se o widget ainda está montado antes de notificar os ouvintes
    notifyListeners();
  }

  @override
  void dispose() {
    _mounted = false; // Definir como false quando o widget é descartado
    super.dispose();
  }

  Future<Position> _posicaoAtual() async {
    LocationPermission permissao;
    bool ativado = await Geolocator.isLocationServiceEnabled();
    if (!ativado) {
      return Future.error('Por Favor, habilite a localização no smartphone');
    }

    permissao = await Geolocator.checkPermission();
    if (permissao == LocationPermission.denied) {
      permissao = await Geolocator.requestPermission();
      if (permissao == LocationPermission.denied) {
        return Future.error('Você precisa autorizar o acesso á localização');
      }
    }

    if (permissao == LocationPermission.deniedForever) {
      return Future.error('Você precisa autorizar o acesso á localização');
    }

    return await Geolocator.getCurrentPosition();
  }
}
