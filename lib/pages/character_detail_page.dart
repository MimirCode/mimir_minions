import 'package:flutter/material.dart';
import 'package:mimir_minions/models/character.dart';
import 'package:mimir_minions/styleguide.dart';

class CharacterDetailPage extends StatefulWidget {
  final Character character;

  const CharacterDetailPage({
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  _CharacterDetailPageState createState() => _CharacterDetailPageState();
}

class _CharacterDetailPageState extends State<CharacterDetailPage> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Hero(
            tag: "background_${widget.character.name}",
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
                gradient: LinearGradient(
                  colors: widget.character.colors,
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 56.0, 0, 0),
                  child: IconButton(
                    icon: Icon(
                      Icons.close,
                    ),
                    iconSize: 48,
                    color: Colors.white.withOpacity(0.8),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Hero(
                    tag: "image_${widget.character.name}",
                    child: Image.asset(
                      widget.character.imagePath,
                      height: screenHeight * 0.45,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8),
                  child: Hero(
                      tag: "name_${widget.character.name}",
                      child: Material(
                          color: Colors.transparent,
                          child: Container(
                              child: Text(widget.character.name,
                                  style: AppTheme.heading)))),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 0, 32.0, 24.0),
                  child: Text(widget.character.description,
                      style: AppTheme.subHeading),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
