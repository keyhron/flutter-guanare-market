import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:guanare_market/src/models/menu_model.dart';
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
                  child: ListView.separated(
                    itemCount: links.length,
                    separatorBuilder: (context, i) {
                      return SizedBox(
                        height: 6,
                      );
                    },
                    itemBuilder: (BuildContext context, int i) {
                      return LinkMenu(links[i]);
                    },
                  ),
                ),
              )
            ],
          )),
    );
  }
}

class LinkMenu extends StatelessWidget {
  final Menu link;

  LinkMenu(this.link);

  @override
  Widget build(BuildContext context) {
    return Container(
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
            SvgPicture.asset(link.icon,
                width: 24,
                height: 24,
                color: palette.secondary['main'],
                semanticsLabel: link.title),
            SizedBox(
              width: 20,
            ),
            Text(
              link.title,
              style: TextStyle(fontSize: 18, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
