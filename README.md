1. Importação de Pacotes
No início, você vê as linhas:
 
•	package:flutter/material.dart: Importa o conjunto de widgets pré-definidos do Flutter para criar interfaces gráficas (botões, textos, layouts, etc.).
•	As demais importações (alcool_gasolina.dart, frase_do_dia.dart, etc.) são arquivos que contêm as telas ou funcionalidades que serão acessadas a partir do menu.
________________________________________
2. Função main
 
•	runApp: Inicializa o aplicativo Flutter.
•	MaterialApp: É o widget principal que configura o tema e o comportamento global da aplicação.
o	home: Menu(): Define a tela inicial do app como o widget Menu.
o	debugShowCheckedModeBanner: false: Remove a marca "Debug" no canto da tela.
________________________________________
3. Classe Menu
A classe Menu cria a tela principal com botões para navegar entre diferentes funcionalidades.
Estrutura Básica
 
;
1.	Scaffold: Define a estrutura básica da tela (app bar, corpo, etc.).
2.	AppBar: Mostra a barra superior com o título "Menu Principal".
3.	Center + Column: Centralizam os botões no centro da tela e os alinham verticalmente.
Botões do Menu
Cada botão leva o usuário para uma tela diferente:
 
•	ElevatedButton: Um botão estilizado.
o	style: Configura o visual do botão (tamanho, cores, etc.).
o	onPressed: Define a ação ao clicar no botão. Aqui, usamos o Navigator.push para abrir uma nova tela.
•	Navigator.push: Transita para outra página, especificada por MaterialPageRoute.
Repetimos essa estrutura para os botões:
•	"Alcool Gasolina" → abre a tela AlcoolGasolina.
•	"Frase do Dia" → abre a tela Frase.
•	"Jogos" → abre o submenu MenuJogos.
________________________________________
4. Classe MenuJogos
Essa classe é semelhante à Menu, mas funciona como um submenu exclusivo para jogos
 
 
Botões do Submenu
Os botões levam para diferentes jogos:
 
•	"Jokenpo" → leva à tela Jokenpo.
•	"Cara ou Coroa" → leva à tela CaraOuCoroa.
•	"Jogo da Memória" → leva à tela JogoDaMemoria.
________________________________________
Conceitos-Chave
1.	Estrutura de Layout: Scaffold organiza a interface. Componentes como AppBar, Column, e ElevatedButton constroem as telas.
2.	Navegação: O uso do Navigator.push permite trocar de tela.
3.	Modularização: Cada funcionalidade (como jogos ou frases) é separada em arquivos diferentes, facilitando a manutenção e organização.
