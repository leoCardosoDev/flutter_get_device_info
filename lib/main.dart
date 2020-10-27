import 'package:flutter/material.dart';
import 'package:get_device_info/get_load_device_info.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Device Info'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GetDeviceInfo _getDeviceInfo = GetDeviceInfo();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Informações do dispositivo:',
              style: TextStyle(fontSize: 20),
            ),
            FutureBuilder(
              future: _getDeviceInfo.getLocalDeviceDetails(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error'),
                  );
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('ID: ${snapshot.data[0]}'),
                      Text('Marca: ${snapshot.data[1]}'),
                      Text('Modelo: ${snapshot.data[2]}'),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
