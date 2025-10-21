import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'tela.dart';
import 'dart:math';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController nameController = TextEditingController();

  String _label = '';
  double slider1 = 5;
  int chances = 8, letras = 5;

  Random random = Random();

final List<String> palavras5 = ["canto","barco","nuvem","folha","vento","campo","livro","plano","chave","pedra"];
final List<String> palavras6 = ["janela","botina","flores","escuro","poesia","círculo","frente","grande","panela","mestre"];
final List<String> palavras7 = ["pássaro","família","amarelo","retrato","goleiro","barulho","alegria","espelho","momento","janeiro"];
final List<String> palavras8 = ["amizades","caminhos","silencio","sentidos","pinturas","distante","estrelas","cachorro","montanha","corrente"];
final List<String> palavras9 = ["aventuras","solidário","corajosos","sabedoria","tranquilo","chuveiros","descansar","maltratar","luminosos","profundos"];
final List<String> palavras10 = ["felicidade","jabuticaba","encantador","computador","incipiente","alavancada","comendador","acalentada","harmonioso","escardilho"];



  @override
  Widget build(BuildContext context) {
    String gerarPalavra(int letras) {
  switch (letras) {
    case 5:
      return palavras5[random.nextInt(palavras5.length)];
    case 6:
      return palavras6[random.nextInt(palavras6.length)];
    case 7:
      return palavras7[random.nextInt(palavras7.length)];
    case 8:
      return palavras8[random.nextInt(palavras8.length)];
    case 9:
      return palavras9[random.nextInt(palavras9.length)];
    case 10:
      return palavras10[random.nextInt(palavras10.length)];
    default:
      return palavras5[random.nextInt(palavras5.length)];
  }
}

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 229, 229, 229),
      appBar: AppBar(
        title: Align(
          alignment: Alignment.topCenter, // ou Alignment.centerRight, etc
          child: Text(
            "LETROSO",
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 350, // largura desejada
                height: 150, // altura desejada
                padding: EdgeInsets.only(top: 80),
                child: TextField(
                  controller: nameController,
                  keyboardType: TextInputType.text,
                  cursorColor: const Color.fromARGB(255, 97, 163, 21),
                  decoration: InputDecoration(
                    labelText: "Digite o seu usuário",
                    labelStyle: TextStyle(fontSize: 30),
                    floatingLabelStyle: TextStyle(
                      color: const Color.fromARGB(255, 15, 91, 12),
                    ),
                    border: OutlineInputBorder(),
                    filled: true, // importante para cor do fundo do textfield!
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
                  maxLength: 10, //Limita tamanho do input
                  maxLengthEnforcement: MaxLengthEnforcement.none,
                ),
              ),

              SizedBox(height: 10),

              Text(
                "Selecione a dificuldade:",
                style: TextStyle(
                  fontSize: 20,
                  color: const Color.fromARGB(255, 97, 163, 21),
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none,
                ),
              ),

              SizedBox(height: 15),

              ElevatedButton(
                onPressed: () {
                setState(() {
                  chances = 8; // muda a dificuldade
                  });
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(200, 60), // largura x altura
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
                  textStyle: TextStyle(fontSize: 20), // tamanho do texto
                ),
                child: Text(
                  "Fácil",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 97, 163, 21),
                  ),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                setState(() {
                  chances = 6; // muda a dificuldade
                  });
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(200, 60), // largura x altura
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
                  textStyle: TextStyle(fontSize: 20), // tamanho do texto
                ),
                child: Text(
                  "Médio",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 97, 163, 21),
                  ),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed:() {
                setState(() {
                  chances = 4; // muda a dificuldade
                  });
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(200, 60), // largura x altura
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
                  textStyle: TextStyle(fontSize: 20), // tamanho do texto
                ),
                child: Text(
                  "Difícil",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 97, 163, 21),
                  ),
                ),
              ),

              SizedBox(height: 10),

              Text(
                "Número máximo de letras:",
                style: TextStyle(
                  fontSize: 20,
                  color: const Color.fromARGB(255, 97, 163, 21),
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none,
                ),
              ),

              SizedBox(height: 10),

              Container(
                width: 350, // largura desejada
                height: 50, // altura desejada
                child: Slider(
                  value: slider1,
                  divisions: 5,
                  label: _label,
                  min: 5,
                  max: 10,
                  activeColor: const Color.fromARGB(255, 135, 206, 54),
                  inactiveColor: const Color.fromARGB(255, 51, 142, 48),
                  onChanged: (double? val) {
                    print("slider: $val");
                    slider1 = val!;
                    letras = slider1.toInt();
                    setState(() {
                      _label = "${val.toInt()}";
                    });
                  },
                ),
              ),

              SizedBox(height: 10),

              ElevatedButton(
                onPressed: (){
                  print("Nome: ${nameController.text}");
                  String palavraEscolhida = gerarPalavra(letras);
                  Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context) => Tela(nameController.text, chances = chances, letras = letras, palavraEscolhida = palavraEscolhida,)
                    ));

                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(200, 80), // largura x altura
                  backgroundColor: const Color.fromARGB(
                    255,
                    147,
                    240,
                    41,
                  ), // cor de fundo
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ), // tamanho do texto
                ),
                child: Text(
                  "JOGAR",
                  style: TextStyle(
                    fontSize: 30,
                    color: const Color.fromARGB(255, 211, 255, 160),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}