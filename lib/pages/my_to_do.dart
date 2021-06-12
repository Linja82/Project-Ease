import 'package:flutter/material.dart';

class myToDo extends StatefulWidget{
  @override
  _myToDoState createState() => _myToDoState();
}

class _myToDoState extends State<myToDo>{
  // supposedly saves the to do items, but I woulnd't know
  final List<String> _todoList = <String>[];
  // Where you input your text
  final TextEditingController _textFieldController = TextEditingController();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('My To-Do List')),
      body: ListView(children: _getItems()),
      // put shite in the to do list
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showMyDialog(context),
        tooltip: 'Add Item',
        child: Icon(Icons.add)),
      );
  }

  void _addTodoItem(String title){
    // According to the tutorial: wrapping it inside a set state will notify the app that the state has changed
    setState((){
      _todoList.add(title);
    });
    _textFieldController.clear();
  }

  // This will supposedly generate a list of item widgets ¯\_( ͡° ͜ʖ ͡°)_/¯
  Widget _buildTodoItem(String title) {
    return ListTile(title: Text(title));
  }

  // Supposedly displays a dialog for the user to enter items
  Future <void> _showMyDialog(BuildContext context) async{
    // alter the app state to show a dialog
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Add a task to your list"),
          content: TextField(
            controller: _textFieldController,
            decoration: const InputDecoration(hintText: "Enter task here"),
          ),
          actions: <Widget>[
            // adds button???
            TextButton(
              child: const Text("ADD"),
              onPressed: (){
                Navigator.of(context).pop();
                _addTodoItem(_textFieldController.text);
              },
            ),
            // Cancel button I guess?
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      }
    );
  }
  // iterates through the to-do list title
  List<Widget> _getItems(){
    final List<Widget> _todoWidgets = <Widget>[];
    for (String title in _todoList){
      _todoWidgets.add(_buildTodoItem(title));
    }
    return _todoWidgets;
  }
}