import 'dart:io';

import 'package:flutter/material.dart';
import 'package:imc_block/ios/iosapp.dart';

import 'android/androidapp.dart';

void main() => Platform.isIOS ? runApp(IOSApp()) : runApp(AndroidApp());

// void main() => Platform.isIOS ? runApp(IOSApp()) : runApp(AndroidApp());