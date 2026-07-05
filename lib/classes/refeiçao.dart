class Nutrientes {
  List<String> proteina = [];
  List<String> carboidrato = [];
  List<String> lipidio = [];

  Nutrientes(this.proteina, this.carboidrato, this.lipidio);

  List<List<String>> get todosOsMacros => [proteina, carboidrato, lipidio];
}

class Refeicao {

  late String refeicao;
  List<Nutrientes> listaNutrientes = [Nutrientes(['137,5', 'proteina'],['275', 'carboidrato'],['137,5', 'lipidio'])];
  List<String> sugestoes = [
    'banana', 'maça', 'aveia', 'ovo', 'frango',
    'patinho', 'arroz integral', 'feijão', 'batata doce', 'brócolis',
    'azeite de oliva', 'castanhas', 'abacate', 'iogurte natural', 'queijo cottage',
    'espinafre', 'cenoura', 'alface', 'tomate', 'peito de peru',
    'salmão', 'atum', 'tilápia', 'quinoa', 'lentilha',
    'grão de bico', 'chia', 'linhaça', 'mamão', 'morango',
    'kiwi', 'melancia', 'laranja', 'limão', 'mel',
    'leite desnatado', 'whey protein', 'tapioca', 'cuscuz', 'cacau em pó'
  ];
  String explicacao = 'Quando a glicemia de alguém está muito baixa, o corpo entra em estado de emergência. O cérebro depende quase 100% da glicose para funcionar e, sem ela, a pessoa pode ter tensões, tonturas ou até desmaiar.\n Alimentos de rápida absorção (Açúcares simples), são digeridos quase instantaneamente pelo organismo. Em cerca de 10 a 15 minutos, eles já jogam a glicose direto na corrente sanguínea, tirando a pessoa do estado de risco rapidamente.';

  Refeicao(this.refeicao);
}