import 'package:fancy_on_boarding/fancy_on_boarding.dart';
import 'package:flutter/material.dart';

class Tour extends StatefulWidget {
  const Tour({Key? key}) : super(key: key);

  @override
  State<Tour> createState() => _TourState();
}

class _TourState extends State<Tour> {
  @override
  final pageList = [
    PageModel(
        color: const Color(0xFF678FB4),
        heroImagePath: 'assets/png/hotels.png',
        title: Text('Hotels',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.white,
              fontSize: 34.0,
            )),
        body: Text('All hotels and hostels are sorted by hospitality rating',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            )),
        iconImagePath: 'assets/png/key.png'),
    PageModel(
        color: const Color(0xFF65B0B4),
        heroImagePath: 'assets/png/banks.png',
        title: Text('Banks',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.white,
              fontSize: 34.0,
            )),
        body: Text(
            'We carefully verify all banks before adding them into the app',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            )),
        iconImagePath: 'assets/png/wallet.png'),
    PageModel(
      color: const Color(0xFF9B90BC),
      heroImagePath: 'assets/png/stores.png',
      title: Text('Store',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: Colors.white,
            fontSize: 34.0,
          )),
      body: Text('All local stores are categorized for your convenience',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          )),
      icon: Icon(
        Icons.shopping_cart,
        color: const Color(0xFF9B90BC),
      ),
    ),
    // SVG Pages Example
    PageModel(
        color: const Color(0xFF678FB4),
        heroImagePath: 'assets/svg/hotel.svg',
        title: Text('Hotels SVG',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.white,
              fontSize: 34.0,
            )),
        body: Text('All hotels and hostels are sorted by hospitality rating',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            )),
        iconImagePath: 'assets/svg/key.svg',
        heroImageColor: Colors.white),
    PageModel(
        color: const Color(0xFF65B0B4),
        heroImagePath: 'assets/svg/bank.svg',
        title: Text('Banks SVG',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.white,
              fontSize: 34.0,
            )),
        body: Text(
            'We carefully verify all banks before adding them into the app',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            )),
        iconImagePath: 'assets/svg/cards.svg',
        heroImageColor: Colors.white),
    PageModel(
      color: const Color(0xFF9B90BC),
      heroImagePath: 'assets/svg/store.svg',
      title: Text('Store SVG',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: Colors.white,
            fontSize: 34.0,
          )),
      body: Text('All local stores are categorized for your convenience',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          )),
      iconImagePath: 'assets/svg/cart.svg',
    ),
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      //Pass pageList and the mainPage route.
      body: FancyOnBoarding(
        doneButtonText: "Done",
        skipButtonText: "Skip",
        pageList: pageList,
        onDoneButtonPressed: () =>
            Navigator.of(context).pushReplacementNamed('/main'),
        onSkipButtonPressed: () =>
            Navigator.of(context).pushReplacementNamed('/main'),
      ),
    );
  }
}
