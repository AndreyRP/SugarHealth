import 'package:flutter/material.dart';

class MenuRetratio extends StatelessWidget {
   const MenuRetratio({super.key});

  void _navegarPara(BuildContext context, String rota) {
    Navigator.pop(context);
    Navigator.pushNamed(context, rota);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [

          // --- Cabecalho Menu ---
          DrawerHeader(
            decoration: BoxDecoration(color: Color(0xffB4EAE1)),
            child: Text(
              'Sugar Health',
              style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),

          ListTile(
            leading:  Icon(Icons.home),
            title:  Text('Início'),
            onTap: () => _navegarPara(context, '/home'),
          ),
          ListTile(
            leading:  Icon(Icons.fitness_center),
            title:  Text('Treino'),
            onTap: () => _navegarPara(context, '/exercicios'),
          ),
          ListTile(
            leading:  Icon(Icons.restaurant),
            title:  Text('Dieta'),
            onTap: () => _navegarPara(context, '/dieta'),
          ),
          ListTile(
            leading:  Icon(Icons.analytics),
            title:  Text('Avaliação'),
            onTap: () => _navegarPara(context, '/avaliacaoMedidas'),
          ),
          ListTile(
            leading:  Icon(Icons.calendar_month),
            title:  Text('Frequencia'),
            onTap: () => _navegarPara(context, '/exercicios'),
          ),
          ListTile(
            leading:  Icon(Icons.messenger),
            title:  Text('Chat'),
            onTap: () => _navegarPara(context, '/dieta'),
          ),
          ListTile(
            leading:  Icon(Icons.supervised_user_circle),
            title:  Text('Perfil'),
            onTap: () => _navegarPara(context, '/avaliacaoMedidas'),
          ),
          ListTile(
            leading:  Icon(Icons.engineering),
            title:  Text('Configuração'),
            onTap: () => _navegarPara(context, '/avaliacaoMedidas'),
          ),

           Divider(),
          ListTile(
            leading:  Icon(Icons.exit_to_app),
            title:  Text('Sair'),
            onTap: () => _navegarPara(context, '/login'),
          ),
        ],
      ),
    );
  }
}