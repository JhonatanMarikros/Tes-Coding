import 'package:flutter/material.dart';

void main() {
  runApp(CartridgeApp());
}

class CartridgeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cartridge Kings',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  // List of products
  final List<Map<String, String>> products = [
    {
      'name': 'HP 62 Black Ink Cartridge',
      'price': '\$9.49',
      'image': 'image/hp62.jpg'
    },
    {
      'name': 'Canon MF-3110 Toner',
      'price': '\$36.45',
      'image': 'image/canonmf3110.jpg'
    },
    {
      'name': 'Epson 252 Ink Cartridge',
      'price': '\$12.99',
      'image': 'image/hp62.jpg'
    },
  ];

  void moveLeft() {
    setState(() {
      if (currentIndex > 0) {
        currentIndex--;
      }
    });
  }

  void moveRight() {
    setState(() {
      if (currentIndex < products.length - 3) {
        currentIndex++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Row(
          children: [
            Icon(Icons.label, color: Colors.orange),
            SizedBox(width: 8),
            Text(
              'CARTRIDGE KINGS',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: Container(
            color: Colors.blue, // Latar belakang biru untuk navbar
            padding: EdgeInsets.symmetric(
                vertical: 8.0), // Menambahkan padding vertikal untuk jarak
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildNavbarItem('HOME'),
                  _buildNavbarItem('INK CARTRIDGES'),
                  _buildNavbarItem('TONER CARTRIDGES'),
                  _buildNavbarItem('CONTACT US'),
                  _buildNavbarItem('LOGIN / REGISTER'),
                ],
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.orange),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 16),
            Container(
              width: double
                  .infinity, // Membuat box luar menyatu dengan lebar layar
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('image/1.png'), // Path gambar
                  fit: BoxFit.cover, // Menyelaraskan gambar agar memenuhi box
                ),
              ),
              padding: EdgeInsets.symmetric(
                  vertical: 16.0), // Padding atas dan bawah
              child: Center(
                // Membuat box dalam berada di tengah
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white, // Latar putih untuk inner box
                    borderRadius: BorderRadius.circular(
                        8.0), // Sudut melengkung inner box
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 10.0,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(16.0), // Padding dalam inner box
                  margin: EdgeInsets.symmetric(
                      horizontal: 16.0), // Jarak dari sisi kanan/kiri layar
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Tab Header
                      Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  // Logika untuk mengaktifkan tab "3-Step Easy Search"
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 12),
                                decoration: BoxDecoration(
                                  color:
                                      Colors.blue, // Latar biru untuk tab aktif
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8.0),
                                    topRight: Radius.zero,
                                  ),
                                ),
                                child: Text(
                                  '3-Step Easy Search',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  // Logika untuk mengaktifkan tab "Search by Serial Number"
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 12),
                                decoration: BoxDecoration(
                                  color: Colors.grey[
                                      200], // Latar abu untuk tab tidak aktif
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(8.0),
                                    topLeft: Radius.zero,
                                  ),
                                ),
                                child: Text(
                                  'Search by Serial Number',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      // Dropdown dan Tombol
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: DropdownButton<String>(
                                    isExpanded: true,
                                    hint: Text('1. Printer Brand'),
                                    items: ['HP', 'Canon', 'Epson']
                                        .map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (value) {},
                                  ),
                                ),
                                SizedBox(width: 8),
                                Expanded(
                                  child: DropdownButton<String>(
                                    isExpanded: true,
                                    hint: Text('2. Printer Series'),
                                    items: ['Series 1', 'Series 2', 'Series 3']
                                        .map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (value) {},
                                  ),
                                ),
                                SizedBox(width: 8),
                                Expanded(
                                  child: DropdownButton<String>(
                                    isExpanded: true,
                                    hint: Text('3. Printer Model'),
                                    items: ['Model A', 'Model B', 'Model C']
                                        .map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (value) {},
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 16),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 32,
                                  vertical: 12,
                                ),
                              ),
                              onPressed: () {},
                              child: Text('FIND CARTRIDGES'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 10),
            // Featured Products Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'FEATURED PRODUCTS',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: moveLeft,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(3, (index) {
                              final productIndex = currentIndex + index;
                              if (productIndex >= products.length) {
                                return SizedBox.shrink();
                              }
                              final product = products[productIndex];
                              return Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 12), // Perbaikan margin
                                child: Card(
                                  elevation: 6,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: SizedBox(
                                    width: 200, // Sesuaikan lebar kontainer
                                    height: 300, // Sesuaikan tinggi kontainer
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(15),
                                          ),
                                          child: Image.asset(
                                            product['image']!,
                                            fit: BoxFit.cover,
                                            height: 120,
                                            width: double.infinity,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                product['name']!,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              SizedBox(height: 8),
                                              if (product['discountPrice'] !=
                                                  null) ...[
                                                Text(
                                                  product['price']!,
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 14,
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                  ),
                                                ),
                                                SizedBox(height: 4),
                                                Text(
                                                  product['discountPrice']!,
                                                  style: TextStyle(
                                                    color: Colors.green,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ] else
                                                Text(
                                                  product['price']!,
                                                  style: TextStyle(
                                                    color: Colors.green,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              SizedBox(height: 16),
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Colors.orange,
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 32,
                                                    vertical: 12,
                                                  ),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                ),
                                                onPressed: () {},
                                                child: Text(
                                                  'ADD TO CART',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.arrow_forward),
                        onPressed: moveRight,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildNavbarItem(String title) {
    return InkWell(
      onTap: () {
        // Add navigation logic here
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: 8.0, horizontal: 4.0), // Adjusted padding
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 10.0, // Adjusted font size
          ),
        ),
      ),
    );
  }
}
