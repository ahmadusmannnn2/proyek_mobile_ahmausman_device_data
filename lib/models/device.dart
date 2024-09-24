class Device {
  Device(this.name, this.brand, this.releaseYear, this.price, this.processor,
      this.ram, this.storage, this.battery);

  final String name;
  final String brand;
  final int releaseYear;
  final double price;
  final String processor;
  final int ram;
  final int storage;
  final int battery;
  bool selected = false;
}
