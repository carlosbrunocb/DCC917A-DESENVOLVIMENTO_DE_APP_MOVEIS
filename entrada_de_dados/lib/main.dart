import 'package:entrada_de_dados/CampoTexto.dart';
import 'package:entrada_de_dados/EntradaCheckbox.dart';
import 'package:entrada_de_dados/EntradaRadioButton.dart';
import 'package:entrada_de_dados/EntradaSlider.dart';
import 'package:entrada_de_dados/EntradaSwitch.dart';
import 'package:flutter/material.dart';


void main(){
  runApp(
    MaterialApp(
      // home: CampoTexto(),
      // home: EntradaCheckbox(),
      // home: EntradaRadioButton(),
      // home: EntradaSwitch(),
      home: EntradaSlider(),
    )
  );
}