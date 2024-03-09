import 'package:flutter/material.dart';

class ForageDetails extends StatelessWidget {
  final String data;

  const ForageDetails({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> details =
        data.split(','); // Dividir la cadena en detalles individuales
    String locationName = '';

    // Buscar el nombre de la ubicación en los detalles
    for (var detail in details) {
      if (detail.toLowerCase().contains('location')) {
        locationName = detail.split(':')[1].trim();
        break;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Forage'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              ' $locationName',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: details.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: _getIconForDetail(
                      details[index]), // Icono a la izquierda de cada detalle
                  title:
                      _getTitleForDetail(details[index]), // Texto del detalle
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Función para obtener el icono correspondiente para cada detalle
  Icon _getIconForDetail(String detail) {
    if (detail.toLowerCase().contains('name')) {
      return Icon(Icons.person);
    } else if (detail.toLowerCase().contains('location')) {
      return Icon(Icons.location_on);
    } else if (detail.toLowerCase().contains('currently season: true')) {
      return Icon(Icons.calendar_today);
    } else {
      return Icon(Icons.info);
    }
  }

  // Función para obtener el título correspondiente para cada detalle
  Widget _getTitleForDetail(String detail) {
    if (detail.toLowerCase().contains('currently season: true')) {
      return Text('currently season: Check if it\'s editable');
    } else {
      return Text(detail.trim());
    }
  }
}
