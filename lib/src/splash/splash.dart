import 'package:flutter/material.dart';
import 'package:untitled2/cores/imagens/imagens.dart';
import 'package:untitled2/cores/routes/rotas.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacementNamed(Routes.loginPage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Image.asset(AppImages.logo),
        ),
      ),
    );
  }
}
