import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:guanare_market/src/theme/palette.dart';
import 'package:guanare_market/src/theme/theme_light.dart';

// Widgets
import 'package:guanare_market/src/widgets/Molecules/custom_appbar.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Palette().primary['main'],
      body: Container(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              Navbar(
                title: 'Guanare Market',
                subtitle: 'Menú de navegación',
                dark: true,
              ),
              SizedBox(
                height: 40,
              ),
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Container(
                  width: 300,
                  height: size.height * 0.813,
                  child: Column(
                    children: [
                      Container(
                        height: 60,
                        width: double.infinity,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                              primary: Colors.white,
                              padding: EdgeInsets.only(left: 20),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/icons/shopping-bag.svg',
                                  width: 24,
                                  height: 24,
                                  color: palette.secondary['main'],
                                  semanticsLabel: 'Search'),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                'Productos',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Container(
                        height: 60,
                        width: double.infinity,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                              primary: Colors.white,
                              padding: EdgeInsets.only(left: 20),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/icons/check-circle.svg',
                                  width: 24,
                                  height: 24,
                                  color: palette.secondary['main'],
                                  semanticsLabel: 'Buy steps'),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                'Pasos para comprar',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Container(
                        height: 60,
                        width: double.infinity,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                              primary: Colors.white,
                              padding: EdgeInsets.only(left: 20),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/icons/check-square.svg',
                                  width: 24,
                                  height: 24,
                                  color: palette.secondary['main'],
                                  semanticsLabel: 'Sell steps'),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                'Pasos para vender',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Container(
                        height: 60,
                        width: double.infinity,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                              primary: Colors.white,
                              padding: EdgeInsets.only(left: 20),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/icons/gift.svg',
                                  width: 24,
                                  height: 24,
                                  color: palette.secondary['main'],
                                  semanticsLabel: 'Donations'),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                'Donaciones',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Container(
                        height: 60,
                        width: double.infinity,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                              primary: Colors.white,
                              padding: EdgeInsets.only(left: 20),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/icons/users.svg',
                                  width: 24,
                                  height: 24,
                                  color: palette.secondary['main'],
                                  semanticsLabel: 'About us'),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                '¿Quienes somos?',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
