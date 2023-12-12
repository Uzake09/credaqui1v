import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/cores/imagens/imagens.dart';
import 'package:untitled2/cores/routes/rotas.dart';
import 'package:untitled2/src/login/login_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginController>(
      create: (_) => LoginController(),
      child: Consumer<LoginController>(
        builder: (_, provider, __) => SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: SizedBox(
                        height: 200,
                        child: Image.asset(AppImages.logo),
                      ),
                    ),
                    const Text(
                      'E-mail',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    TextField(
                      controller: provider.email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: 'Insira seu email',
                        hintStyle: const TextStyle(
                          color: Color(0xffADADAD),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: provider.emailHasError == true
                                ? Colors.red
                                : const Color(0xffF9A826),
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: provider.emailHasError,
                      child: Column(
                        children: [
                          const SizedBox(height: 8),
                          Visibility(
                            visible: provider.email.text.isNotEmpty,
                            replacement: const Text(
                              'E-mail vazio',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 16,
                              ),
                            ),
                            child: const Text(
                              'E-mail invalido',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: !provider.emailHasError,
                      child: const SizedBox(height: 16),
                    ),
                    const Text(
                      'Senha',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    TextField(
                      controller: provider.senha,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            color: const Color(0xffF9A826),
                            !provider.isObscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            provider.changeIsObscureText();
                          },
                        ),
                        hintText: 'Insira sua Senha',
                        hintStyle: const TextStyle(
                          color: Color(0xffADADAD),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: provider.senhaHasError == true
                                ? Colors.red
                                : const Color(0xffF9A826),
                          ),
                        ),
                      ),
                      obscureText: provider.isObscureText,
                    ),
                    Visibility(
                      visible: provider.senhaHasError,
                      child: Column(
                        children: [
                          const SizedBox(height: 8),
                          Visibility(
                            visible: provider.senha.text.isNotEmpty,
                            replacement: const Text(
                              'Senha vazia',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 16,
                              ),
                            ),
                            child: const Text(
                              'Senha invalida',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 38),
                    InkWell(
                      onTap: () async {
                        await provider.checkLogin(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffF9A826),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 4,
                              offset: const Offset(
                                4,
                                8,
                              ),
                            ),
                          ],
                        ),
                        height: 50,
                        child: const Center(
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: InkWell(
                        onTap: () {
                          log('teste');
                          Navigator.of(context)
                              .pushNamed(Routes.createAccountPage);
                        },
                        child: const Text(
                          'Não tem uma conta? toque aqui para criar agora!',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
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
