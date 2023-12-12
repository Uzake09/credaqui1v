import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/cores/imagens/imagens.dart';
import 'package:untitled2/src/home/home_controller.dart';
import 'package:untitled2/src/home/vedas_feitas/vendas_feitas.dart';
import 'package:untitled2/src/home/vendas/vendas.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomePageController(),
      child: Consumer<HomePageController>(
        builder: (_, provider, __) => Scaffold(
          body: SafeArea(
            child: Visibility(
              visible: true, // !provider.isLoading,
              replacement: const Center(
                child: CircularProgressIndicator(),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 10,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 100,
                      child: Center(
                        child: Image.asset(AppImages.logo),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       
                        InkWell(
                          onTap: () {
                            log('f');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AddPage()),
                            );
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 160,
                                width: 160,
                                child: Image.asset(AppImages.carrinho),
                              ),
                              const Text(
                                'Realizar vendas',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),

                         InkWell(
                          onTap: () {
                            log('d');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const NotasPage()),
                            );
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 160,
                                width: 160,
                                child: Image.asset(AppImages.vendas),
                              ),
                              const Text(
                                'Vendas realizadas',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
