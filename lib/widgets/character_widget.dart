import 'package:flutter/material.dart';
import 'package:mimir_minions/models/character.dart';
import 'package:mimir_minions/pages/character_detail_page.dart';
import 'package:mimir_minions/styleguide.dart';

class CharacterWidget extends StatelessWidget {
  const CharacterWidget({Key? key, required this.character}) : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 350),
            pageBuilder: (context, _, __) => CharacterDetailPage(
              character: characters[0],
            ),
          ),
        );
      },
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Hero(
              tag: "background_${characters[0].name}",
              child: ClipPath(
                clipper: CharacterCardBackgroundClipper(),
                child: Container(
                  height: screenHeight * 0.6,
                  width: screenWidth * 0.9,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: characters[0].colors,
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, -0.6),
            child: Hero(
              tag: "image_${characters[0].name}",
              child: Image.asset(
                characters[0].imagePath,
                height: screenHeight * 0.55,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32, right: 8, bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Hero(
                    tag: "name_${characters[0].name}",
                    child: Material(
                        color: Colors.transparent,
                        child: Container(
                            child: Text(characters[0].name,
                                style: AppTheme.heading)))),
                Text('Tap to read more', style: AppTheme.subHeading),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CharacterCardBackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path clippedPath = Path();
    double curveDistance = 40;

    clippedPath.moveTo(0, size.height * 0.4);
    clippedPath.lineTo(0, size.height - curveDistance);
    clippedPath.quadraticBezierTo(
        1, size.height - 1, 0 + curveDistance, size.height);
    clippedPath.lineTo(size.width - curveDistance, size.height);
    clippedPath.quadraticBezierTo(size.width + 1, size.height - 1, size.width,
        size.height - curveDistance);
    clippedPath.lineTo(size.width, 0 + curveDistance);
    clippedPath.quadraticBezierTo(size.width - 1, 0,
        size.width - curveDistance - 5, 0 + curveDistance / 3);
    clippedPath.lineTo(curveDistance, size.height * 0.29);
    clippedPath.quadraticBezierTo(
        1, (size.height * 0.30) + 10, 0, size.height * 0.4);
    return clippedPath;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
