import 'package:flutter/material.dart';

class Gadget {
  final String id;
  final String name;
  final double price;
  final String imageUrl;
  final String brand;
  final String category;
  final List<Color> availableColors;
  final List<String> colorNames;
  final String description;
  final Map<String, String> specs;

  const Gadget({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.brand,
    required this.category,
    required this.availableColors,
    required this.colorNames,
    required this.description,
    required this.specs,
  });
}

final List<Gadget> gadgetsList = [
  Gadget(
    id: '001',
    name: 'iPhone 15 Pro Max',
    price: 1199.99,
    imageUrl: 'https://images.unsplash.com/photo-1695048133142-1a20484d2569?w=400',
    brand: 'Apple',
    category: 'Smartphone',
    availableColors: [
      const Color(0xFF4A4A4F), // Natural Titanium
      const Color(0xFF3C3C3F), // Blue Titanium
      const Color(0xFFE8E1D7), // White Titanium
      const Color(0xFF1B1B1B), // Black Titanium
    ],
    colorNames: ['Natural Titanium', 'Blue Titanium', 'White Titanium', 'Black Titanium'],
    description: 'iPhone 15 Pro Max. Forged in titanium and featuring the groundbreaking A17 Pro chip, a customizable Action button, and the most powerful iPhone camera system ever.',
    specs: {
      'Display': '6.7" Super Retina XDR OLED',
      'Chip': 'A17 Pro',
      'Camera': '48MP Main + 12MP Ultra Wide + 12MP Telephoto',
      'Battery': 'Up to 29 hours video playback',
      'Storage': '256GB / 512GB / 1TB',
      'OS': 'iOS 17',
    },
  ),
  Gadget(
    id: '002',
    name: 'Samsung Galaxy S24 Ultra',
    price: 1299.99,
    imageUrl: 'https://images.unsplash.com/photo-1610945415295-d9bbf067e59c?w=400',
    brand: 'Samsung',
    category: 'Smartphone',
    availableColors: [
      const Color(0xFF8A8178), // Titanium Gray
      const Color(0xFFFAF0E1), // Titanium Yellow
      const Color(0xFF9E7FC4), // Titanium Violet
      const Color(0xFF1B1B1B), // Titanium Black
    ],
    colorNames: ['Titanium Gray', 'Titanium Yellow', 'Titanium Violet', 'Titanium Black'],
    description: 'Galaxy S24 Ultra. The ultimate Galaxy experience with Galaxy AI, a built-in S Pen, and a stunning 200MP camera.',
    specs: {
      'Display': '6.8" Dynamic AMOLED 2X',
      'Chip': 'Snapdragon 8 Gen 3',
      'Camera': '200MP Main + 12MP Ultra Wide + 50MP Telephoto',
      'Battery': '5000mAh',
      'Storage': '256GB / 512GB / 1TB',
      'OS': 'Android 14 / One UI 6.1',
    },
  ),
  Gadget(
    id: '003',
    name: 'Google Pixel 8 Pro',
    price: 999.99,
    imageUrl: 'https://images.unsplash.com/photo-1598327105666-5b89351aff97?w=400',
    brand: 'Google',
    category: 'Smartphone',
    availableColors: [
      const Color(0xFF1B1B1B), // Obsidian
      const Color(0xFFC2D1D9), // Bay
      const Color(0xFFF0E5D0), // Porcelain
    ],
    colorNames: ['Obsidian', 'Bay', 'Porcelain'],
    description: 'Google Pixel 8 Pro. The best of Google AI, the best of Pixel. Features the powerful Tensor G3 chip for incredible photo and video capabilities.',
    specs: {
      'Display': '6.7" LTPO OLED 120Hz',
      'Chip': 'Google Tensor G3',
      'Camera': '50MP Main + 48MP Ultra Wide + 48MP Telephoto',
      'Battery': '5050mAh',
      'Storage': '128GB / 256GB / 512GB / 1TB',
      'OS': 'Android 14',
    },
  ),
  Gadget(
    id: '004',
    name: 'Sony WH-1000XM5',
    price: 349.99,
    imageUrl: 'https://images.unsplash.com/photo-1618366712010-f4ae9c647dcb?w=400',
    brand: 'Sony',
    category: 'Headphones',
    availableColors: [
      const Color(0xFF1B1B1B), // Black
      const Color(0xFFE8DCC8), // Silver
      const Color(0xFF4A6B8A), // Midnight Blue
    ],
    colorNames: ['Black', 'Silver', 'Midnight Blue'],
    description: 'Sony WH-1000XM5. Industry-leading noise cancellation with Auto NC Optimizer, crystal clear hands-free calling, and up to 30 hours of battery life.',
    specs: {
      'Driver': '30mm',
      'Noise Cancellation': 'Adaptive Sound Control',
      'Battery': 'Up to 30 hours',
      'Connectivity': 'Bluetooth 5.2, Multipoint',
      'Weight': '250g',
      'Codec': 'LDAC, AAC, SBC',
    },
  ),
  Gadget(
    id: '005',
    name: 'Apple AirPods Pro 2',
    price: 249.99,
    imageUrl: 'https://images.unsplash.com/photo-1606220588913-b3aacb4d2f46?w=400',
    brand: 'Apple',
    category: 'Earbuds',
    availableColors: [
      const Color(0xFFE8E8ED), // White
    ],
    colorNames: ['White'],
    description: 'AirPods Pro 2. Rebuilt from the sound up with the Apple H2 chip for smarter noise cancellation. Adaptive Transparency, Personalized Spatial Audio, and a new touch control.',
    specs: {
      'Chip': 'Apple H2',
      'ANC': 'Active Noise Cancellation',
      'Battery': 'Up to 6 hours (30 with case)',
      'Connectivity': 'Bluetooth 5.3',
      'Water Resistance': 'IPX4',
      'Features': 'Adaptive Transparency, Spatial Audio',
    },
  ),
  Gadget(
    id: '006',
    name: 'iPad Pro 13-inch M4',
    price: 1299.99,
    imageUrl: 'https://images.unsplash.com/photo-1561154464-82e9adf32764?w=400',
    brand: 'Apple',
    category: 'Tablet',
    availableColors: [
      const Color(0xFFC0C0C0), // Silver
      const Color(0xFF3B3B3B), // Space Black
    ],
    colorNames: ['Silver', 'Space Black'],
    description: 'iPad Pro 13-inch. The ultimate iPad experience with the M4 chip, Ultra Retina XDR display, and all-day battery life. Thin, light, and incredibly powerful.',
    specs: {
      'Display': '13" Ultra Retina XDR OLED',
      'Chip': 'Apple M4',
      'Camera': '12MP Wide + 10MP Ultra Wide',
      'Battery': 'Up to 10 hours',
      'Storage': '256GB / 512GB / 1TB / 2TB',
      'Features': 'Face ID, Thunderbolt, Apple Pencil Pro',
    },
  ),
  Gadget(
    id: '007',
    name: 'Samsung Galaxy Watch 7',
    price: 299.99,
    imageUrl: 'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=400',
    brand: 'Samsung',
    category: 'Smartwatch',
    availableColors: [
      const Color(0xFF3A5A40), // Green
      const Color(0xFFD4C5A9), // Cream
      const Color(0xFFC0C0C0), // Silver
    ],
    colorNames: ['Green', 'Cream', 'Silver'],
    description: 'Galaxy Watch7. Smarter health monitoring with the enhanced BioActive Sensor, Energy Score, and Galaxy AI features on your wrist.',
    specs: {
      'Display': '1.5" Super AMOLED',
      'Chip': 'Exynos W1000',
      'Battery': 'Up to 40 hours',
      'Sensors': 'Heart Rate, SpO2, Temperature',
      'Water Resistance': '5ATM + IP68',
      'OS': 'Wear OS 5',
    },
  ),
  Gadget(
    id: '008',
    name: 'DJI Mini 4 Pro Drone',
    price: 759.99,
    imageUrl: 'https://images.unsplash.com/photo-1579829366248-204fe8413f31?w=400',
    brand: 'DJI',
    category: 'Drone',
    availableColors: [
      const Color(0xFF8E8E93), // Gray
    ],
    colorNames: ['Gray'],
    description: 'DJI Mini 4 Pro. Under 249g with omnidirectional obstacle sensing, 4K/60fps HDR video, and up to 34 minutes of flight time.',
    specs: {
      'Camera': '48MP, 4K/60fps HDR',
      'Flight Time': 'Up to 34 minutes',
      'Range': '20 km (FCC)',
      'Weight': '< 249g',
      'Obstacle Sensing': 'Omnidirectional',
      'Features': 'ActiveTrack 360°, MasterShots',
    },
  ),
  Gadget(
    id: '009',
    name: 'OnePlus 12 5G',
    price: 799.99,
    imageUrl: 'https://images.unsplash.com/photo-1585060544812-6b45742d762f?w=400',
    brand: 'OnePlus',
    category: 'Smartphone',
    availableColors: [
      const Color(0xFF1B1B1B), // Silky Black
      const Color(0xFF3A6B4F), // Flowy Emerald
    ],
    colorNames: ['Silky Black', 'Flowy Emerald'],
    description: 'OnePlus 12. The next leap in performance with Snapdragon 8 Gen 3, Hasselblad camera system, and 100W SUPERVOOC charging.',
    specs: {
      'Display': '6.82" 2K LTPO AMOLED 120Hz',
      'Chip': 'Snapdragon 8 Gen 3',
      'Camera': '50MP Main + 48MP Ultra Wide + 64MP Telephoto',
      'Battery': '5400mAh, 100W SUPERVOOC',
      'Storage': '256GB / 512GB',
      'OS': 'Android 14 / OxygenOS 14',
    },
  ),
  Gadget(
    id: '010',
    name: 'GoPro Hero 12 Black',
    price: 399.99,
    imageUrl: 'https://images.unsplash.com/photo-1494706934326-4f0bd54be3b3?w=400',
    brand: 'GoPro',
    category: 'Action Camera',
    availableColors: [
      const Color(0xFF1B1B1B), // Black
    ],
    colorNames: ['Black'],
    description: 'GoPro HERO12 Black. Unbelievable image quality with HDR 5.3K video, HyperSmooth 6.0 stabilization, and Max Lens Mod 2.0 support.',
    specs: {
      'Video': '5.3K60 / 4K120',
      'Photo': '27MP',
      'Stabilization': 'HyperSmooth 6.0',
      'Battery': 'Enduro, up to 70 min (5.3K)',
      'Waterproof': '10m (33ft)',
      'Features': 'GP-Log, Max Lens Mod 2.0',
    },
  ),
];