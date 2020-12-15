import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sisAcomp/common/customDrawer/customDrawer.dart';
import 'package:sisAcomp/models/matter.dart';
import 'package:sisAcomp/models/matterManager.dart';
import 'package:sisAcomp/screens/matters/components/mattersListTitle.dart';
import 'package:sisAcomp/screens/matters/components/searchDialog.dart';

class MattersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Consumer<MatterManager>(
          builder: (_, matterManager, __){
            if(matterManager.search.isEmpty){
              return const Text('Matérias');
            } else {
              return LayoutBuilder(
                builder: (_, constraints){
                  return GestureDetector(
                    onTap: () async {
                      final search = await showDialog<String>(context: context,
                          builder: (_) => SearchDialog(matterManager.search));
                      if(search != null){
                        matterManager.search = search;
                      }
                    },
                    child: Container(
                      width: constraints.biggest.width,
                      child: Text(
                        matterManager.search,
                        textAlign: TextAlign.center,
                      )
                    ),
                  );
                },
              );
            }
          },
        ),
        centerTitle: true,
        actions: <Widget>[
          Consumer<MatterManager>(
            builder: (_, matterManager, __){
              if(matterManager.search.isEmpty){
                return IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () async {
                    final search = await showDialog<String>(context: context,
                        builder: (_) => SearchDialog(matterManager.search));
                    if(search != null){
                      matterManager.search = search;
                    }
                  },
                );
              } else {
                return IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () async {
                    matterManager.search = '';
                  },
                );
              }
            }
          ),
        ],
      ),
      body: Consumer<MatterManager>(
        builder: (_, matterManager, __){
          final filteredMatters = matterManager.filteredMatters;
          
          return ListView.builder(
            padding: const EdgeInsets.all(4),
            itemCount: filteredMatters.length,
            itemBuilder: (_, index){
              return MatterListTile(filteredMatters[index]);
            }
          );
        },
      ),
    );
  }
}