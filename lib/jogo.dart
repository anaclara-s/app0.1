import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class paginaJogo extends StatefulWidget {
  @override
  State<paginaJogo> createState() => _paginaJogo();
}

class _paginaJogo extends State<paginaJogo> {
  List opcoes = ['pedra', 'papel', 'tesoura'];
  String mensagem = 'Sua escolha: ';

  var imagemApp = AssetImage('imagens/selo.png');

  void jogada(String escolha) {
    int O = Random().nextInt(opcoes.length);
    String aleatorio = opcoes[O];

    this.imagemApp = AssetImage('imagens/$aleatorio.png');

    print('click: ' + escolha + ', Random: ' + aleatorio);

    if ( //VITORIA USUARIO
        (escolha == 'pedra' && aleatorio == 'tesoura') ||
            (escolha == 'papel' && aleatorio == 'pedra') ||
            (escolha == 'tesoura' && aleatorio == 'papel')) {
      setState(() {
        this.mensagem = 'VITORIA ✧⁠◝⁠(⁠⁰⁠▿⁠⁰⁠)⁠◜⁠✧';
      });
    } else if ( //DERROTA USUARIO
        (escolha == 'pedra' && aleatorio == 'papel') ||
            (escolha == 'papel' && aleatorio == 'tesoura') ||
            (escolha == 'tesoura' && aleatorio == 'pedra')) {
      setState(() {
        this.mensagem = 'DERROTA (⁠╯⁠ರ⁠⁠~⁠⁠ರ⁠)⁠╯⁠︵⁠⁠┻⁠━⁠┻';
      });
    } else {
      //EMPATE
      setState(() {
        this.mensagem = 'EMPATE (ㆆ_ㆆ)';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pedra, Papel e Tesoura'),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                'Computador escolheu: ',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Image(image: imagemApp, height: 250),
            Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: Text(
                mensagem,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => jogada('pedra'),
                  child: Image.asset('imagens/pedra.png', height: 80),
                ),
                GestureDetector(
                  onTap: () => jogada('papel'),
                  child: Image.asset(
                    'imagens/papel.png',
                    height: 80,
                  ),
                ),
                GestureDetector(
                  onTap: () => jogada('tesoura'),
                  child: Image.asset(
                    'imagens/tesoura.png',
                    height: 80,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
