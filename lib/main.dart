import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Perfilpage(),
    );
  }
}

class Perfilpage extends StatefulWidget {
    const Perfilpage({super.key});

    @override
    State<Perfilpage> createState() => _PerfilpageState();
}

class _PerfilpageState extends State<Perfilpage> {

  final ImagePicker picker = ImagePicker();

  File? fotoperfil;

  Future<void> escolherDaGaleria() async{

    final XFile? imagem = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if(imagem == null){
      return;
    }
    setState(() {
      fotoperfil = File(imagem.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meu Perfil"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 60,
              child: Icon(Icons.person, size: 70)
            ),
            const SizedBox(height: 20,),

            const Text(
              'Leandro',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 8,),

            const Text('leandro@gmail.com'),

            const SizedBox(height: 10,),

            ElevatedButton.icon(
              onPressed: escolherDaGaleria, 
              icon: const Icon(Icons.camera_alt),
              label: const Text("Alterar Foto"),
            )
          ]
        ) 
      )
    );
  } 
}
