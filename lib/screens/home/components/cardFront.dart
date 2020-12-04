import 'package:flutter/material.dart';
import 'package:sisAcomp/screens/home/components/cardTextField.dart';

class CardFront extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 16,
      child: Container(
        height: 200,
        color: const Color(0xFF1B4B52),
        padding: const EdgeInsets.all(24),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  CardTextField(
                    title: 'Assunto',
                    hint: 'Fulano',
                    textInputType: TextInputType.text,
                    bold: true,
                  ),
                  CardTextField(
                    title: 'Mensagem',
                    hint: 'hintText',
                    textInputType: TextInputType.text,
                  ),
                  CardTextField(
                    title: 'Data',
                    hint: '12/12/2020',
                    textInputType: TextInputType.text,
                    bold: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}