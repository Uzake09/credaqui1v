import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/src/home/vedas_feitas/vendas_controller.dart';
import 'package:untitled2/src/widgets/lista_itens.dart';
import 'package:untitled2/src/widgets/textfild_widget.dart';

class NotasPage extends StatelessWidget {
  const NotasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NotasController>(
      create: (_) => NotasController(),
      child: Consumer<NotasController>(
        builder: (_, provider, __) => Scaffold(
          appBar: AppBar(
            title: const Text('Vendas Feitas'),
          ),
          body: Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 16,
              bottom: 0,
            ),
            child: Visibility(
              visible: !provider.isLoading,
              replacement: const Center(
                child: CircularProgressIndicator(),
              ),
              child: Column(
                children: [
                  TextFieldWidget(
                    textController: provider.search,
                    onChanged: (value) {
                      provider.searchNotas(value);
                    },
                  ),
                  const SizedBox(height: 6),
                  Expanded(
                    child: ListNotassWidget(
                      controller: provider,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
