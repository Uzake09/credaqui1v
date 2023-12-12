import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/src/home/vendas/vendas_controller.dart';
import 'package:untitled2/src/widgets/button_widget.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
 

  bool isVisibility = false;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddController>(
      create: (_) => AddController(),
      child: Consumer<AddController>(
        builder: (_, provider, __) => SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              iconTheme: const IconThemeData(
                color: Colors.black,
              ),
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  TextField(
                    controller: provider.nomeCompleto,
                    decoration: InputDecoration(
                      hintText: 'Nome completo',
                      hintStyle: const TextStyle(
                        color: Color(0xffADADAD),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: provider.nameInvoiceIsValid == false
                              ? Colors.red
                              : const Color(0xffF9A826),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: provider.nameInvoiceIsValid == true,
                    replacement: const Column(
                      children: [
                        SizedBox(height: 8),
                        Text(
                          '\tCampo Invalido',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                        SizedBox(height: 8),
                      ],
                    ),
                    child: const SizedBox(height: 16),
                  ),
                  TextField(
                    keyboardType: TextInputType.text,
                    controller: provider.mercadoria,
                    decoration: InputDecoration(
                      hintText: 'Mercadoria',
                      hintStyle: const TextStyle(
                        color: Color(0xffADADAD),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: provider.dateWorkIsValid == false
                              ? Colors.red
                              : const Color(0xffF9A826),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: provider.dateWorkIsValid == true,
                    replacement: const Column(
                      children: [
                        SizedBox(height: 8),
                        Text(
                          '\tCampo Invalido',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                        SizedBox(height: 8),
                      ],
                    ),
                    child: const SizedBox(height: 16),
                  ),
                  TextField(
                    keyboardType: TextInputType.text,
                    controller: provider.indereco,
                    decoration: InputDecoration(
                      hintText: 'Indereço',
                      hintStyle: const TextStyle(
                        color: Color(0xffADADAD),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: provider.invoiceAmountIsValid == false
                              ? Colors.red
                              : const Color(0xffF9A826),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: provider.invoiceAmountIsValid == true,
                    replacement: const Column(
                      children: [
                        SizedBox(height: 8),
                        Text(
                          '\tCampo Invalido',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                        SizedBox(height: 8),
                      ],
                    ),
                    child: const SizedBox(height: 16),
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: provider.numero,
                    decoration: InputDecoration(
                      hintText: 'Numero',
                      hintStyle: const TextStyle(
                        color: Color(0xffADADAD),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: provider.descriptionIsValid == false
                              ? Colors.red
                              : const Color(0xffF9A826),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: provider.descriptionIsValid == true,
                    replacement: const Column(
                      children: [
                        SizedBox(height: 8),
                        Text(
                          '\tCampo Invalido',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                        SizedBox(height: 8),
                      ],
                    ),
                    child: const SizedBox(height: 16),
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: provider.valor,
                    decoration: InputDecoration(
                      hintText: 'Valor',
                      hintStyle: const TextStyle(
                        color: Color(0xffADADAD),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: provider.descriptionIsValid == false
                              ? Colors.red
                              : const Color(0xffF9A826),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: provider.descriptionIsValid == true,
                    replacement: const Column(
                      children: [
                        SizedBox(height: 8),
                        Text(
                          '\tCampo Invalido',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                        SizedBox(height: 8),
                      ],
                    ),
                    child: const SizedBox(height: 16),
                  ),
                  TextField(
                    keyboardType: TextInputType.datetime,
                    controller: provider.data,
                    decoration: InputDecoration(
                      hintText: 'Data',
                      hintStyle: const TextStyle(
                        color: Color(0xffADADAD),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: provider.descriptionIsValid == false
                              ? Colors.red
                              : const Color(0xffF9A826),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: provider.descriptionIsValid == true,
                    replacement: const Column(
                      children: [
                        SizedBox(height: 8),
                        Text(
                          '\tCampo Invalido',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                        SizedBox(height: 8),
                      ],
                    ),
                    child: const SizedBox(height: 16),
                  ),
                  ButtonWidget(
                    title: 'Salvar',
                    onTap: () async {
                      setState(() {
                        isVisibility = true;
                      });

                      // ignore: use_build_context_synchronously
                      await provider.checkSave(context);
                      setState(() {
                        isVisibility = false;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  Visibility(
                    visible: isVisibility,
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: Color(0xffF9A826),
                      ),
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
