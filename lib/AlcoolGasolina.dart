import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AlcoolGasolina extends StatefulWidget {
  @override
  _AlcoolGasolinaState createState() => _AlcoolGasolinaState();
}

class _AlcoolGasolinaState extends State<AlcoolGasolina> {

  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();

  String _resultado = "";

  void _calcular(){
    
    try{    
    double precoAlcool = double.tryParse(_controllerAlcool.text.replaceAll(",", "."));
    double precoGasolina = double.tryParse(_controllerGasolina.text.replaceAll(",", "."));

    if(precoAlcool != null || precoGasolina != null){
      if((precoAlcool / precoGasolina) >= 0.7){
        setState(() {
          _resultado = "Melhor abastecer com Gasolina";
        });
      }
      else{
        setState(() {
          _resultado = "Melhor abastecer com Álcool";
        });
      }
    }
    else{
      setState(() {
        _resultado = "Por favor, preencha todos os campos utilizando ponto(.)";
      });
    }

    }
    catch(Exception){
      setState(() {
        _resultado = "Por favor, preencha todos os campos com números.";        
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou Gasolina"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 32),
                  child: Image.asset("images/logo.png"),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom:10),
                  child: Text(
                        "Saiba qual a melhor opção para abastecimento do seu carro",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold
                        )
                      )
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Preço do Álcool, ex: 1.59"
                  ),
                  style: TextStyle(
                    fontSize: 22, 
                  ),
                  controller: _controllerAlcool,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Preço do Gasolina, ex: 3.89"
                  ),
                  style: TextStyle(
                    fontSize: 22,
                  ),
                  controller: _controllerGasolina,
                ),
                Padding(
                  padding: EdgeInsets.only(top:10),
                  child: RaisedButton(
                    padding: EdgeInsets.all(15),
                    child: Text("Calcular",
                      style: TextStyle(
                        fontSize: 20
                      ),
                    ),
                    textColor: Colors.white,
                    color: Colors.blueAccent,
                    onPressed: _calcular,
                  )
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    _resultado,
                    style: TextStyle(
                      fontSize: 22,
                      fontStyle: FontStyle.italic
                    )
                  ),
                )

            ], 
          ),
        )
      )
    );
  }
}