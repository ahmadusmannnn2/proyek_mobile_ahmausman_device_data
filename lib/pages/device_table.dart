import 'package:flutter/material.dart';
import '../datasources/device_data_source.dart';

class DeviceTable extends StatelessWidget {
  const DeviceTable({super.key});

  @override
  Widget build(BuildContext context) {
    final dataSource = DeviceDataSource();

    return Scaffold(
      appBar: AppBar(title: const Text('Device Catalog')),
      body: PaginatedDataTable(
        header: const Text('Device Specifications'),
        rowsPerPage: 5,
        columns: const [
          DataColumn(label: Text('Name')),
          DataColumn(label: Text('Brand')),
          DataColumn(label: Text('Release Year')),
          DataColumn(label: Text('Price')),
          DataColumn(label: Text('Processor')),
          DataColumn(label: Text('RAM (GB)')),
          DataColumn(label: Text('Storage (GB)')),
          DataColumn(label: Text('Battery (mAh)')),
        ],
        source: dataSource,
      ),
    );
  }
}
