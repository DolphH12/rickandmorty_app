import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:rickandmorty/animation/fade_animation.dart';
import 'package:rickandmorty/models/character_model.dart';
import 'package:rickandmorty/widgets/card.dart';

class ColumnScroll extends StatefulWidget {
  final List<Character> personajes;
  final int episodes;
  final String location;
  final Function onNextPage;

  const ColumnScroll(
      {Key? key,
      required this.onNextPage,
      required this.personajes,
      required this.episodes,
      required this.location})
      : super(key: key);

  @override
  State<ColumnScroll> createState() => _ColumnScrollState();
}

class _ColumnScrollState extends State<ColumnScroll> {
  final ScrollController _scrollController =
      ScrollController(initialScrollOffset: 50.0);
  bool loader = false;
  double k = 0;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 500 &&
          _scrollController.position.pixels > k + 1000) {
        widget.onNextPage();
        k = _scrollController.position.pixels;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.green[50],
                  borderRadius: BorderRadius.circular(8.0)),
              child: Column(
                children: [
                  const Text(
                    "LA SERIE EN NUMEROS:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  GFListTile(
                    avatar: const GFAvatar(
                        backgroundImage: AssetImage("assets/images/img1.jpg"),
                        shape: GFAvatarShape.standard),
                    titleText: '#CAPITULOS',
                    subTitleText: widget.episodes.toString(),
                  ),
                  GFListTile(
                    avatar: const GFAvatar(
                        backgroundImage: AssetImage("assets/images/img2.jpg"),
                        shape: GFAvatarShape.standard),
                    titleText: '#LOCACION CON MAS PERSONAJES ',
                    subTitleText: widget.location.isEmpty
                        ? "Encontrando..."
                        : widget.location,
                  ),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.personajes.length,
              itemBuilder: (BuildContext context, int index) {
                return FadeAnimation(
                    1.5,
                    makeItem(
                        personaje: widget.personajes[index], context: context));
              },
            ),
          ],
        ),
      ),
    );
  }
}
