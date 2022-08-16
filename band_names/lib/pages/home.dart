import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:band_names/model/band.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Band> bands = [
    Band(id: '1', name: 'Metallica', votes: 5),
    Band(id: '2', name: 'Nirvana', votes: 2),
    Band(id: '3', name: 'Heroes del silencia', votes: 5),
    Band(id: '4', name: 'Bon Jovi', votes: 4),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 1,
          title:
              const Text('BandNames', style: TextStyle(color: Colors.black87)),
          backgroundColor: Colors.white),
      body: ListView.builder(
          itemCount: bands.length,
          itemBuilder: (context, index) => _bandTile(bands[index])),
      floatingActionButton: FloatingActionButton(
        elevation: 1,
        onPressed: addNewBand, // se envia como referencia
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _bandTile(Band band) {
    return Dismissible(
      key: Key(band.id),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction) {
        print('Direction: $direction');
        // TODO: llamar al borrado en el servidor
      },
      background: Container(
        padding: const EdgeInsets.only(left: 8.0),
        color: Colors.red,
        child: const Align(
          alignment: Alignment.centerLeft,
          child: Text('Delete Band', style: TextStyle(color: Colors.white),),
        ),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue[100],
          child: Text(band.name.substring(0, 2))
        ),
        title: Text(band.name),
        trailing: Text(
          '${band.votes}', style: const TextStyle(fontSize: 20),
        ),
        onTap: () {
          print(band.name);
        },
      ),
    );
  }

  addNewBand() {

    final textControler = TextEditingController();
    if (Platform.isAndroid) {
      // para Android
      return showDialog(
        context: context, 
        builder: (context) {
          return AlertDialog(
            title: const Text('New band name:'), 
            content: TextField(
              controller: textControler,
            ),
            actions: <Widget>[
              MaterialButton(
                elevation: 5,
                textColor: Colors.blue,
                child: const Text('Add'),
                onPressed: () => addBandToList(textControler.text)
              )
            ],
          );
        }
      );
    } 

    showCupertinoDialog(
      context: context, 
      builder: (_) {
        return CupertinoAlertDialog(
          title: const Text('new Band Name'),
          content: CupertinoTextField(
            controller: textControler,
          ),
          actions: <Widget> [
            CupertinoDialogAction(
              isDefaultAction: true,
              child: const Text('Add'),
              onPressed: () => addBandToList(textControler.text)
            ),
            CupertinoDialogAction(
              isDestructiveAction: true,
              child: const Text('Dismiss'),
              onPressed: () => Navigator.pop(context)
            )
          ],
        );
      }
    );
  }

  void addBandToList(String name) {
    if(name.length > 1) {
      // Podemos agregar
      this.bands.add(new Band(id: DateTime.now().toString(), name: name));
      setState(() {});
    }

    Navigator.pop(context);
  }
}
