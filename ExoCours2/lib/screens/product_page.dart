import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Image.network(
          'assets/photo_entete.jpg',
          height: 300,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),   
              topRight: Radius.circular(16),  
            ),
          ),
        
          padding: const EdgeInsets.only(
            top: 30,      
            left: 20,    
            right: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Petits pois et carottes',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const Text(
                'Cassegrain',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
