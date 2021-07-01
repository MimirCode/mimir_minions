import 'package:flutter/material.dart';
import 'package:mimir_minions/models/character.dart';
import 'package:mimir_minions/styleguide.dart';
import 'package:mimir_minions/widgets/character_widget.dart';

class CharacterListingPage extends StatefulWidget {
  CharacterListingPage({Key? key}) : super(key: key);

  @override
  _CharacterListingPageState createState() => _CharacterListingPageState();
}

class _CharacterListingPageState extends State<CharacterListingPage> {
  late PageController _pageController;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: 1.0,
      initialPage: currentPage,
      keepPage: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios_new),
        actions: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Icon(Icons.search),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 32.0, top: 8.0),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: 'Despicable me!', style: AppTheme.display1),
                      TextSpan(text: '\n'),
                      TextSpan(text: 'Characters', style: AppTheme.display2),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  children: [
                    for (var i = 0; i < characters.length; i++)
                      CharacterWidget(
                        character: characters[i],
                      )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
