import 'package:flutter/material.dart';
import 'package:forage/forage.dart';
import 'package:forage/forage_details.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.savedData}) : super(key: key);

  final List<String> savedData;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forage"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        ],
      ),
      body: ListView.builder(
        itemCount: widget.savedData.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _extractName(widget.savedData[index]),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  _extractLocation(widget.savedData[index]),
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ForageDetails(data: widget.savedData[index]),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Forage()),
          ).then((value) {
            if (value != null) {
              setState(() {
                widget.savedData.add(value.toString());
              });
            }
          });
        },
        tooltip: 'Go to forage',
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  String _extractName(String data) {
    List<String> details = data.split(',');
    String name = '';

    for (var detail in details) {
      if (detail.toLowerCase().contains('name')) {
        name = detail.split(':')[1].trim();
        break;
      }
    }

    return name;
  }

  String _extractLocation(String data) {
    List<String> details = data.split(',');
    String location = '';

    for (var detail in details) {
      if (detail.toLowerCase().contains('location')) {
        location = detail.split(':')[1].trim();
        break;
      }
    }

    return location;
  }
}
