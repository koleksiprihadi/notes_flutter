import 'package:flutter/material.dart';
import 'entry.dart';

class Awal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
        centerTitle: false,
      ),
      body: Center(
        child: Text("There are no notes yet"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: "Buat Note",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Entry()),
          );
        },
      ),
    );
  }
}
