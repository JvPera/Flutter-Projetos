import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/services.dart';

class Tela extends StatefulWidget {
  String name, palavraAleatoria;
  int dificuldade, letras;

  Tela(this.name, this.dificuldade, this.letras, this.palavraAleatoria);

  @override
  State<Tela> createState() => _TelaState();
}

class _TelaState extends State<Tela> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, dynamic>> tentativas = [];
  late int chancesRestantes = widget.dificuldade;
  String mensagem = "";

  void adicionarTentativa() {
    if (mensagem.isNotEmpty) return;

    String tentativa = _controller.text.trim();
    if (tentativa.isEmpty) return; // evita vazios

    setState(() {
      List<Color> cores = compararPalavras(tentativa, widget.palavraAleatoria);
      tentativas.add({"palavra": tentativa, "cores": cores});
      _controller.clear();

      if (tentativa.toLowerCase() == widget.palavraAleatoria.toLowerCase()) {
        mensagem = "Você venceu!";
        return;
      }
      chancesRestantes--;

      // Verifica se acabou as chances
      if (chancesRestantes <= 0) {
        mensagem = "Fim de jogo! A palavra era '${widget.palavraAleatoria}'";
      }
    });
  }

  List<Color> compararPalavras(String tentativa, String correta) {
    List<Color> cores = List.filled(tentativa.length, Colors.grey);
    List<String> letrasCorretas = correta.split('');
    List<String> letrasTentativa = tentativa.split('');

    // Verdes
    for (int i = 0; i < letrasTentativa.length; i++) {
      if (letrasTentativa[i] == letrasCorretas[i]) {
        cores[i] = Colors.green;
        letrasCorretas[i] = '_'; // marca como usada
      }
    }

    // Amarelas
    for (int i = 0; i < letrasTentativa.length; i++) {
      if (cores[i] == Colors.green) continue;

      String letra = letrasTentativa[i];
      int index = letrasCorretas.indexOf(letra);

      if (index != -1) {
        cores[i] = Colors.yellow;
        letrasCorretas[index] = '_';
      }
    }

    return cores;
  }

  @override
  Widget build(BuildContext context) {
    String palavraAleatoria = '';
    int chances;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 229, 229, 229),
      appBar: AppBar(
        title: Align(
          alignment: Alignment.topCenter, // ou Alignment.centerRight, etc
          child: Text(
            "LETROSO  /  ${widget.name}",
            style: TextStyle(
              fontSize: 30,
              color: const Color.fromARGB(255, 211, 255, 160),
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.none,
            ),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 147, 240, 41),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.only(top: 70),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: tentativas.length,
                  itemBuilder: (context, index) {
                    final tentativa = tentativas[index];
                    final palavra = tentativa["palavra"];
                    final cores = tentativa["cores"] as List<Color>;

                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(palavra.length, (i) {
                        return Container(
                          width: 45,
                          height: 45,
                          margin: const EdgeInsets.all(4),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: cores[i],
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            palavra[i].toUpperCase(),
                            style: const TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      }),
                    );
                  },
                ),
              ),

              Column(
                children: [
                  // Mostra mensagens e chances
                  if (mensagem.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        mensagem,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: mensagem.contains("venceu")
                              ? Colors.green
                              : Colors.red,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  if (mensagem.isEmpty)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Chances restantes: $chancesRestantes",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 185, 185, 185)
                        ),
                      ),
                    ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 350, // largura desejada
                        height: 150,
                        padding: EdgeInsets.only(top: 50),
                        child: TextField(
                          controller: _controller,
                          keyboardType: TextInputType.text,
                          cursorColor: const Color.fromARGB(255, 97, 163, 21),
                          decoration: InputDecoration(
                            labelText: "",
                            labelStyle: TextStyle(fontSize: 30),
                            floatingLabelStyle: TextStyle(
                              color: const Color.fromARGB(255, 15, 91, 12),
                            ),
                            border: OutlineInputBorder(),
                            filled:
                                true, // importante para cor do fundo do textfield!
                            fillColor: const Color.fromARGB(255, 219, 255, 177),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: const Color.fromARGB(255, 65, 244, 71),
                              ), // cor da borda quando não focado
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: const Color.fromARGB(255, 15, 91, 12),
                              ), // cor da borda quando focado
                            ),
                          ),
                          style: TextStyle(
                            fontSize: 20,
                            color: const Color.fromARGB(255, 97, 163, 21),
                          ),
                          enabled: true, // Bloquear input
                          obscureText: false, //Censura input
                          maxLength: widget.letras, //Limita tamanho do input
                          maxLengthEnforcement: MaxLengthEnforcement.none,
                          onSubmitted: (_) {
                            if (_controller.text.length == widget.letras) {
                              adicionarTentativa();
                            }
                          },
                        ),
                      ),

                      SizedBox(width: 10),

                      ElevatedButton(
                        onPressed: () {
                          if (_controller.text.length == widget.letras) {
                            adicionarTentativa();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(125, 50), // largura x altura
                          backgroundColor: const Color.fromARGB(
                            255,
                            211,
                            255,
                            160,
                          ), // cor de fundo
                          foregroundColor: const Color.fromARGB(
                            255,
                            211,
                            255,
                            160,
                          ), // cor do texto
                          textStyle: TextStyle(
                            fontSize: 20,
                          ), // tamanho do texto
                        ),
                        child: Text(
                          "Enviar",
                          style: TextStyle(
                            color: const Color.fromARGB(255, 97, 163, 21),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
