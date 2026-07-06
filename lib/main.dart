import 'package:flutter/material.dart';
import 'package:sugarhealth/pages/avaliacaoMedidas.dart';
import 'package:sugarhealth/pages/cadastro.dart';
import 'package:sugarhealth/pages/dieta.dart';
import 'package:sugarhealth/pages/exercicio.dart';
import 'package:sugarhealth/pages/frequencia_screen.dart';
import 'package:sugarhealth/pages/home.dart';
import 'package:sugarhealth/pages/login.dart';

final GlobalKey<ScaffoldMessengerState> snackbarKey = GlobalKey<ScaffoldMessengerState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        scaffoldMessengerKey: snackbarKey,
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(

          colorScheme: .fromSeed(seedColor: Colors.green),
        ),

        initialRoute: '/cadastro',

        routes: {
          '/login': (context) => Login(),
          '/cadastro': (context) => Cadastro(),
          '/home': (context) => Home(),
          '/avaliacaoMedidas': (context) => Avaliacao(),
          '/exercicios': (context) => TelaCategorias(),
          '/dieta': (context) => Dieta(),
          '/frequencia': (context) => FrequenciaScreen(),
        }
    );
  }
}

