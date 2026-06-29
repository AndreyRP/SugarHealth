import 'package:flutter/material.dart';

Widget Cabecalho() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/logo.png',
          width: 45,
          height: 45,
        ),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 8.0),
            child: Row(
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
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),

                IconButton(
                  icon: const Icon(Icons.autorenew),
                  color: Colors.black,
                  iconSize: 28,
                  constraints: const BoxConstraints(),
                  padding: const EdgeInsets.only(left: 8.0),
                  onPressed: () {
                    print("Trocou a unidade de medida!");
                  },
                ),
              ],
            ),
          ),
        ),

        IconButton(
          icon: const Icon(Icons.chat_bubble_outline),
          color: Colors.black,
          iconSize: 28,
          onPressed: () {
            print("Abriu as mensagens!");
          },
        ),

        Image.asset(
          'assets/images/logo.png',
          width: 45,
          height: 45,
        ),
      ],
    ),
  );
}