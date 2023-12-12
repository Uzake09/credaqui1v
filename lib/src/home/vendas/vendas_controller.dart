import 'package:flutter/material.dart';
import 'package:untitled2/services/get_itens.dart';

class AddController extends ChangeNotifier {
  final GetNotasFiscaisServicies _getNotasFiscaisServicies =
      GetNotasFiscaisServicies();

  TextEditingController nomeCompleto = TextEditingController();

  TextEditingController mercadoria = TextEditingController();

  TextEditingController indereco = TextEditingController();

  TextEditingController numero = TextEditingController();

    TextEditingController valor = TextEditingController();
       TextEditingController data = TextEditingController();

  final String _file = '';
  String get file => _file;

  bool _nameInvoiceIsValid = true;
  bool get nameInvoiceIsValid => _nameInvoiceIsValid;

  bool _dateWorkIsValid = true;
  bool get dateWorkIsValid => _dateWorkIsValid;

  bool _invoiceAmountIsValid = true;
  bool get invoiceAmountIsValid => _invoiceAmountIsValid;

  bool _descriptionIsValid = true;
  bool get descriptionIsValid => _descriptionIsValid;

  bool _fileIsValid = true;
  bool get fileIsValid => _fileIsValid;

  changeNameInvoiceIsValid(bool value) {
    _nameInvoiceIsValid = value;
    notifyListeners();
  }

  changeDateWorkIsValid(bool value) {
    _dateWorkIsValid = value;
    notifyListeners();
  }

  changeInvoiceAmountIsValid(bool value) {
    _invoiceAmountIsValid = value;
    notifyListeners();
  }

  changeDescriptionIsValid(bool value) {
    _descriptionIsValid = value;
    notifyListeners();
  }

  changeFileIsValid(bool value) {
    _fileIsValid = value;
    notifyListeners();
  }

  Future<void> checkValidate() async {
    if (nomeCompleto.text.isEmpty) {
      changeNameInvoiceIsValid(false);
    } else {
      changeNameInvoiceIsValid(true);
    }

    if (mercadoria.text.isEmpty) {
      changeDateWorkIsValid(false);
    } else {
     
      
     
        changeDateWorkIsValid(true);
      
      
      
    }

    if (indereco.text.isEmpty) {
      changeInvoiceAmountIsValid(false);
    } else {
      changeInvoiceAmountIsValid(true);
    }

    if (numero.text.isEmpty) {
      changeDescriptionIsValid(false);
    } else {
      changeDescriptionIsValid(true);
    }
  }

  Future<void> checkSave(BuildContext context) async {
    await checkValidate();
   _getNotasFiscaisServicies.consultarNotas();
    changeFileIsValid(true);
    if ((_nameInvoiceIsValid &&
                _dateWorkIsValid &&
                _invoiceAmountIsValid &&
                _descriptionIsValid) ==
            true
        ) {
      String getAddNotas = await _getNotasFiscaisServicies.addNotasToken(
        mercadoria: mercadoria.text.trim(),
        numero: numero.text,
        nome: nomeCompleto.text,
        indereco: indereco.text,
        data: data.text,
        valor:valor.text,
      
      );
      if (getAddNotas == 'sucesso') {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.green,
            content: Text('Adicionado com sucesso!'),
          ),
        );
        nomeCompleto.clear();
        mercadoria.clear();
        indereco.clear();
        numero.clear();
        valor.clear();
        data.clear();
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(getAddNotas),
          ),
        );
      }
    } 
  }
}
