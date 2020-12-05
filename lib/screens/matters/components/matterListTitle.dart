import 'package:flutter/material.dart';
import 'package:sisAcomp/models/matter.dart';

class MatterListTile extends StatelessWidget {

  MatterListTile(this.matter);

  final Matter matter;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4)
      ),
      child: Container(
        height: 100,
        padding: const EdgeInsets.all(8),
        child: Row(
          children: <Widget>[
            //Imagem da matéria
            AspectRatio(
              aspectRatio: 1,
              child: Image.network(matter.images.first),
            ),
            const SizedBox(width: 16,),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    matter.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      'Cursando',
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Text(
                    '90%',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                      color: Theme.of(context).primaryColor
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}