// // Declara a classe "Clima", que representa os dados climáticos de uma cidade
// class Clima {
//   final String cidade; // Nome da cidade; "final" significa que o valor não pode ser alterado após a criação do objeto
//   final double temperaturaAtual; // Temperatura atual (em graus), usando double para permitir casas decimais
//   final double temperaturaMinima; // Menor temperatura prevista para o dia
//   final double temperaturaMaxima; // Maior temperatura prevista para o dia
//   final int umidade; // Umidade relativa do ar (em %), um número inteiro
//   final double chanceChuva; // Probabilidade de chuva (por exemplo, 0.7 para 70% ou 70.0, dependendo da sua convenção)

//   // Construtor constante: permite criar objetos imutáveis em tempo de compilação com "const"
//   const Clima({
//     required this.cidade, // Parâmetro nomeado e obrigatório: atribui o valor diretamente ao campo "cidade"
//     required this.temperaturaAtual, // Parâmetro nomeado e obrigatório: atribui o valor ao campo "temperaturaAtual"
//     required this.temperaturaMinima, // Parâmetro nomeado e obrigatório: atribui o valor ao campo "temperaturaMinima"
//     required this.temperaturaMaxima, // Parâmetro nomeado e obrigatório: atribui o valor ao campo "temperaturaMaxima"
//     required this.umidade, // Parâmetro nomeado e obrigatório: atribui o valor ao campo "umidade"
//     required this.chanceChuva, // Parâmetro nomeado e obrigatório: atribui o valor ao campo "chanceChuva"
//     // Fim da lista de parâmetros do construtor
//   }); // O ";" encerra o construtor, que não precisa de corpo, pois os campos são inicializados diretamente
// } // Fim da classe Clima

// Representa a previsão de um único dia da semana
class PrevisaoDia {
  final String diaSemana; // Ex.: 'Segunda'
  final double minima; // Temperatura mínima do dia
  final double maxima; // Temperatura máxima do dia

  const PrevisaoDia({
    required this.diaSemana,
    required this.minima,
    required this.maxima,
  });
}

// Representa os dados climáticos de uma cidade
class Clima {
  final String cidade; // Nome da cidade
  final double temperaturaAtual; // Temperatura atual
  final double temperaturaMinima; // Mínima do dia
  final double temperaturaMaxima; // Máxima do dia
  final int umidade; // Umidade relativa (%)
  final int chanceChuva; // Probabilidade de chuva (0 a 100)
  final List<PrevisaoDia> previsaoSemana; // Previsão dos próximos dias

  const Clima({
    required this.cidade,
    required this.temperaturaAtual,
    required this.temperaturaMinima,
    required this.temperaturaMaxima,
    required this.umidade,
    required this.chanceChuva,
    required this.previsaoSemana,
  });
}
