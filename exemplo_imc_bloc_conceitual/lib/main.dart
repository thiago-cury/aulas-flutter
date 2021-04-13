import 'dart:io';

import 'package:exemplo_imc_bloc_conceitual/platform/platform.dart';
import 'package:flutter/material.dart';

void main() => Platform.isIOS ? runApp(IOSApp()) : runApp(AndroidApp());

//interface exclusiva para Android e iOS - platform
//imc -> camada lógica..... BloC - bussiness logic of component