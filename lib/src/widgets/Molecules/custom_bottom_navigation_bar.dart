import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:guanare_market/src/pages/cart_page.dart';
import 'package:guanare_market/src/pages/home_page.dart';
import 'package:guanare_market/src/theme/palette.dart';
import 'package:guanare_market/src/utils/get_assets.dart' show getIcon;

class CustomBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Palette palette = Palette();
    final size = MediaQuery.of(context).size;
    final routeName = ModalRoute.of(context)!.settings.name;

    return Container(
      height: 80,
      width: size.width,
      child: DecoratedBox(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 60.0,
            spreadRadius: 1,
            offset: Offset(0.0, 0.0),
          )
        ]),
        child: Stack(
          children: [
            CustomPaint(
              size: Size(
                  size.width, (size.width * 0.26666666666666666).toDouble()),
              painter: RPSCustomPainter(),
            ),
            Container(
              height: 80,
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
              width: size.width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                        borderRadius: BorderRadius.circular(100.0),
                        child: Container(
                          height: 60.0,
                          width: 60.0,
                          padding: EdgeInsets.all(10.0),
                          child: Center(
                            child: SvgPicture.asset(
                              routeName == 'home'
                                  ? getIcon('home-filled')
                                  : getIcon('home'),
                              height: 26.0,
                              color: palette.primary['main'],
                              semanticsLabel: 'Home',
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            PageRouteBuilder(
                                pageBuilder: (_, __, ___) => HomePage(),
                                transitionDuration: Duration(seconds: 0),
                                settings: RouteSettings(name: 'home')),
                          );
                        }),
                  ),
                  Spacer(),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                        borderRadius: BorderRadius.circular(100.0),
                        child: Container(
                          height: 60.0,
                          width: 60.0,
                          padding: EdgeInsets.all(10.0),
                          child: Center(
                            child: SvgPicture.asset(
                                routeName == 'cart'
                                    ? getIcon('shopping-cart-filled')
                                    : getIcon('shopping-cart'),
                                color: palette.primary['main'],
                                height: 26.0,
                                semanticsLabel: 'Cart'),
                          ),
                        ),
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            PageRouteBuilder(
                                pageBuilder: (_, __, ___) => CartPage(),
                                transitionDuration: Duration(seconds: 0),
                                settings: RouteSettings(name: 'cart')),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path_0 = Path();
    path_0.moveTo(0, size.height);
    path_0.lineTo(0, 0);
    path_0.quadraticBezierTo(size.width * 0.2407167, size.height * -0.0010313,
        size.width * 0.3245167, 0);
    path_0.cubicTo(
        size.width * 0.4080750,
        size.height * -0.0086563,
        size.width * 0.3639917,
        size.height * 0.5814063,
        size.width * 0.5000333,
        size.height * 0.5988125);
    path_0.cubicTo(
        size.width * 0.6325167,
        size.height * 0.5832500,
        size.width * 0.5930750,
        size.height * -0.0165000,
        size.width * 0.6762833,
        size.height * 0.0005937);
    path_0.quadraticBezierTo(
        size.width * 0.7585500, size.height * -0.0014375, size.width, 0);
    path_0.lineTo(size.width, size.height);

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
