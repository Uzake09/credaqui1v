import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled2/src/models/produto.dart';

class GetNotasFiscaisServicies {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;


  Stream<List<ItensModel>> consultarNotas() {
    try {
      final Stream<QuerySnapshot> notaDocument = _firebaseFirestore
          .collection('mercadoria')
          .doc('token'.toString().trim())
          .collection('itens')
          .snapshots();

      Stream<List<ItensModel>> notasStream = notaDocument.map((querySnapshot) {
        List<ItensModel> notas = [];
        if (querySnapshot.docs.isNotEmpty) {
          for (QueryDocumentSnapshot document in querySnapshot.docs) {
            Map<String, dynamic> data = document.data() as Map<String, dynamic>;
            ItensModel nota = ItensModel(
              id: document.id,
              nome: data['nome'],
              mercadoria: data['mercadoria'],
              indereco: data['indereco'],
              data: data['data'],
              numero: data['numero'],
              valor: data['valor'],
             
            );
            notas.add(nota);
          }
        }
        return notas;
      });

      return notasStream;
    } catch (e) {
      log('Erro ao consultar os dados: $e');
      return Stream.value([]);
    }
  }

  Future<String> addNotasToken({
    required String nome,
    required String mercadoria,
    required String indereco,
    required String numero,
    required String valor,
    required String data,
   
  }) async {
    try {
      await _firebaseFirestore
          .collection('mercadoria')
          .doc('token'.toString().trim())
          .collection('itens')
          .add({
        'nome': nome,
        'mercadoria': mercadoria,
        'indereco': indereco,
        'numero': numero,
        'valor': valor,
        'data': data,
        
      });
    } catch (e) {
      log('Erro ao adicionar documentos: $e');
      return 'Erro ao adicionar documentos: $e';
    }

    return 'sucesso';
  }

  Future<void> consultarNotasPorToken(String token) async {
    try {
      QuerySnapshot notasSnapshot = await _firebaseFirestore
          .collectionGroup('itens')
          .where('token', isEqualTo: 'token')
          .get();

      for (QueryDocumentSnapshot notaDocument in notasSnapshot.docs) {
        Map<String, dynamic> data = notaDocument.data() as Map<String, dynamic>;
        log('Dados do documento "nota": $data');
      }
    } catch (e) {
      log('Erro ao consultar os dados: $e');
    }
  }

 
}