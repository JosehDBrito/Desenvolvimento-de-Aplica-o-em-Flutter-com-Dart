# Guia de Uso e Estrutura do Projeto

Este documento detalha a estrutura e o funcionamento do aplicativo Flutter desenvolvido.

---

## 1. Importação de Pacotes

No início do projeto, encontram-se as seguintes importações principais:

- **`package:flutter/material.dart`**: Importa o conjunto de widgets pré-definidos do Flutter para criação de interfaces gráficas (botões, textos, layouts, etc.).
- **Outras importações (e.g., `alcool_gasolina.dart`, `frase_do_dia.dart`)**: Arquivos contendo as telas ou funcionalidades acessadas a partir do menu principal.

---

## 2. Função `main`

A função principal do aplicativo é responsável por inicializar e configurar o projeto:

- **`runApp`**: Inicializa o aplicativo Flutter.
- **`MaterialApp`**: Widget principal que configura o tema e o comportamento global do app.
  - **`home: Menu()`**: Define o widget `Menu` como tela inicial.
  - **`debugShowCheckedModeBanner: false`**: Remove a marca "Debug" no canto superior da tela.

---

## 3. Classe `Menu`

A classe `Menu` cria a tela principal, contendo botões para navegar entre diferentes funcionalidades do aplicativo.

### Estrutura Básica:

- **`Scaffold`**: Define a estrutura básica da tela, como barra de título e corpo.
- **`AppBar`**: Mostra a barra superior com o título *"Menu Principal"*.
- **`Center` + `Column`**: Centralizam os botões e os alinham verticalmente.

### Botões do Menu

Cada botão executa ações específicas:

- **`ElevatedButton`**: Botão estilizado com:
  - **`style`**: Configurações visuais do botão (tamanho, cores, etc.).
  - **`onPressed`**: Define a ação ao clicar. Utiliza o **`Navigator.push`** para abrir uma nova tela.
- **`Navigator.push`**: Faz a transição para outra página especificada por **`MaterialPageRoute`**.

**Funcionalidades disponíveis:**
- *"Álcool ou Gasolina"* → Tela `AlcoolGasolina`.
- *"Frase do Dia"* → Tela `Frase`.
- *"Jogos"* → Submenu `MenuJogos`.

---

## 4. Classe `MenuJogos`

A classe `MenuJogos` é um submenu dedicado a jogos. Sua estrutura é semelhante à da classe `Menu`, com botões que direcionam para jogos específicos.

### Botões do Submenu

- *"Jokenpo"* → Tela `Jokenpo`.
- *"Cara ou Coroa"* → Tela `CaraOuCoroa`.
- *"Jogo da Memória"* → Tela `JogoDaMemoria`.

---

## Conceitos-Chave do Projeto

1. **Estrutura de Layout**: 
   - O `Scaffold` organiza a interface com componentes como `AppBar`, `Column` e `ElevatedButton`.

2. **Navegação**: 
   - Utilização do **`Navigator.push`** para transição entre telas.

3. **Modularização**: 
   - Cada funcionalidade é separada em arquivos diferentes, promovendo organização e facilidade de manutenção.

---

## Desenvolvedores

Este projeto foi desenvolvido por:

- Túlio Silva Souza  
- Luiz Emanuel Collares Mascarenhas  
- Ronaldo Machado Barroso Júnior  
- Francisco José da Silva Brito
