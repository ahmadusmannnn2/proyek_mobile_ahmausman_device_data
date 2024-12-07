import 'package:flutter/material.dart';
import 'pages/device_table.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Device Catalog',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const DeviceTable(),
    );
  }
}
