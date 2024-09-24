import 'package:flutter/material.dart';
import '../models/device.dart';

class DeviceDataSource extends DataTableSource {
  DeviceDataSource() {
    devices = <Device>[
      Device('iPhone 14', 'Apple', 2022, 999.99, 'A15 Bionic', 6, 128, 3279),
      Device('Galaxy S22', 'Samsung', 2022, 799.99, 'Exynos 2200', 8, 128, 3700),
      Device('Google Pixel 7', 'Google', 2022, 599.99, 'Google Tensor G2', 8, 128, 4355),
    Device('OnePlus 10 Pro', 'OnePlus', 2022, 899.99, 'Snapdragon 8 Gen 1', 8, 128, 5000),
    Device('Xiaomi 12', 'Xiaomi', 2022, 749.99, 'Snapdragon 8 Gen 1', 8, 256, 4500),
    Device('iPhone 15', 'Apple', 2023, 1099.99, 'A16 Bionic', 8, 128, 3279),
    Device('Samsung Galaxy Z Fold 5', 'Samsung', 2023, 1799.99, 'Snapdragon 8 Gen 2', 12, 512, 4400),
    Device('Google Pixel Fold', 'Google', 2023, 1799.99, 'Google Tensor G2', 12, 256, 4821),
    Device('Oppo Find N2', 'Oppo', 2023, 799.99, 'Snapdragon 8+ Gen 1', 12, 512, 4370),
    Device('Vivo X90 Pro', 'Vivo', 2023, 999.99, 'Dimensity 9200', 12, 256, 4870),
    Device('Samsung Galaxy A54', 'Samsung', 2023, 449.99, 'Exynos 1380', 6, 128, 5000),
    Device('Honor 90', 'Honor', 2023, 599.99, 'Snapdragon 7 Gen 1', 12, 512, 5000),
    Device('Realme GT 3', 'Realme', 2023, 649.99, 'Snapdragon 8+ Gen 1', 8, 256, 4600),
    Device('Asus ROG Phone 7', 'Asus', 2023, 999.99, 'Snapdragon 8 Gen 2', 16, 512, 6000),
    Device('Nokia G400', 'Nokia', 2023, 239.99, 'Snapdragon 480', 4, 64, 5000),
    Device('Xiaomi 13T', 'Xiaomi', 2023, 749.99, 'Dimensity 9200+', 8, 256, 5000),
      // Tambahkan perangkat lain sesuai kebutuhan
    ];
  }

  late List<Device> devices;
  int _selectedCount = 0;

  @override
  DataRow? getRow(int index) {
    if (index >= devices.length) return null;

    final device = devices[index];

    return DataRow.byIndex(
      index: index,
      selected: device.selected,
      onSelectChanged: (value) {
        if (device.selected != value) {
          _selectedCount += value! ? 1 : -1;
          device.selected = value;
          notifyListeners();
        }
      },
      cells: [
        DataCell(Text(device.name)),
        DataCell(Text(device.brand)),
        DataCell(Text('${device.releaseYear}')),
        DataCell(Text('\$${device.price.toStringAsFixed(2)}')),
        DataCell(Text(device.processor)),
        DataCell(Text('${device.ram} GB')),
        DataCell(Text('${device.storage} GB')),
        DataCell(Text('${device.battery} mAh')),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => devices.length;
  @override
  int get selectedRowCount => _selectedCount;

  void selectAll(bool? checked) {
    for (final device in devices) {
      device.selected = checked ?? false;
    }
    _selectedCount = checked! ? devices.length : 0;
    notifyListeners();
  }

  void sort<T>(Comparable<T> Function(Device d) getField, bool ascending) {
    devices.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);
      return ascending ? Comparable.compare(aValue, bValue) : Comparable.compare(bValue, aValue);
    });
    notifyListeners();
  }
}
