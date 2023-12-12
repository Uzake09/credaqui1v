import 'package:flutter/material.dart';
import 'package:untitled2/src/home/vedas_feitas/vendas_controller.dart';
import 'package:untitled2/src/models/produto.dart';

class ListNotassWidget extends StatefulWidget {
  const ListNotassWidget({
    super.key,
    required this.controller,
  });

  final NotasController controller;

  @override
  State<ListNotassWidget> createState() => _ListNotassWidgetState();
}

class _ListNotassWidgetState extends State<ListNotassWidget> {
  @override
  Widget build(BuildContext context) {
    List<ItensModel> notas = widget.controller.filteredNotas;

    return
        notas.isEmpty
            ? const Center(
                child: Column(
                children: [
                  SizedBox(height: 20),
                  Center(
                    child: Text(
                      'Nenhum item encontrado.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ))
            :
        ListView.builder(
      itemCount: notas.length,

      itemBuilder: (BuildContext context, int index) {
        return  Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(height: 1),
            const SizedBox(height: 10),
            Text(
              notas[index].nome,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              notas[index].mercadoria,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
            Text(
              notas[index].indereco,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
            Text(
              notas[index].numero,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 10),
            const Divider(height: 1),
          ],
        );
      },
    );
  }
}
