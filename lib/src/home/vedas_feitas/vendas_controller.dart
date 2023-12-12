import 'package:flutter/material.dart';
import 'package:untitled2/services/get_itens.dart';
import 'package:untitled2/src/models/produto.dart';

class NotasController extends ChangeNotifier {

  final GetNotasFiscaisServicies _getNotasFiscaisServicies =
      GetNotasFiscaisServicies();


  bool _isLoading = true;
  bool get isLoading => _isLoading;

  final List<ItensModel> _notas = [];
  List<ItensModel> get notas => _notas;

  TextEditingController search = TextEditingController();

  List<ItensModel> filteredNotas = [];

  bool _disposed = false;

  NotasController() {
    inicia();
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  void inicia() {
    _getNotasFiscaisServicies.consultarNotas().listen((listaDeNotas) {
      if (_disposed) return;
      _notas.clear();
      _notas.addAll(listaDeNotas);
      filteredNotas = _notas;
      isLoadingFunc();
      notifyListeners();
    });
  }

  changeIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void searchNotas(String value) {
    final searchTerm = value.toLowerCase();
    if (searchTerm.isEmpty || searchTerm == '') {
      filteredNotas = _notas;
    } else {
      filteredNotas = _notas.where((nota) {
        return nota.nome.toLowerCase().contains(searchTerm);
      }).toList();
    }

    notifyListeners();
  }

  Future<void> isLoadingFunc() async {
    await Future.delayed(const Duration(seconds: 1));
    if (_disposed) return;
    await changeIsLoading(false);
  }
}
