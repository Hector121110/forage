import 'package:flutter/material.dart';

class Forage extends StatefulWidget {
  const Forage({Key? key}) : super(key: key);

  @override
  State<Forage> createState() => _ForageState();
}

class _ForageState extends State<Forage> {
  var _nameController = TextEditingController();
  var _locationController = TextEditingController();
  bool __isChecked = false;
  //List<String> _savedData = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forage'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 35.0, vertical: 20),
            child: TextField(
              controller: _nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Name",
                //prefixIcon: Icon(Icons.monitor_weight),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 35.0, vertical: 10),
            child: TextField(
              controller: _locationController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Location",
              ),
            ),
          ),
          ListTile(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 35.0, vertical: 10.0),
            leading: Checkbox(
              value: __isChecked,
              onChanged: (bool? value) {
                setState(() {
                  __isChecked = value!;
                });
              },
              activeColor: Colors.blue,
            ),
            title: Text("Currently Season"),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 350),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  child: Text("SAVE"),
                  color: Color.fromARGB(255, 222, 213, 213),
                  onPressed: () {
                    _saveData();
                    //_navigateToHomePage(context);
                  },
                ),
                MaterialButton(
                  child: Text("DELETE"),
                  color: Color.fromARGB(255, 222, 213, 213),
                  onPressed: () {
                    _nameController.clear();
                    _locationController.clear();
                    setState(() {
                      __isChecked = false;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _saveData() {
    String name = _nameController.text;
    String location = _locationController.text;
    Navigator.of(context).pop(
        "Name: $name, Location: $location, Currently Season: $__isChecked");
  }

  //void _navigateToHomePage(BuildContext context) {
  //Navigator.pop(context);
  //}
}
