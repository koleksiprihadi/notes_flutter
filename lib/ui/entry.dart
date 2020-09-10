import 'package:flutter/material.dart';
import 'package:quill_delta/quill_delta.dart';
import 'package:zefyr/zefyr.dart';

class Entry extends StatefulWidget {
  @override
  _EntryState createState() => _EntryState();
}

class _EntryState extends State<Entry> {
  ZefyrController _controller;
  FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    final document = _loadDocument();
    _controller = ZefyrController(document);
    _focusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entry"),
        centerTitle: false,
        actions: [
          IconButton(
              icon: Icon(Icons.close),
              tooltip: "Close",
              onPressed: () {
                Navigator.pop(context);
              }),
          IconButton(icon: Icon(Icons.save), tooltip: "Save", onPressed: null)
        ],
      ),
      body: Container(
        child: ZefyrScaffold(
          child: ZefyrEditor(
            padding: EdgeInsets.all(16),
            controller: _controller,
            focusNode: _focusNode,
          ),
        ),
      ),
    );
  }
}

NotusDocument _loadDocument() {
  final Delta delta = Delta()..insert("\n");
  return NotusDocument.fromDelta(delta);
}

// class Entry extends StatelessWidget {
//   ZefyrController _controller;
//   FocusNode _focusNode;

//   @override
//   void initState() {
//     super.initState();
//     final document = _loadDocument();
//     _controller = ZefyrController(document);
//     _focusNode = FocusNode();
//   }

// NotusDocument _loadDocument(){
//   final Delta delta = Delta()..insert("Note\n");
//   return NotusDocument.fromDelta(delta);
// }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Entry"),
//         centerTitle: false,
//         actions: [
//           IconButton(
//               icon: Icon(Icons.close),
//               onPressed: () {
//                 Navigator.pop(context);
//               })
//         ],
//       ),
//       body: Container(
//         margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
//         child: ZefyrScaffold(
//           child: ZefyrEditor(
//             padding: EdgeInsets.all(16),
//             controller: _controller,
//             focusNode: _focusNode,
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.save),
//         tooltip: "Save",
//         onPressed: null,
//       ),
//     );
//   }
// }
