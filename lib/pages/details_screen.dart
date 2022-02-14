import 'package:flutter/material.dart';
import 'package:rickandmorty/animation/fade_animation.dart';
import 'package:rickandmorty/models/character_model.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Character personaje =
        ModalRoute.of(context)!.settings.arguments as Character;

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
          child: Hero(
        tag: personaje.id.toString(),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(personaje.image), fit: BoxFit.cover),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[400]!,
                    blurRadius: 10,
                    offset: Offset(0, 10))
              ]),
          child: Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                width: MediaQuery.of(context).size.width,
                height: 300,
                child: FadeAnimation(
                    1,
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              colors: [
                            Colors.black.withOpacity(1),
                            Colors.black.withOpacity(0),
                          ])),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          textDescription(size, personaje.name, Icons.person,
                              title: true),
                          const SizedBox(
                            height: 15,
                          ),
                          textDescription(
                              size,
                              "${personaje.status} - ${personaje.species}",
                              Icons.person),
                          const SizedBox(height: 10),
                          textDescription(size, "Genero: ${personaje.gender}",
                              Icons.accessibility),
                          const SizedBox(height: 10),
                          textDescription(
                              size, personaje.location.name, Icons.location_on),
                          const SizedBox(height: 10),
                          textDescription(
                              size,
                              " Episodios: ${personaje.episode.length}",
                              Icons.tv),
                        ],
                      ),
                    )),
              )
            ],
          ),
        ),
      )),
    );
  }

  FadeAnimation textDescription(Size size, String texto, IconData icon,
      {bool title = false}) {
    return FadeAnimation(
        1.1,
        title
            ? ConstrainedBox(
                constraints: BoxConstraints(maxWidth: size.width - 50),
                child: Text(
                  texto,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.bold),
                ),
              )
            : Row(
                children: [
                  Icon(
                    icon,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: size.width - 50),
                    child: Text(
                      texto,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ));
  }
}
