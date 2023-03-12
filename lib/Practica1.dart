import 'package:flutter/material.dart';

enum memRAM {cuatro, ocho, dieciseis, treintaydos}

class Practica1 extends StatefulWidget {
  const Practica1({Key? key}) : super(key: key);

  @override
  State<Practica1> createState() => _Practica1State();
}

class _Practica1State extends State<Practica1> {

  _Practica1State(){
    _selectedValMarca = _listaMarca[0];
    _selectedValProcesador = _listaProcesador[0];
  }
  //Variables
  memRAM _status = memRAM.cuatro;
  final year = TextEditingController();
  final code = TextEditingController();
  final _listaMarca = ["OMEN", "HP", "PAVILON", "VICTUS"];
  final _listaProcesador = ["INTEL CORE", "INTEL PREMIUM", "INTEL CELERON", "AMD RIZEN"];
  String? _selectedValMarca = "OMEN";
  String? _selectedValProcesador = "INTEL";

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: const Text("Práctica 1"),
        centerTitle: true,
        actions: [
          //Botón que saca de la aplicación
          IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.exit_to_app)),
        ],),
      body: ListView(
        padding: EdgeInsets.all(30),
        children: [
          //Titulo del sitio
          Center(child: Text("OMEN", style: TextStyle(fontSize: 35, color: Colors.red, fontWeight: FontWeight.bold, fontFamily: 'Raleway'),)),
          SizedBox(height: 30),
          //Texto por promoción
          Center(child: Text("Hasta 25% OFF* + \$1,000 de descuento adicional** con cupón: ESPECIALHP",
            style: TextStyle(fontSize: 15, color: Colors.redAccent, fontWeight: FontWeight.bold),)),
          SizedBox(height: 30),
          //DropdownButton Marca del Producto
          DropdownButtonFormField(
            value: _selectedValMarca,
            items: _listaMarca.map(
                    (e) => DropdownMenuItem(child: Text(e), value: e,)
            ).toList(),
            onChanged: (val){
              setState(() {
                _selectedValMarca = val as String;
              });
            },
            icon: const Icon(Icons.arrow_drop_down_circle, color: Colors.red,),
            dropdownColor: Colors.deepOrange.shade50,
            decoration: InputDecoration(
                labelText: "Marca del producto",
                prefixIcon: Icon(
                  Icons.computer, color: Colors.red,
                ),
                border: OutlineInputBorder()
            ),
          ),
          SizedBox(height: 30),
          //DropdownButton Marca del Procesador
          DropdownButtonFormField(
            value: _selectedValProcesador,
            items: _listaProcesador.map(
                    (e) => DropdownMenuItem(child: Text(e), value: e,)
            ).toList(),
            onChanged: (val){
              setState(() {
                _selectedValProcesador = val as String;
              });
            },
            icon: const Icon(Icons.arrow_drop_down_circle, color: Colors.red,),
            dropdownColor: Colors.deepOrange.shade50,
            decoration: InputDecoration(
                labelText: "Selecciona un procesador",
                prefixIcon: Icon(
                  Icons.memory_outlined, color: Colors.red,
                ),
                border: OutlineInputBorder()
            ),
          ),
          SizedBox(height: 20),
          //MEMORIA RAM
          Center(child: Text("Selecciona la memoria RAM del dispositivo",
            style: TextStyle(fontSize: 15, color: Colors.red, fontWeight: FontWeight.bold),)),
          SizedBox(height: 10),
          //RadioButton RAM con Row
          Row( mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: RadioListTile(
                title: Text ("4"),  value: memRAM.cuatro, groupValue: _status, onChanged: (memRAM? valor){
              setState(() {
                _status = valor!;
              });
            }),),
            Expanded(child: RadioListTile(
                title: Text ("8"), value: memRAM.ocho, groupValue: _status, onChanged: (memRAM? valor){
              setState(() {
                _status = valor!;
              });
            }),),
            Expanded(child: RadioListTile(
                title: Text ("16"), value: memRAM.dieciseis, groupValue: _status, onChanged: (memRAM? valor){
              setState(() {
                _status = valor!;
              });
            }),),
            Expanded(child: RadioListTile(
                title: Text ("32"), value: memRAM.treintaydos, groupValue: _status, onChanged: (memRAM? valor){
              setState(() {
                _status = valor!;
              });
            }),),
          ],
          ),
          SizedBox(height: 5),
          //Año del equipo
          TextField(controller: year, decoration: InputDecoration(icon: Icon(Icons.new_releases_rounded),labelText:"Modelo del año")),
          SizedBox(height: 30),
          //Alerta de Felicidades
          Center(child: ElevatedButton(onPressed: (){
            showDialog(context: context, builder: (BuildContext) {
              return AlertDialog(
                title: Text("¡FELICIDADES!"),
                content: Text("Tu equipo será enviado a la dirección que nos proporcionaste",),
                backgroundColor: Colors.red.shade50,
                actions: [
                  TextButton(onPressed: (){
                    Navigator.of(context).pop();//Quita el alertDialod
                  }, child: Text("OK") )
                ],
              );
              },
            );
          }, child: const Text("Comprar el equipo")),),
          SizedBox(height: 20,),
          //Pago con tarjeta
          Row( mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.credit_card, color: Colors.black,),
              SizedBox(width: 20),
              Text("Paga hasta en 24 meses sin intereses con tarjetas participantes",
                style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),),
            ],
          ),
          SizedBox(height: 10),
          //Fotos de pago con tarjeta
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
                width: 50,
                child: Image(image: AssetImage('lib/img/Visa_Logo.png'),),
              ),
              SizedBox(width: 20),
              SizedBox(
                height: 50,
                width: 50,
                child: Image(image: AssetImage('lib/img/Mastercard.png'),),
              ),
              SizedBox(width: 20),
              SizedBox(
                height: 50,
                width: 50,
                child: Image(image: AssetImage('lib/img/AmericanExpress.png'),),
              ),
            ],
          ),
          SizedBox(height: 10),
          Center(child: Text("* El % de descuento puede variar segun las especificaciones de tu equipo")),
          Center(child: Text("** Solo pagando en una sola exhibición"))

        ],
      ),
    );

  }
}



