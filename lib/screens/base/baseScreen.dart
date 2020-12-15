import 'package:flutter/material.dart';
import 'package:sisAcomp/common/customDrawer/customDrawer.dart';
import 'package:provider/provider.dart';
import 'package:sisAcomp/models/pageManager.dart';
import 'package:sisAcomp/screens/home/homeScreen.dart';
import 'package:sisAcomp/screens/login/loginScreen.dart';
import 'package:sisAcomp/screens/matters/matterScreen.dart';

class BaseScreen extends StatelessWidget {

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => PageManager(pageController),
      child: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          HomeScreen(),
          MattersScreen(),
          Scaffold(
            drawer: CustomDrawer(),
            appBar: AppBar(
              title: const Text('Frequencia'),
            ),
          ),
          Scaffold(
            drawer: CustomDrawer(),
            appBar: AppBar(
              title: const Text('Documentos'),
            ),
          ),
        ],
      ),
    );
  }
}