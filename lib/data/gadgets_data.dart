class Gadget {
  final String id;
  final String name;
  final double price;
  final String imageUrl;
  final String brand;
  final String category;

  const Gadget({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.brand,
    required this.category,
  });

  factory Gadget.fromJson(Map<String, dynamic> json) {
    return Gadget(
      id       : json['id'],
      name     : json['name'],
      price    : (json['price'] as num).toDouble(),
      imageUrl : json['imageUrl'],
      brand    : json['brand'],
      category : json['category'],
    );
  }
}

// ─── Local JSON Array (minimum 8 items) ─────────────────────────────────────
final List<Map<String, dynamic>> gadgetsJson = [
  {
    "id"      : "001",
    "name"    : "iPhone 15 Pro Max",
    "price"   : 1199.99,
    "imageUrl": "https://images.unsplash.com/photo-1695048133142-1a20484d2569?w=400",
    "brand"   : "Apple",
    "category": "Smartphone",
  },
  {
    "id"      : "002",
    "name"    : "Samsung Galaxy S24 Ultra",
    "price"   : 1299.99,
    "imageUrl": "https://images.unsplash.com/photo-1610945415295-d9bbf067e59c?w=400",
    "brand"   : "Samsung",
    "category": "Smartphone",
  },
  {
    "id"      : "003",
    "name"    : "Google Pixel 8 Pro",
    "price"   : 999.99,
    "imageUrl": "https://images.unsplash.com/photo-1598327105666-5b89351aff97?w=400",
    "brand"   : "Google",
    "category": "Smartphone",
  },
  {
    "id"      : "004",
    "name"    : "Sony WH-1000XM5",
    "price"   : 349.99,
    "imageUrl": "https://images.unsplash.com/photo-1618366712010-f4ae9c647dcb?w=400",
    "brand"   : "Sony",
    "category": "Headphones",
  },
  {
    "id"      : "005",
    "name"    : "Apple AirPods Pro 2",
    "price"   : 249.99,
    "imageUrl": "https://images.unsplash.com/photo-1606220588913-b3aacb4d2f46?w=400",
    "brand"   : "Apple",
    "category": "Earbuds",
  },
  {
    "id"      : "006",
    "name"    : "iPad Pro 13-inch M4",
    "price"   : 1299.99,
    "imageUrl": "https://images.unsplash.com/photo-1561154464-82e9adf32764?w=400",
    "brand"   : "Apple",
    "category": "Tablet",
  },
  {
    "id"      : "007",
    "name"    : "Samsung Galaxy Watch 7",
    "price"   : 299.99,
    "imageUrl": "https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=400",
    "brand"   : "Samsung",
    "category": "Smartwatch",
  },
  {
    "id"      : "008",
    "name"    : "DJI Mini 4 Pro Drone",
    "price"   : 759.99,
    "imageUrl": "https://images.unsplash.com/photo-1579829366248-204fe8413f31?w=400",
    "brand"   : "DJI",
    "category": "Drone",
  },
  {
    "id"      : "009",
    "name"    : "OnePlus 12 5G",
    "price"   : 799.99,
    "imageUrl": "https://images.unsplash.com/photo-1585060544812-6b45742d762f?w=400",
    "brand"   : "OnePlus",
    "category": "Smartphone",
  },
  {
    "id"      : "010",
    "name"    : "GoPro Hero 12 Black",
    "price"   : 399.99,
    "imageUrl": "https://images.unsplash.com/photo-1494706934326-4f0bd54be3b3?w=400",
    "brand"   : "GoPro",
    "category": "Action Camera",
  },
];

// Parse JSON to Gadget objects
final List<Gadget> gadgetsList =
    gadgetsJson.map((json) => Gadget.fromJson(json)).toList();