import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  bool checkboxbool = false, checkboxbool1 = false, switch1 = false;
  String radio1 = '', _label = '', drop1 = "-";
  double slider1 = 5;

  void submit() {
    print ("Nome: ${nameController.text}, idade: ${ageController.text}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada de Dados"),
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                keyboardType: TextInputType.text,
                controller: nameController,
                decoration: InputDecoration(
                  labelText: "Digite seu nome",
                  labelStyle: TextStyle(fontSize: 30)
                ),
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black87
                ),
                enabled: true, // Bloquear input
                obscureText: false, //Censura input
                maxLength: 15, //Limita tamanho do input
                maxLengthEnforcement: MaxLengthEnforcement.none, //Alerta ultrapassar limite do input
                onChanged: (String val) {
                  print("onChanged: $val");
                },
                onSubmitted: (String val) {
                  print("onSubmitted: $val");
                },
              ),
              TextField(
                keyboardType: TextInputType.text,
                controller: ageController,
                decoration: InputDecoration(
                  labelText: "Digite sua idade",
                  labelStyle: TextStyle(fontSize: 30)
                ),
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black87
                )
              ),
              CheckboxListTile(
                value: checkboxbool, 
                onChanged:  (bool? val){
                  print("Checkbox: $val");
                  checkboxbool = val!;
                  setState(() {
                    
                  });
                  },
                title: Text ("Bandejão"),
                subtitle: Text("PV"),
                activeColor: Colors.blueGrey,
                secondary: Icon(Icons.food_bank),
                selected: true,
                ),
              CheckboxListTile(
                value: checkboxbool1, 
                onChanged:  (bool? val){
                  print("Checkbox: $val");
                  checkboxbool1 = val!;
                  setState(() {
                    
                  });
                  },
                title: Text (""),
                subtitle: Text("Gragoatá"),
                activeColor: Colors.blueGrey,
                secondary: Icon(Icons.food_bank_outlined),
                selected: true,
                ),
                RadioGroup(
                  child: RadioListTile(
                    value: "m",
                    title: Text("Direita"),
                    activeColor: Colors.blueGrey,
                  ),
                  groupValue: radio1,
                  onChanged: (String? val){
                    print("Radio: $val");
                    radio1 = val!;
                    setState(() {
                    });
                  }),
                RadioGroup(
                  child: RadioListTile(
                    value: "f",
                    title: Text("Esquerda"),
                    activeColor: Colors.blueGrey,
                  ),
                  groupValue: radio1,
                  onChanged: (String? val){
                    print("Radio: $val");
                    radio1 = val!;
                    setState(() {
                    });
                  }),
                SwitchListTile(
                  value: switch1,
                  onChanged: (bool? val){
                    switch1 = val!;
                    setState(() {
                      
                    });
                  },
                  title: Text("Ativar notificações"),
                  activeColor: Colors.blueGrey,
                  ),
                Slider(
                  value: slider1,
                  divisions: 10,
                  label: _label,
                  min: 0,
                  max: 10,
                  activeColor: Colors.blueGrey,
                  inactiveColor: const Color.fromARGB(255, 75, 87, 92),
                  onChanged: (double? val){
                    print("slider: $val");
                    slider1 = val!;
                    setState(() {
                      _label = "${val.toInt()}";
      
                    });
                  },
                ),
                DropdownButton(
                  value: drop1,
                  items: [
                    DropdownMenuItem(
                      value: "-",
                      child: Text("")
                    ),
                    DropdownMenuItem(
                      value: "SP",
                      child: Text("São Paulo")
                    ),
                    DropdownMenuItem(
                      value: "RJ",
                      child: Text("Rio de Janeiro")
                    ),
                    DropdownMenuItem(
                      value: "MG",
                      child: Text("Minas Gerais")
                    ),
                    DropdownMenuItem(
                      value: "ES",
                      child: Text("Espírito Santo")
                    ),
                  ],
                  onChanged: (String? val){
                    drop1 = val!;
                    setState(() {
                      
                    });
                  }
                  ),
              ElevatedButton(
                onPressed: submit,
                child: Text("Salvar",
                style: TextStyle(
                color: Colors.blueGrey)), 
              )


            ],
          ),
        ),
      )
    );
  }
}