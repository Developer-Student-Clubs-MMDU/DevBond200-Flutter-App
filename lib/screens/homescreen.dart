import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _todoList = <String>[];
  final TextEditingController _textFieldController = TextEditingController();
  int todoCount=0;

  void addItemToList(String text) {
    setState(() {
      _todoList.add(text);
    });

    print(_todoList);
    _textFieldController.clear();
  }

  List<Widget> _getItems() {
    final List<Widget> _todoWidgets = <Widget>[];
    for (String title in _todoList) {
      _todoWidgets.add(taskCard(title));
    }
    return _todoWidgets;
  }

  void showAlertDialog() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              title: Text("Add Text"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    autofocus: true,
                    controller: _textFieldController,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      addItemToList(_textFieldController.text);
                      todoCount++;
                      final snackBar = SnackBar(
                          margin: const EdgeInsets.all(16.0),
                          behavior: SnackBarBehavior.floating,
                          content:  Text('Added $todoCount todo'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      Navigator.pop(context);
                    },
                    child: Text('ADD'),
                  )
                ],
              ),
            ));
  }

  Widget taskCard(String text) {
    return Card(
      color: Colors.blue,
      elevation: 5.0,
      margin: EdgeInsets.fromLTRB(3.0, 2.0, 3.0, 0.0),
      child: ListTile(
        tileColor: Colors.black54,
        title: Text(
          "$text",
          style: TextStyle(color: Colors.white),
        ),
        onTap: () {},
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'UniversuMM To-Do',
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.purpleAccent,
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAlertDialog();
        },
        backgroundColor: Colors.purpleAccent,
        splashColor: Colors.purple,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(1.0, 1.0, 1.0, 0.0),
        child: ListView(
          children: _getItems(),
        ),
      ),
    );
  }
}
