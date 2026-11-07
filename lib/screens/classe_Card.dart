// Classe de cartão
// Um cartão Material Design:
// um painel com cantos ligeiramente arredondados e uma sombra de elevação.
// Um cartão é uma folha de material usada para representar informações relacionadas, como por exemplo, um álbum, uma localização geográfica, uma refeição, detalhes de contato, etc.
// Uma criação de um Widget de cartão que exibe informações do álbum e duas ações.
// Este exemplo mostra a criação de um widget de cartão que exibe informações do álbum e duas ações.

import 'package:flutter/material.dart';

void main() => runApp(const CardExampleApp());

class CardExample extends StatelessWidget {
  const CardExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Card')),
        body: const CardExample(),
      ),
    );
  }
}

class CardExampleApp extends StatelessWidget {
  const CardExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: .min,
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.album),
              title: Text('Aula de biblioteca Flutter.'),
              subtitle: Text('Para linguagem Dart.'),
            ),
            Row(
              mainAxisAlignment: .end,
              children: <Widget>[
                TextButton(
                  child: const Text('Pequeno texto curto.'),
                  onPressed: () {},
                ),
                const SizedBox(width: 8),
                TextButton(child: const Text('Salvar'), onPressed: () {}),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
