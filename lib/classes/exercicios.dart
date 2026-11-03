class Exercicio {
  final String nome;
  final int? series;
  final int? repeticoes;
  final String carga;
  bool concluido;
  bool expandido;

  Exercicio({
    required this.nome,
    this.series,
    this.repeticoes,
    this.carga = "Carga Moderada",
    this.concluido = false,
    this.expandido = true,
  });
}

class ExercicioDetalhados {
  final String nome;
  final int? seriesCadastradas;
  final int? repeticoesCadastradas;
  final List<Series>? series;
  bool concluido;
  bool expandido;

  ExercicioDetalhados({
    required this.nome,
    this.seriesCadastradas,
    this.repeticoesCadastradas,
    List<Series>? series,
    this.concluido = false,
    this.expandido = true,
  }) : series = series ?? [];
}

class Series {
  final int? series;
  final int? repeticoes;
  final double? cargaUsada;

  Series({this.series, this.repeticoes, this.cargaUsada});
}

class CategoriaTreino {
  final String nome;
  final List<Exercicio> exercicios;

  CategoriaTreino({required this.nome, required this.exercicios});
}

class CategoriaTreinoDetalhado {
  final String nome;
  final List<ExercicioDetalhados> exercicios;

  CategoriaTreinoDetalhado({required this.nome, required this.exercicios});
}