class Prato{
  final String nomePrato;
  final double quantidade;
  final String medida;

  Prato(this.nomePrato, this.quantidade, this.medida);
}

class SuaRefeicao{
  final String refeicao;
  final List<Prato> pratos;

  SuaRefeicao(this.refeicao, this.pratos);
}

class SemanalRefeicao{
  final int diaDaSemana;
  final List<SuaRefeicao> listaDasRefeicoes;

  SemanalRefeicao(this.diaDaSemana, this.listaDasRefeicoes);
}

class MensalRefeicao{
  final int dia;
  final List<SuaRefeicao> listaDosRefeicoes;

  MensalRefeicao(this.dia, this.listaDosRefeicoes);
}