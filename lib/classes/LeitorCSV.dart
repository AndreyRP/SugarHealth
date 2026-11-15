import 'package:excel/excel.dart';
import 'cadastroDieta.dart';

class LeitorDietaMensal {
  List<MensalRefeicao> importarExcelDieta(List<int> bytesFicheiro) {
    var excel = Excel.decodeBytes(bytesFicheiro);
    final List<MensalRefeicao> dietaMensal = List.generate(
      31,
          (index) => MensalRefeicao(
        index + 1,
        [
          SuaRefeicao('Café da manhã', []),
          SuaRefeicao('Lanche da manhã', []),
          SuaRefeicao('Almoço', []),
          SuaRefeicao('Lanche da tarde', []),
          SuaRefeicao('Jantar', []),
          SuaRefeicao('Ceia', []),
        ],
      ),
    );

    if (excel.tables.isEmpty) return [];
    var nomePrimeiraAba = excel.tables.keys.first;
    var tabela = excel.tables[nomePrimeiraAba];

    if (tabela == null) return [];

    int linhasConsecutivasVazias = 0;
    int diaAtual = 1;
    bool leuAlgumPratoNoDia = false;

    for (int rowIndex = 0; rowIndex < tabela.maxRows; rowIndex++) {
      var linha = tabela.rows[rowIndex];

      // 1. Verifica se a linha está 100% vazia
      bool linhaVazia = linha.every(
            (celula) => celula?.value == null || celula!.value.toString().trim().isEmpty,
      );

      if (linhaVazia) {
        linhasConsecutivasVazias++;

        // 2 linhas vazias seguidas = Fim do mês
        if (linhasConsecutivasVazias >= 2) {
          break;
        }

        // 1 linha vazia após ler dados de um dia = Avança para o próximo dia
        if (linhasConsecutivasVazias == 1 && leuAlgumPratoNoDia) {
          diaAtual++;
          leuAlgumPratoNoDia = false;
          if (diaAtual > 31) break;
        }
        continue;
      }

      linhasConsecutivasVazias = 0;

      // 2. Ignora a linha de título do dia (ex: "dia 01", "dia 02")
      String primeiraCelula = linha.isNotEmpty
          ? (linha[0]?.value?.toString().trim().toLowerCase() ?? '')
          : '';

      if (primeiraCelula.startsWith('dia')) {
        // Caso o utilizador não tenha deixado linha vazia entre os dias,
        // garante que muda para o dia seguinte se já tiver lido dados antes
        if (leuAlgumPratoNoDia) {
          diaAtual++;
          leuAlgumPratoNoDia = false;
          if (diaAtual > 31) break;
        }
        continue;
      }

      // 3. Ignora a linha de cabeçalho das refeições (ex: "Café da manhã", "Almoço")
      if (primeiraCelula == 'café da manhã' || primeiraCelula == 'cafe da manha') {
        continue;
      }

      // 4. Lê diretamente das células da linha de 3 em 3 colunas (sem usar .toString().split)
      for (int col = 0; col < linha.length; col += 3) {
        if (col + 2 >= linha.length) break;

        String nomePrato = linha[col]?.value?.toString().trim() ?? '';
        String qtdStr = linha[col + 1]?.value?.toString().trim() ?? '';
        String medida = linha[col + 2]?.value?.toString().trim() ?? '';

        if (nomePrato.isEmpty || nomePrato.toUpperCase() == 'NAN') {
          continue;
        }

        int indiceRefeicao = col ~/ 3;
        double quantidade = double.tryParse(qtdStr.replaceAll(',', '.')) ?? 0.0;

        var novoPrato = Prato(nomePrato, quantidade, medida.toUpperCase());

        if (indiceRefeicao < dietaMensal[diaAtual - 1].listaDasRefeicoesMes.length) {
          dietaMensal[diaAtual - 1]
              .listaDasRefeicoesMes[indiceRefeicao]
              .pratos
              .add(novoPrato);
          leuAlgumPratoNoDia = true;
        }
      }
    }

    return dietaMensal;
  }
}

