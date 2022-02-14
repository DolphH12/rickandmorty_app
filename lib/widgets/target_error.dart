import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class TargetError extends StatelessWidget {
  TargetError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 500,
        child: GFCard(
          elevation: 10,
          boxFit: BoxFit.cover,
          titlePosition: GFPosition.start,
          image: Image.asset(
            'assets/images/error.gif',
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          showImage: true,
          title: const GFListTile(
            avatar: GFAvatar(
              backgroundImage: AssetImage('assets/images/img2.jpg'),
            ),
            titleText: 'EQUIPO DE DESARROLLO',
          ),
          content: const Text(
            "Lo sentimos, al parecer los datos han cambiado de dimension, regrese luego que Rick y Morty los encuentren. \n\n¡HASTA PRONTO!",
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
