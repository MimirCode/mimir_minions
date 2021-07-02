import 'package:flutter/material.dart';

import 'package:mimir_minions/models/character.dart';
import 'package:mimir_minions/pages/character_detail_page.dart';
import 'package:mimir_minions/styleguide.dart';

class CharacterWidget extends StatelessWidget {
  const CharacterWidget({
    Key? key,
    required this.character,
    required this.pageController,
    required this.currentpage,
  }) : super(key: key);

  final Character character;
  final PageController pageController;
  final int currentpage;

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
              character: character,
            ),
          ),
        );
      },
      child: AnimatedBuilder(
        animation: pageController,
        builder: (context, child) {
          double value = 1.0;
          if (pageController.position.haveDimensions) {
            value = (pageController.page! - currentpage);
            value = (1 - (value.abs() * 0.6)).clamp(0.0, 1.0);
          }

          return Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Hero(
                  tag: "background_${character.name}",
                  child: ClipPath(
                    clipper: CharacterCardBackgroundClipper(),
                    child: Container(
                      height: screenHeight * 0.6,
                      width: screenWidth * 0.9,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: character.colors,
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
                  tag: "image_${character.name}",
                  child: Image.asset(
                    character.imagePath,
                    height: screenHeight * 0.55 * value,
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
                      tag: "name_${character.name}",
                      child: Material(
                        color: Colors.transparent,
                        child: Container(
                          child: Text(character.name, style: AppTheme.heading),
                        ),
                      ),
                    ),
                    Text('More about ${character.name}',
                        style: AppTheme.subHeading),
                  ],
                ),
              )
            ],
          );
        },
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
