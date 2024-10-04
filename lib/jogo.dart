import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  const Jogo({super.key});

  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemApp = const AssetImage("assets/images/padrao.png");
  var _mensagem = "Escolha uma opção abaixo";

  void _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ["Dragão Branco", "kariboh", "Mago Negro"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    if (kDebugMode) {
      print("Escolha do App: $escolhaApp");
    }
    if (kDebugMode) {
      print("Escolha do usuario: $escolhaUsuario");
    }

    //Exibição da imagem escolhida pelo App
    switch (escolhaApp) {
      case "Dragão Branco":
        setState(() {
          _imagemApp = const AssetImage("assets/images/dragao_branco.png");
        });
        break;
      case "kariboh":
        setState(() {
          _imagemApp = const AssetImage("assets/images/kariboh.jpg");
        });
        break;
      case "Mago Negro":
        setState(() {
          _imagemApp = const AssetImage("assets/images/mago_negro.jpg");
        });
        break;
    }

    //Validação do ganhador
    //Usuario Ganhador
    if ((escolhaUsuario == "Dragão Branco" && escolhaApp == "Mago Negro") ||
        (escolhaUsuario == "Mago Negro" && escolhaApp == "kariboh") ||
        (escolhaUsuario == "kariboh" && escolhaApp == "Dragão Branco")) {
      setState(() {
        _mensagem = "Parabéns!!! Você ganhou :D";
      });
      //App Ganhador
    } else if ((escolhaApp == "Dragão Branco" && escolhaUsuario == "Mago Negro") ||
        (escolhaApp == "Mago Negro" && escolhaUsuario == "kariboh") ||
        (escolhaApp == "kariboh" && escolhaUsuario == "Dragão Branco")) {
      setState(() {
        _mensagem = "Você perdeu ;(";
      });
    } else {
      setState(() {
        _mensagem = "Empatamos xD";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        title: const Text(
          "Yu-Gi-Oh PO 0.1",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do App",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Image(
            image: _imagemApp,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              _mensagem,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => _opcaoSelecionada("Dragão Branco"),
                child: Image.asset(
                  "assets/images/dragao_branco.png",
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("kariboh"),
                child: Image.asset(
                  "assets/images/kariboh.jpg",
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("Mago Negro"),
                child: Image.asset(
                  "assets/images/mago_negro.jpg",
                  height: 100,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
