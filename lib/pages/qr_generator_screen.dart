



import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'package:qr_image_generator/qr_image_generator.dart';

class QRGeneratorScreen extends StatelessWidget{
  final TextEditingController qrText= TextEditingController();
      final generator = QRGenerator();


  @override
  Widget build(BuildContext context) {
   
    return Scaffold(

      body:Center(
        
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: qrText,
              ),

              SizedBox(height: 60,),
              ElevatedButton(onPressed:()async{
                      final Directory? downloadsDir = await getDownloadsDirectory();
          
                    
                    await generator.generate(data: qrText.text, filePath: '$downloadsDir/hello.png');
          
              
          
              } , child: Text('Generate QR'))
            ],
          ),
        ),
      )
    );
  }
}