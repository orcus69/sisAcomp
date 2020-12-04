import 'package:flutter/material.dart';
import 'package:sisAcomp/common/customDrawer/customDrawer.dart';
import 'package:sisAcomp/screens/home/components/reminds.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      body: Stack(
        children: <Widget>[
          
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: const [
                  Color.fromARGB(255, 211, 118, 130),
                  Color.fromARGB(255, 253, 181, 168)
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter
              )
            ),
          ),
          CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                snap: true,
                floating: true,
                elevation: 0,
                backgroundColor: Colors.transparent,
                flexibleSpace: const FlexibleSpaceBar(
                  title: Text('Inicio'),
                  centerTitle: true,
                ),
                
              ),
              SliverToBoxAdapter(
                child: RemindsWidget(),
              ),
             
            ],
          ),
          
        ],
      ),
    );
  }
}