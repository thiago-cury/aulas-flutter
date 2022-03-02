// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:tesseract_ocr/tesseract_ocr.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   bool _scanning = false;
//   String _extractText = '';
//   int _scanTime = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//           appBar: AppBar(
//             title: const Text('Tesseract OCR'),
//           ),
//           body: Container(
//             padding: EdgeInsets.all(16),
//             child: ListView(
//               children: <Widget>[
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     RaisedButton(
//                       child: Text('Select image'),
//                       onPressed: () async {
//                         var file =
//                         await FilePicker.getFilePath(type: FileType.image);
//                         _scanning = true;
//                         setState(() {});
//
//                         var watch = Stopwatch()..start();
//                         _extractText = await TesseractOcr.extractText(file);
//                         _scanTime = watch.elapsedMilliseconds;
//
//                         _scanning = false;
//                         setState(() {});
//                       },
//                     ),
//                     // It doesn't spin, because scanning hangs thread for now
//                     _scanning
//                         ? SpinKitCircle(
//                       color: Colors.black,
//                     )
//                         : Icon(Icons.done),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 16,
//                 ),
//                 Text(
//                   'Scanning took $_scanTime ms',
//                   style: TextStyle(color: Colors.red),
//                 ),
//                 SizedBox(
//                   height: 16,
//                 ),
//                 Center(child: SelectableText(_extractText)),
//               ],
//             ),
//           )),
//     );
//   }
// }

//### TESTE 1 - sem CROP
//
// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:tesseract_ocr/tesseract_ocr.dart';
// import 'package:image_picker/image_picker.dart';
//
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   bool _scanning = false;
//   String _extractText = '';
//   int _scanTime = 0;
//
//   final ImagePicker _picker = ImagePicker();
//   PickedFile _imageFile = null;
//
//   Widget _loadPreviewImage(int button) {
//     switch(button) {
//       case 1:
//
//         if(_imageFile == null) {
//           return Text("Aguardando leitura", style: TextStyle(color: Colors.blue));
//         } else {
//           return Image.file(File(_imageFile.path));
//         }
//         break;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//           appBar: AppBar(
//             title: const Text('Demo Incoterm OCR'),
//           ),
//           body: Container(
//             padding: EdgeInsets.all(16),
//             child: ListView(
//               children: <Widget>[
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Container(
//                         color: Colors.black12,
//                         height: 100.0,
//                         width: 100.0,
//                         alignment: Alignment.center,
//                         child: _loadPreviewImage(1)
//                     ),
//                     RaisedButton(
//                       child: Text('Leitura automática'),
//                       onPressed: () async {
//
//                         await _openCamera(context, 1);
//
//                       },
//                     ),
//                     // It doesn't spin, because scanning hangs thread for now
//                     _scanning
//                         ? SpinKitCircle(
//                       color: Colors.black,
//                     )
//                         : Icon(Icons.done),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 16,
//                 ),
//                 Text(
//                   'Tempo para ler imagem $_scanTime ms',
//                   style: TextStyle(color: Colors.red),
//                 ),
//                 SizedBox(
//                   height: 16,
//                 ),
//                 Center(child: SelectableText(_extractText)),
//               ],
//             ),
//           )
//       ),
//     );
//   }
//
//   void _openCamera(BuildContext context, int button) async {
//
//     try {
// //      var picture = await _picker.getImage(source: ImageSource.camera,);
//       var picture = await _picker.getImage(source: ImageSource.camera, maxWidth: 600.00, maxHeight: 400.00, imageQuality: 100);
//
//       setState(() async {
//         switch(button) {
//           case 1:
//             _imageFile = picture;
//             var file = _imageFile.path;
//
//             _scanning = true;
//             setState(() {});
//
//             var watch = Stopwatch()..start();
//             _extractText = await TesseractOcr.extractText(file);
//
//             _scanTime = watch.elapsedMilliseconds;
//
//             _scanning = false;
//             setState(() {});
//             break;
//         }
//       });
//     } catch (error) {
//       setState(() {
//         print(error.toString());
//       });
//     }
//   }
//
// }

//### TESTE 2 - COM CROP

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:tesseract_ocr/tesseract_ocr.dart';
import 'package:image_picker/image_picker.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

enum AppState {
  free,
  picked,
  cropped,
}

class _MyAppState extends State<MyApp> {
  bool _scanning = false;
  String _extractText = '';
  int _scanTime = 0;

  final ImagePicker _picker = ImagePicker();
  AppState state;
  File _imageFile = null;

  Widget _loadPreviewImage(int button) {
    switch(button) {
      case 1:

        if(_imageFile == null) {
          return Text("Aguardando leitura", style: TextStyle(color: Colors.blue));
        } else {
          return Image.file(File(_imageFile.path));
        }
        break;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    state = AppState.free;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Demo Incoterm OCR'),
          ),
          body: Container(
            padding: EdgeInsets.all(16),
            child: ListView(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        color: Colors.black12,
                        height: 100.0,
                        width: 100.0,
                        alignment: Alignment.center,
                        child: _loadPreviewImage(1)
                    ),
                    RaisedButton(
                      child: Text('Leitura automática'),
                      onPressed: () async {

                        if (state == AppState.free)
                          _pickImage();
                        else if (state == AppState.picked)
                          _cropImage();
                        else if (state == AppState.cropped) _clearImage();

                      },
                    ),
                    // It doesn't spin, because scanning hangs thread for now
                    _scanning
                        ? SpinKitCircle(
                      color: Colors.black,
                    )
                        : Icon(Icons.done),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Tempo para ler imagem $_scanTime ms',
                  style: TextStyle(color: Colors.red),
                ),
                SizedBox(
                  height: 16,
                ),
                Center(child: SelectableText(_extractText)),
              ],
            ),
          )
      ),
    );
  }

  Future<Null> _pickImage() async {
    _imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (_imageFile != null) {
      setState(() {
        state = AppState.picked;
        print("entrou no picked");
      });
    }
  }

  Future<Null> _cropImage() async {
    File croppedFile = await ImageCropper.cropImage(
        sourcePath: _imageFile.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ]
            : [
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio5x3,
          CropAspectRatioPreset.ratio5x4,
          CropAspectRatioPreset.ratio7x5,
          CropAspectRatioPreset.ratio16x9
        ],
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        iosUiSettings: IOSUiSettings(
          title: 'Cropper',
        ));
    if (croppedFile != null) {
      _imageFile = croppedFile;
      setState(() async {
        state = AppState.cropped;

        print("entrou no cropped");

        //Tesseract OCR
        _scanning = true;
        setState(() {});
        var watch = Stopwatch()..start();
        _extractText = await TesseractOcr.extractText(_imageFile.path);
        _scanTime = watch.elapsedMilliseconds;
        _scanning = false;
        setState(() {});
        //Tesseract OCR
      });
    }
  }

  void _clearImage() {
    _imageFile = null;
    setState(() {
      state = AppState.free;
    });
  }

}