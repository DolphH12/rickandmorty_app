import 'package:flutter/material.dart';
import 'package:rickandmorty/animation/fade_animation.dart';
import 'package:rickandmorty/models/character_model.dart';
import 'package:rickandmorty/pages/details_screen.dart';

Widget makeItem({required Character personaje, context}) {
  final size = MediaQuery.of(context).size;

  return Hero(
    tag: personaje.id.toString(),
    child: GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'details', arguments: personaje);
      },
      child: Container(
        height: 250,
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(bottom: 20),
        child: Stack(children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey[400]!,
                      blurRadius: 10,
                      offset: const Offset(0, 10))
                ]),
            child: FadeInImage(
              height: double.infinity,
              width: double.infinity,
              placeholder: AssetImage('assets/images/loader.gif'),
              image: NetworkImage(personaje.image),
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 120),
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromRGBO(0, 0, 0, 0.6),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 10))
                ]),
          ),
          Container(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FadeAnimation(
                        1,
                        ConstrainedBox(
                          constraints:
                              BoxConstraints(maxWidth: size.width - 120),
                          child: Text(
                            personaje.name,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.ellipsis),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )),
                    const SizedBox(
                      height: 3,
                    ),
                    FadeAnimation(
                        1.1,
                        Row(
                          children: [
                            const Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            ConstrainedBox(
                              constraints:
                                  BoxConstraints(maxWidth: size.width - 120),
                              child: Text(
                                "${personaje.status} - ${personaje.species}",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        )),
                    FadeAnimation(
                        1.1,
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            ConstrainedBox(
                              constraints:
                                  BoxConstraints(maxWidth: size.width - 120),
                              child: Text(
                                personaje.location.name,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              ],
            ),
          ),
        ]),
      ),
    ),
  );
}
