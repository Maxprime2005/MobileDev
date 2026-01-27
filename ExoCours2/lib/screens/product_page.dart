import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
     return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Image.asset(
          'assets/photo_entete.jpg',
          height: 1000,
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
            bottom: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Avocado Toast',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const Text(
                'Grand Restaurant de petit dej',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                const InfoLigne(
                  libelle: 'Format',
                  valeur: '200g',
                ),
                
                const InfoLigne(
                  libelle: 'Orgine',
                  valeur: 'France',
                  showDivider: false, // On cache le dernier séparateur
                ),
                ],
          ),
        ),
      ],     
     ),
    ),
    ],
    );
  }
}

class InfoLigne extends StatelessWidget {
  final String libelle;
  final String valeur;
  final bool showDivider; // Le séparateur optionnel

  const InfoLigne({
    super.key,
    required this.libelle,
    required this.valeur,
    this.showDivider = true, // Par défaut, on l'affiche
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                libelle,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Text(
                valeur,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
        ),
        if (showDivider)
          const Divider(height: 1, thickness: 1, color: Color(0xFFEEEEEE)),
      ],
    );
  }
}