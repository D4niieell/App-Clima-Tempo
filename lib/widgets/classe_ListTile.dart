// Classe ListTile
// Uma única linha de altura fixa que normalmente contém algum texto, bem como um ícone inicial ou final.
// Saiba mais sobre ListTile no canal do Flutter no YouTube .
// Um bloco de lista contém de uma a três linhas de texto, opcionalmente ladeadas por ícones ou outros widgets, como caixas de seleção. Os ícones (ou outros widgets) do bloco são definidos pelos parâmetros `leading` e `trailing` . A primeira linha de texto não é opcional e é especificada com `title` . O valor de `subtitle` , que é opcional, ocupará o espaço alocado para uma linha de texto adicional, ou duas linhas se `isThreeLine` for verdadeiro. Se `dense` for verdadeiro, a altura total deste bloco e o tamanho dos widgets `DefaultTextStyle` que envolvem o título e o subtítulo serão reduzidos.
// É responsabilidade de quem chama a função garantir que o título não seja quebrado em várias linhas e que a legenda não seja quebrada em várias linhas (se `isThreeLine` for falso) ou que ocupe duas linhas (se for verdadeiro).
// As alturas dos widgets inicial e final são limitadas de acordo com a especificação Material . Uma exceção é feita para ListTiles de uma linha para fins de acessibilidade. Veja o exemplo abaixo para entender como atender tanto à especificação Material quanto aos requisitos de acessibilidade.
// Os widgets inicial e final podem expandir-se horizontalmente o quanto quiserem, portanto, certifique-se de que estejam devidamente restringidos.
// Os blocos de lista são normalmente usados ​​em ListViews ou organizados em colunas em Drawer e Card .
// Este widget requer um widget Material ancestral na árvore para ser renderizado, o qual geralmente é fornecido pelo Scaffold do aplicativo . As cores `tileColor` , `selectedTileColor` , `focusColor` e `hoverColor` não são definidas pelo próprio ` ListTile` , mas sim pelo widget Material ancestral. Nesse caso, pode-se envolver o `ListTile` com um widget Material,
// por exemplo:

// Considerações sobre desempenho ao envolver ListTile com Material
// Envolver individualmente um grande número de ListTiles com Materials é dispendioso. Considere envolver apenas os ListTiles que realmente precisam ou inclua um Material ancestral comum, sempre que possível.

// O ListTile precisa estar dentro de um widget Material para que as cores tileColor , selectedTileColor , focusColor e hoverColor sejam animadas , pois essas cores não são desenhadas pelo próprio ListTile, mas sim pelo widget Material que o antecede.

// Este exemplo demonstra como o ListTile precisa ser envolvido em um widget Material para animar as cores.

// import 'dart:io';
import 'package:flutter/material.dart';

// import 'package:material_ui/material_ui.dart';

void main() => runApp(const ListTileApp());

class ListTileApp extends StatelessWidget {
  const ListTileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        listTileTheme: const ListTileThemeData(textColor: Colors.white),
      ),
      home: const ListTileExample(),
    );
  }
}

class ListTileExample extends StatefulWidget {
  const ListTileExample({super.key});

  // Considerações sobre desempenho ao envolver ListTile com Material
  // Envolver individualmente um grande número de ListTiles com Materials é dispendioso.
  // Considere envolver apenas os ListTiles que realmente precisam ou inclua um Material ancestral comum, sempre que possível.

  // O ListTile precisa estar dentro de um widget Material para que as cores tileColor , selectedTileColor , focusColor e hoverColor sejam animadas , pois essas cores não são desenhadas pelo próprio ListTile, mas sim pelo widget Material que o antecede.

  // Este exemplo demonstra como o ListTile precisa ser envolvido em um widget Material para animar as cores.

  @override
  State<ListTileExample> createState() => _ListTileExampleState();
}

class _ListTileExampleState extends State<ListTileExample>
    with TickerProviderStateMixin {
  late final AnimationController _fadeController;
  late final AnimationController _sizeController;
  late final Animation<double> _fadeAnimation;
  late final Animation<double> _sizeAnimation;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    _sizeController = AnimationController(
      duration: const Duration(milliseconds: 850),
      vsync: this,
    )..repeat(reverse: true);

    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    );

    _sizeAnimation = CurvedAnimation(
      parent: _sizeController,
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _sizeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ListTile, texto de exemplo.')),
      body: Column(
        mainAxisAlignment: .spaceEvenly,
        children: <Widget>[
          Hero(
            tag: 'ListTile-Hero',
            child: Material(
              child: ListTile(
                title: const Text('ListTile com Hero'),
                subtitle: const Text('Clique aqui para a transição de Herói'),
                tileColor: Colors.cyan[800],
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<Widget>(
                      builder: (BuildContext context) {
                        return Scaffold(
                          appBar: AppBar(
                            title: const Text(
                              'Texto de exemplo da função "GridView".',
                            ),
                          ),
                          body: GridView.count(
                            primary: false,
                            padding: const EdgeInsets.all(20),
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.all(8),
                                color: Colors.teal[100],
                                child: const Text(
                                  "Primeiro texto de exemplo, da função 'GridView'.",
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(8),
                                color: Colors.teal[200],
                                child: const Text(
                                  "Segundo texto de exemplo, da função 'GridView'.",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(8),
                                color: Colors.teal[300],
                                child: const Text(
                                  "Terceiro texto de exemplo, da função 'GridView'.",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
          FadeTransition(
            opacity: _fadeAnimation,
            // Envolva o ListTile em um widget Material para que o ListTile tenha onde
            // renderizar as cores animadas durante a transição de esmaecimento (fade).
            child: const Material(
              child: ListTile(
                title: Text('ListTile com a função "FadeTransition".'),
                selectedTileColor: Colors.green,
                selectedColor: Colors.white,
                selected: true,
              ),
            ),
          ),
          SizedBox(
            height: 100,
            child: Center(
              child: SizeTransition(
                sizeFactor: _sizeAnimation,
                alignment: .topLeft,
                // Envolva o ListTile em um widget Material para que o ListTile tenha onde
                // renderizar as cores animadas durante a transição de tamanho.
                child: const Material(
                  child: ListTile(
                    title: Text('ListTile com a função "SizeTransition".'),
                    tileColor: Colors.red,
                    minVerticalPadding: 25.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
