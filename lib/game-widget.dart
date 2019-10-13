import 'dart:math';

import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  @override
  GameState createState() => GameState();
}

class GameState extends State<Game> {
  var _imagemEscolhaApp = AssetImage('images/padrao.png');
  var _mensagemResultado = 'Escolha uma opção abaixo';

  void _calculaResultado(String escolhaUsuario) {
    var opcoes = ['pedra', 'papel', 'tesoura'];
    var indiceSorteado = Random().nextInt(opcoes.length);
    var escolhaApp = opcoes[indiceSorteado];

    setState(() {
      switch (escolhaApp) {
        case 'pedra':
          this._imagemEscolhaApp = AssetImage("images/pedra.png");
          break;
        case 'papel':
          this._imagemEscolhaApp = AssetImage("images/papel.png");
          break;
        default:
          this._imagemEscolhaApp = AssetImage("images/tesoura.png");
      }
      
      // Validação do ganhador
      if(
          (escolhaUsuario == 'pedra' && escolhaApp == 'tesoura') ||
          (escolhaUsuario == 'tesoura' && escolhaApp == 'papel') ||
          (escolhaUsuario == 'papel' && escolhaApp == 'pedra')
        ) {
        _mensagemResultado = 'Parabéns!!! Você ganhou!!! :)';
      } else if (escolhaUsuario == escolhaApp) {
        _mensagemResultado = 'Empatamos ;)';
      } else {
        _mensagemResultado = 'Você perdeu :(';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 32, bottom: 16),
          child: Text(
            'Escolha do App:',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ),
        Image(image: _imagemEscolhaApp),
        Padding(
          padding: EdgeInsets.only(top: 32, bottom: 32),
          child: Text(
            _mensagemResultado,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            GestureDetector(
              child: Image.asset('images/pedra.png', scale: 1.6),
              onTap: () => _calculaResultado('pedra'),
            ),
            GestureDetector(
              child: Image.asset('images/papel.png', scale: 1.6),
              onTap: () => _calculaResultado('papel'),
            ),
            GestureDetector(
              child: Image.asset('images/tesoura.png', scale: 1.6),
              onTap: () => _calculaResultado('tesoura'),
            ),
          ],
        )
      ],
    );
  }
}
