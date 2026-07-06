import 'package:flutter/material.dart';

class Cabecalho extends StatefulWidget implements PreferredSizeWidget {
  const Cabecalho({super.key});

  @override
  State<Cabecalho> createState() => _CabecalhoState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CabecalhoState extends State<Cabecalho> {


  @override
  Widget build(BuildContext context) {

    return AppBar(
      backgroundColor: Colors.transparent,

      // --- lado esquerdo (logo) ---
      leading: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: GestureDetector(
          onTap: (){
            setState(() {
              Scaffold.of(context).openDrawer();
            });
          },
          child: Image.asset(
            'assets/images/logo.png',
            width: 45,
            height: 45,
          )
        ),
        ),
      leadingWidth: 60,

      // --- Titulos e troca rapida ---
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'SUGAR HEALTH',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Treinos Físicos',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.autorenew),
            color: Colors.black,
            iconSize: 24,
            onPressed: () {
              Navigator.pushNamed(context, '/avaliacaoMedidas');
            },
          ),
        ],
      ),

      // --- lado direito  (chat e conta)
      actions: [
        IconButton(
          icon: const Icon(Icons.chat_bubble_outline),
          color: Colors.black,
          iconSize: 26,
          onPressed: () {
          },
        ),

        Padding(
          padding: const EdgeInsets.only(right: 16.0, left: 8.0),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/home');
            },
            child: Image.asset(
              'assets/images/logo.png',
              width: 45,
              height: 45,
            ),
          ),
        ),
      ],
    );
  }

  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

}