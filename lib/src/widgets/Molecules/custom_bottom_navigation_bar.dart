import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:guanare_market/src/providers/bottom_navigation_provider.dart';
import 'package:guanare_market/src/theme/palette.dart';
import 'package:provider/provider.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Palette palette = Palette();
    final size = MediaQuery.of(context).size;

    final bottomNavigationProvider =
        Provider.of<BottomNavigationProvider>(context);

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
                              bottomNavigationProvider.currentPage == 0
                                  ? 'assets/icons/home-filled.svg'
                                  : 'assets/icons/home.svg',
                              height: 26.0,
                              color: palette.primary['main'],
                              semanticsLabel: 'Home',
                            ),
                          ),
                        ),
                        onTap: () {
                          bottomNavigationProvider.currentPage = 0;
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
                                bottomNavigationProvider.currentPage == 1
                                    ? 'assets/icons/shopping-cart-filled.svg'
                                    : 'assets/icons/shopping-cart.svg',
                                color: palette.primary['main'],
                                height: 26.0,
                                semanticsLabel: 'Cart'),
                          ),
                        ),
                        onTap: () {
                          bottomNavigationProvider.currentPage = 1;
                        }),
                  ),
                ],
              ),
            )
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
    path_0.quadraticBezierTo(size.width * 0.2323417, size.height * -0.0015000,
        size.width * 0.3162250, 0);
    path_0.cubicTo(
        size.width * 0.3987667,
        size.height * -0.0013125,
        size.width * 0.3620083,
        size.height * 0.6600000,
        size.width * 0.5003500,
        size.height * 0.6637812);
    path_0.cubicTo(
        size.width * 0.6330250,
        size.height * 0.6590312,
        size.width * 0.5992250,
        size.height * -0.0070625,
        size.width * 0.6824333,
        0);
    path_0.quadraticBezierTo(
        size.width * 0.7654917, size.height * -0.0056562, size.width, 0);
    path_0.lineTo(size.width, size.height);

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
