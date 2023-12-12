import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:untitled2/src/create_accont/create_accont_conttoler.dart';

class CreateAccountView extends StatelessWidget {
  const CreateAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CreateAccountController(),
      child: Consumer<CreateAccountController>(
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Nome',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    TextField(
                      controller: provider.newNome,
                      decoration: InputDecoration(
                        hintText: 'Insira seu nome',
                        hintStyle: const TextStyle(
                          color: Color(0xffADADAD),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: provider.newNomeHasError == true
                                ? Colors.red
                                : const Color(0xffF9A826),
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: provider.newNomeHasError,
                      child: Column(
                        children: [
                          const SizedBox(height: 8),
                          Visibility(
                            visible: provider.newNome.text.isNotEmpty,
                            replacement: const Text(
                              'Nome vazio',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 16,
                              ),
                            ),
                            child: const Text(
                              'Nome invalido',
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
                      visible: !provider.newNomeHasError,
                      child: const SizedBox(height: 16),
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
                      controller: provider.newEmail,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: 'Insira seu e-mail',
                        hintStyle: const TextStyle(
                          color: Color(0xffADADAD),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: provider.newEmailHasError == true
                                ? Colors.red
                                : const Color(0xffF9A826),
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: provider.newEmailHasError,
                      child: Column(
                        children: [
                          const SizedBox(height: 8),
                          Visibility(
                            visible: provider.newEmail.text.isNotEmpty,
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
                      visible: !provider.newEmailHasError,
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
                      controller: provider.newSenha,
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
                            color: provider.newSenhaHasError == true
                                ? Colors.red
                                : const Color(0xffF9A826),
                          ),
                        ),
                      ),
                      obscureText: provider.isObscureText,
                    ),
                    Visibility(
                      visible: provider.newSenhaHasError,
                      child: Column(
                        children: [
                          const SizedBox(height: 8),
                          Visibility(
                            visible: provider.newSenha.text.isNotEmpty,
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
                    const SizedBox(height: 16),
                    const Text(
                      'Confirme sua senha',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    TextField(
                      controller: provider.confirmSenha,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          color: const Color(0xffF9A826),
                          icon: Icon(!provider.isObscureTextConfirmSenha
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            provider.changeIsObscureTextConfirmSenhaHasError();
                          },
                        ),
                        hintText: 'Insira sua senha novamente',
                        hintStyle: const TextStyle(
                          color: Color(0xffADADAD),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: provider.confirmSenhaHasError == true
                                ? Colors.red
                                : const Color(0xffF9A826),
                          ),
                        ),
                      ),
                      obscureText: provider.isObscureTextConfirmSenha,
                    ),
                    Visibility(
                      visible: provider.confirmSenhaHasError,
                      child: Column(
                        children: [
                          const SizedBox(height: 8),
                          Visibility(
                            visible: provider.confirmSenha.text.isNotEmpty,
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
                        await provider.checkNewAccont(context);
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Color(0xffF9A826),
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                        height: 50,
                        child: const Center(
                          child: Text(
                            'Salvar',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
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
