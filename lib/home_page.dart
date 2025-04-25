import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage ({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController angka1Controller = TextEditingController();
  TextEditingController angka2Controller = TextEditingController();

  double hasil = 0; 

  String? operasi;
  List <String> operasiList = ["+","-","*","/"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalkulatot'),
        centerTitle: false,
        backgroundColor: Colors.yellow,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin:EdgeInsets.all(10),
            child: TextField(
              controller: angka1Controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Angka 1',
              )
            ),
          ),
           Container(
            margin:EdgeInsets.all(10),
            child: TextField(
              controller: angka2Controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Angka 2',
              )
            )            
          ),
          Container(
              width: double.infinity,
              margin: EdgeInsets.all(10),
              child: DropdownButton<String>(
                value:operasi,
                items: operasiList.map((String value){
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value)
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    operasi = value;
                  });
                },
              )
            ),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                child: Text('Hitung'),
                onPressed: (){
                  debugPrint('Hitung');
                  setState(() {
                    double angka1 = double.parse(angka1Controller.text);
                    double angka2 = double.parse(angka2Controller.text);


                    if(angka1Controller.text.isNotEmpty && angka2Controller.text.isNotEmpty){
                      if (operasi == '+'){
                        hasil = angka1 + angka2;
                        }
                        else if (operasi == '-'){
                          hasil = angka1 - angka2;
                        }
                        else if (operasi == '*'){
                          hasil = angka1 * angka2;
                        }
                        else if (operasi == '/'){
                          hasil = angka1 / angka2;
                        }
                        else {
                          hasil = 0;
                        }
                    }
                  });

                  
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Text('Hasil: $hasil', style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold
              )),
            )
        ],
      )
    );
  }
}