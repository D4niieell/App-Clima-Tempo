// Declara a classe "Clima", que representa os dados climáticos de uma cidade
class Clima {
  // Nome da cidade; "final" significa que o valor não pode ser alterado após a criação do objeto
  final String cidade;

  // Temperatura atual (em graus), usando double para permitir casas decimais
  final double temperaturaAtual;

  // Menor temperatura prevista para o dia
  final double temperaturaMinima;

  // Maior temperatura prevista para o dia
  final double temperaturaMaxima;

  // Umidade relativa do ar (em %), um número inteiro
  final int umidade;

  // Probabilidade de chuva (por exemplo, 0.7 para 70% ou 70.0, dependendo da sua convenção)
  final double chanceChuva;

  // Construtor constante: permite criar objetos imutáveis em tempo de compilação com "const"
  const Clima({
    // Parâmetro nomeado e obrigatório: atribui o valor diretamente ao campo "cidade"
    required this.cidade,

    // Parâmetro nomeado e obrigatório: atribui o valor ao campo "temperaturaAtual"
    required this.temperaturaAtual,

    // Parâmetro nomeado e obrigatório: atribui o valor ao campo "temperaturaMinima"
    required this.temperaturaMinima,

    // Parâmetro nomeado e obrigatório: atribui o valor ao campo "temperaturaMaxima"
    required this.temperaturaMaxima,

    // Parâmetro nomeado e obrigatório: atribui o valor ao campo "umidade"
    required this.umidade,

    // Parâmetro nomeado e obrigatório: atribui o valor ao campo "chanceChuva"
    required this.chanceChuva,
    // Fim da lista de parâmetros do construtor
  }); // O ";" encerra o construtor, que não precisa de corpo, pois os campos são inicializados diretamente
} // Fim da classe Clima
