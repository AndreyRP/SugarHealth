# Sugar Health

## Integrantes do Grupo
* Eduardo José Rinaldi Fontanela
* Winicius Santos Loebens
* Enzo
* Andrey Roberto Pinheiro

---

##  Descrição Resumida do Sistema
O Sugar Health é um aplicativo móvel desenvolvido para o gerenciamento integrado da saúde e bem-estar, focado especialmente em pessoas com diabetes que praticam ou têm interesse em treinos físicos e necessitam de um controle rigoroso da alimentação.

O sistema centraliza o acompanhamento de múltiplos aspectos da saúde que costumam ficar dispersos (como anotações manuais ou uso de vários apps diferentes). Ele permite unificar o registro de hábitos alimentares, monitoramento de atividades físicas e oferece suporte para dúvidas frequentes, proporcionando uma visão holística do progresso do usuário e facilitando a adesão a uma rotina saudável e consciente.

---

## Tecnologias Utilizadas
O projeto utiliza ferramentas modernas e consolidadas no mercado para garantir uma interface fluida, escalabilidade e performance:

* **Front End (Mobile):** Flutter & Dart
* **Backend:** Java & Spring Boot
* **Prototipagem de Telas:** Figma

---

## Instruções para Execução

Nesta etapa atual de desenvolvimento, **não é necessário configurar banco de dados ou backend**. O sistema de autenticação e a calculadora estão utilizando armazenamento em memória para facilitar os testes e a validação do fluxo das telas.

### Pré-requisitos
* [Flutter SDK](https://docs.flutter.dev/get-started/install) instalado e configurado na máquina.
* Uma IDE de sua preferência (VS Code ou Android Studio).
* Emulador Android/iOS configurado **OU** Google Chrome instalado para rodar a versão Web.

### Passo a passo para rodar a aplicação:

1. **Clone o repositório para a sua máquina:**
   ```bash
   git clone https://github.com/AndreyRP/SugarHealth.git

2. **Acesse a pasta do projeto e instale as dependências:**
   ```bahs
   cd SugarHealth
   flutter pub get

3. **Execute o aplicativo:**

   **Opção A:** Rodar no navegador (Recomendado para testes rápidos da interface):
```bash
   flutter run -d chrome
   ```
   Nota: Caso enfrente problemas de conexão com o navegador padrão, utilize o comando e acesse o link (localhost) gerado no terminal.
```bash
flutter run -d web-server
```
   **Opção B:** Rodar no Emulador ou Dispositivo Físico:
   Certifique-se de que o emulador está aberto ou o celular está conectado com a depuração USB ativa, e rode:
```bash   
flutter run
```

## Funcionalidades Implementadas

### Módulos Principais:
* **Autenticação em Memória:** Telas de Cadastro e Login funcionais com validação de dados em tempo de execução (armazenamento em variáveis globais, sem integração com banco de dados nesta etapa).
* **Calculadora de Glicemia para Treino (Home):** Ferramenta que avalia a glicose atual do usuário, idade, peso e altura, emitindo alertas visuais (Crítico, Excelente ou Seguro) para liberar ou restringir a prática de exercícios físicos com base no risco de hipoglicemia ou cetoacidose.
* **Perfil Personalizado:** Configuração inicial de informações pessoais (incluindo tipo de diabetes e dados físicos) para adequar a experiência do usuário.

### Funcionalidades Futuras (Roadmap):
* Integração com Banco de Dados para persistência real de usuários (Backend em Spring Boot).
* Integração com sensores de monitoramento contínuo de glicose (ex: *FreeStyle Libre*).
* Módulo de planejamento e cadastro de dietas semanais e mensais.
* Módulo de P&A (Perguntas e Respostas) para suporte e dúvidas.
* Expansão para monitoramento de outros indicadores de saúde (pressão arterial, frequência cardíaca, etc.).

---

