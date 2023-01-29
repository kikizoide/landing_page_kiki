import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:landing_page_kiki/utils/app_assets.dart';

import '../utils/app_color.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Image.asset(
              AppAssets.background,
              fit: BoxFit.contain,
            ).image,
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.4),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: const Offset(0, 0),
                blurRadius: 15,
                spreadRadius: 15,
              ),
            ],
          ),
    child: BackdropFilter(
    filter: ImageFilter.blur(
    sigmaX: 5,
    sigmaY: 5,
    tileMode: TileMode.decal,
    ),
        child: ListView(
        shrinkWrap: true,
          children: [
            _headerWidget(),
            _bodyWidget(),
           ],
          ),
    ),
        )
        ),
      );
  }

  Widget _bodyWidget() {
    return Stack(
      children: [
        Positioned(child: _forgroundImageWidget()),
        _textContainer(),
      ],
    );
  }

  Widget _forgroundImageWidget() {
    return Image.asset(
      AppAssets.forground,
      fit: BoxFit.contain,
    );
  }

  Widget _textContainer() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 40,
      ).copyWith(top: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          RichText(text: TextSpan(
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            children: [
              const TextSpan(text: "Viaje com a"),
              TextSpan(
                text: " Kiki",
                style: TextStyle(color: AppColors.primary),
              ),
              const TextSpan(text: " e"),
              TextSpan(
                text: " Descubra",
                style: TextStyle(color: AppColors.primary),
              ),
              const TextSpan(text: " o Mundo"),
            ],
          ),),
          const SizedBox(
            height: 50,
          ),

          RichText(
            text: TextSpan(
              style: const TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
              ),
              children: [
                const TextSpan(text: "Entre para a"),
                TextSpan(
                  text: " Maior\nComunidade",
                  style: TextStyle(color: AppColors.primary),
                ),
                const TextSpan(text: " de\nViajantes"),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 50,
                width: 250,
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Destino",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(AppColors.primary),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  child: const Icon(
                    Icons.navigate_next,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _headerWidget() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Row(
        children: [
          _logoWidget(),
          const Spacer(),
          _menuWidget("Home", isSelected: true),
          _menuWidget("Minhas Viagens"),
          _menuWidget("Destino"),
          _menuWidget("Fale Conosco"),
          SizedBox(
            height: 40,
            child: ElevatedButton(
              onPressed: () {},
                style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(AppColors.primary),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              child: const Text(
                "Login",
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _menuWidget(String text, {bool isSelected = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Text(
        text,
        style: TextStyle(
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            fontSize: 20,
            color: isSelected ? AppColors.primary : Colors.black),
      ),
    );
  }

  Widget _logoWidget() {
    return Image.asset(
      AppAssets.appLogo,
      height: 100,
    );
  }
}