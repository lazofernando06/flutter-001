import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_app_001/models/band.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Band> bands = [
    Band(id: '1', name: 'Metallica', vote: 5),
    Band(id: '2', name: 'Queen', vote: 5),
    Band(id: '3', name: 'Geroes del silencio', vote: 5),
    Band(id: '4', name: 'Molotov', vote: 5),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BandNames',
          style: TextStyle(
            color: Colors.black87,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: ListView.builder(
        itemCount: bands.length,
        itemBuilder: (context, i) => _bandTile(bands[i]),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: addNewBand,
        elevation: 1,
      ),
    );
  }

  Widget _bandTile(Band band) {
    return Dismissible(
      key: Key(band.id),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction) {
        print('direction:$direction');
        print('id:${band.id}');
      },
      background: Container(
        padding: EdgeInsets.only(left: 8.0),
        color: Colors.red,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Delete Band',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(
            band.name.substring(0, 2),
          ),
          backgroundColor: Colors.blue[100],
        ),
        title: Text(band.name),
        trailing: Text(
          '${band.vote}',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  addNewBand() {
    final textController = TextEditingController();
    if (Platform.isAndroid) {
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('New band nema:'),
            content: TextField(
              controller: textController,
            ),
            actions: [
              MaterialButton(
                child: Text('Add'),
                elevation: 5,
                textColor: Colors.blue,
                onPressed: () => addBandToList(textController.text),
              ),
              MaterialButton(
                child: Text('Dismiss'),
                elevation: 5,
                textColor: Colors.red,
                onPressed: () => Navigator.pop(context),
              ),
            ],
          );
        },
      );
    }
    if (Platform.isIOS) {
      return showCupertinoDialog(
          context: context,
          builder: (_) {
            return CupertinoAlertDialog(
              title: Text('New band name:'),
              content: CupertinoTextField(
                controller: textController,
              ),
              actions: [
                CupertinoDialogAction(
                  isDefaultAction: true,
                  child: Text('Add'),
                  onPressed: () => addBandToList(textController.text),
                ),
                CupertinoDialogAction(
                  isDestructiveAction: true,
                  child: Text('Dismiss'),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            );
          });
    }
  }

  addBandToList(String name) {
    print(name);
    if (name.length > 1) {
      this.bands.add(
            Band(
              id: DateTime.now().toString(),
              name: name,
              vote: 0,
            ),
          );
      setState(() {});
    }

    Navigator.pop(context);
  }
}
