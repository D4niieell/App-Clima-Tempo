// O ClimaApp vai crescer. Em vez de uma única tela, ele agora terá uma tela inicial com navegação e duas telas: Clima atual, que você já construiu, e Previsão da semana, que é nova. Nesta etapa você vai refatorar o projeto e aplicar os Widgets de Layout vistos na Aula 2.

// Requisitos

// 1. Organização do projeto

// · Crie a pasta lib/screens/.

// · Mova a tela do exercício anterior para lib/screens/clima_atual.dart, na classe ClimaAtualScreen (StatelessWidget que retorna um Scaffold com AppBar “Clima atual”).

// · Crie lib/screens/previsao_semana.dart, com a classe PrevisaoSemanaScreen (StatelessWidget que retorna um Scaffold com AppBar “Previsão da semana”).

// · Mantenha o TituloSecao em lib/widgets/titulo_secao.dart e use-o em todos os títulos de seção das duas telas.


// 2. Tela inicial e navegação

// No main.dart:

// · O MyApp deve ter o MaterialApp com home: HomeScreen().

// · Crie a classe HomeScreen (StatelessWidget) no próprio main.dart, com Scaffold, AppBar com o título “ClimaApp” e, no body, uma Column com 2 ElevatedButton:

// o “Clima atual” - navega para ClimaAtualScreen.

// o “Previsão da semana” - navega para PrevisaoSemanaScreen.

// · A navegação deve usar Navigator.push com MaterialPageRoute e builder.

// 3. Refatorando a tela “Clima atual”

// Mantenha todas as seções do exercício anterior, na mesma ordem e separadas por Divider(). Aplique os ajustes abaixo:

// a) Cidade atual

// · Coloque os dois Text dentro de uma Column, e a Column dentro de um Padding com EdgeInsets.all(20).

// · O Padding deve estar dentro de um Container com color: Colors.lightBlue.shade100.

// b) Temperatura

// · Centralize a temperatura e a sensação térmica usando Center.

// · Separe os dois textos com um SizedBox(height: 8).

// c) Condição do tempo

// · Mantenha como estava (Image.network com height: 200).

// d) Detalhes

// · Mantenha as duas Row com spaceAround.

// · Envolva a segunda Row (valores) com um Padding que use EdgeInsets.only(top: 8).

// e) Atualização

// · Centralize o ElevatedButton “Atualizar” com Center.

// · Abaixo dele, coloque um SizedBox(height: 16).

// · Em seguida, um Container com height: 80 e color: Colors.grey.shade200, contendo um Align com alignment: Alignment.bottomRight e o texto “Última atualização: 14:30”.

// 4. Tela “Previsão da semana”

// O body deve ser um ListView com padding: EdgeInsets.all(16), com as seções abaixo, nesta ordem, separadas por Divider().

// a) Faixa de temperatura (TituloSecao: “Faixa de temperatura”)

// · Uma Row com 3 Container de height: 60, cada um com cor diferente e um Center com o texto dentro:

// o Mínima (“18°C”): envolva em Expanded.

// o Atual (“26°C”): envolva em Flexible com flex: 2.

// o Máxima (“31°C”): envolva em Expanded.

// b) Resumo do dia (TituloSecao: “Resumo do dia”)

// · Um Container com height: 200 e uma cor de fundo, contendo uma Column com 2 filhos:

// o Manhã (“Manhã: 20°C”): envolva em Expanded.

// o Tarde (“Tarde: 29°C”): envolva em Flexible com flex: 2.

// · Cada filho deve ser um Container colorido com um Center e o texto.

// c) Próximos dias (TituloSecao: “Próximos dias”)

// · Crie 5 linhas, uma para cada dia (ex.: Sexta, Sábado, Domingo, Segunda, Terça). Cada linha é uma Row com:

// o Expanded com flex: 2 contendo o nome do dia (Text).

// o Um Icon com size: 28 (sugestões: Icons.wb_sunny, Icons.cloud, Icons.umbrella).

// o Expanded contendo a temperatura mínima (Text).

// o Expanded contendo a temperatura máxima (Text).

// · Envolva cada Row em um Padding com EdgeInsets.symmetric(vertical: 8). Esse valor é novo, então consulte a documentação do EdgeInsets.

// 5. README

// Crie um arquivo README.md na raiz do repositório respondendo, com suas palavras:

// Qual a diferença entre Expanded e Flexible? O que acontece quando dois elementos na mesma Row ou Column têm valores de flex diferentes?

// Dicas

// · Se aparecer um erro de context ao fazer a navegação, lembre-se do que vimos em aula: o Navigator precisa de um context que exista abaixo do MaterialApp.

// · O Align precisa de um espaço de tamanho definido para ter o que alinhar. Por isso ele fica dentro de um Container com height.

// · Se o layout não ficar como você imaginou, ajuste os valores de flex, height e Padding e teste novamente. Pequenas diferenças visuais são esperadas nesta etapa. · Documentação: https://docs.flutter.dev/ui/widgets/layout

// Desafio extra (opcional)

// Na seção “Próximos dias”, as 5 linhas repetem muito código. Crie um Widget personalizado LinhaPrevisao em lib/widgets/linha_previsao.dart, que receba String dia, IconData icone, String minima e String maxima, e use-o 5 vezes no lugar das Row repetidas.


// Entrega

// A entrega é via GitHub, no mesmo repositório do exercício anterior:

// 1. Faça o commit final com a versão que deseja entregar e o push para o repositório remoto.

// 2. Envie, no local indicado pelo professor:

// a. Link do commit no github

// Importa as duas telas do app.
import 'package:flutter/material.dart';
import 'screens/clima_atual.dart';
import 'screens/previsao_semana.dart';

// Ponto de entrada do aplicativo.
void main() {
  runApp(const MyApp());
}

// Widget raiz do app. É Stateless porque não guarda estado.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
  // MaterialApp configura o app com o estilo Material Design.
  return const MaterialApp(
      // A tela inicial agora é a HomeScreen.
      home: HomeScreen(),
    );
  }
}

// Tela inicial com os botões de navegação.
// Por ser uma classe separada, o context dela fica ABAIXO do MaterialApp
// O que permite usar o Navigator sem erro.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ClimaApp')),
      body: Column(
        // Centraliza os botões na vertical
        mainAxisAlignment: MainAxisAlignment.center,
        // Centraliza os botõse na horizontal.
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              // Navigator.push empilaha uma nova rota sobre a atual.
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => const ClimaAtualScreen(),
                ),
              );
            },
            child: const Text('Clima atual'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PrevisaoSemanaScreen(),
                ),
              );
            },
            child: const Text('Previsão da semana'),
          ),
        ],
      ),
    );
  }
} 