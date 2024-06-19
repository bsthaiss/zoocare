import 'package:flutter/material.dart';

class AnimalScreen extends StatelessWidget {
  const AnimalScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    final animalName = args['animalName'];

    // Map for animal images
    final animalImages = {
      'Panda': 'assets/panda_g.png',
      'Raposa': 'assets/raposa_g.png',
      'Tartaruga': 'assets/tartaruga_g.png',
    };

    final animalAsset = animalImages[animalName];

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Image.asset('assets/logo_zoocare.png', height: 25),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Image.asset('assets/seta_icone.png'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/fundo.png',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(height: 80), // Spacing below the logo
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildStatusIcon('assets/moedas.png', ''),
                    _buildStatusIcon('assets/nivel.png', ''),
                    _buildStatusIcon('assets/configuracoes.png', ''),
                  ],
                ),
                Expanded(
                  child: Center(
                    child: Image.asset(
                      animalAsset!,
                      height: 200,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildBottomButton(
                      context,
                      'assets/talheres.png',
                      'Comida',
                      '/food',
                      {'animalAsset': animalAsset, 'animalName': animalName},
                    ),
                    _buildBottomButton(
                      context,
                      'assets/banho.png',
                      'Banho',
                      '/bath',
                      {'animalAsset': animalAsset, 'animalName': animalName},
                    ),
                    _buildBottomButton(
                      context,
                      'assets/home.png',
                      'Casa',
                      '/animal_screen', // Keep user on the same screen
                      {'animalAsset': animalAsset, 'animalName': animalName},
                    ),
                    _buildBottomButton(
                      context,
                      'assets/controlador.png',
                      'Brincar',
                      '/mini_games',
                      {'animalAsset': animalAsset, 'animalName': animalName},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusIcon(String assetPath, String text) {
    return Row(
      children: [
        Image.asset(assetPath, height: 24),
        const SizedBox(width: 5),
        Text(text,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildBottomButton(BuildContext context, String assetPath,
      String label, String route, Map arguments) {
    return Column(
      children: [
        Container(
          width: 65,
          height: 65,
          decoration: BoxDecoration(
            color: const Color(0xFF19C915),
            borderRadius: BorderRadius.circular(10),
          ),
          child: IconButton(
            icon: Image.asset(assetPath),
            iconSize: 40,
            onPressed: () {
              Navigator.pushNamed(context, route, arguments: arguments);
            },
          ),
        ),
        const SizedBox(height: 5),
        Text(label,
            style: const TextStyle(
                color: Colors.green, fontWeight: FontWeight.bold)),
      ],
    );
  }
}