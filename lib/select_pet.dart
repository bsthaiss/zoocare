import 'package:flutter/material.dart';

class PetSelection extends StatelessWidget {
  const PetSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/fundo.png',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: <Widget>[
              const SizedBox(height: 20),
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Color(0xFF004303)),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                title: const Text(
                  'Escolha de Pet',
                  style: TextStyle(color: Color(0xFF004303)),
                ),
              ),
              const SizedBox(height: 15),
              const PetButton(
                imagePath: 'assets/raposa.png',
                petName: 'RAPOSA',
              ),
              const SizedBox(height: 10),
              const PetButton(
                imagePath: 'assets/panda.png',
                petName: 'PANDA',
              ),
              const SizedBox(height: 10),
              const PetButton(
                imagePath: 'assets/tartaruga.png',
                petName: 'TARTARUGA',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PetButton extends StatelessWidget {
  final String imagePath;
  final String petName;

  const PetButton({
    super.key,
    required this.imagePath,
    required this.petName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          padding: const EdgeInsets.all(20), // Diminui o padding
          minimumSize: const Size(double.infinity, 150), // Diminui o tamanho
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              imagePath,
              height: 80, // Diminui a altura da imagem
            ),
            const SizedBox(height: 5),
            Text(
              petName,
              style: const TextStyle(
                fontSize: 16, // Diminui a fonte
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}