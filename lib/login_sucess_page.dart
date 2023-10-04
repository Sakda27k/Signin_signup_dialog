import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ShopPage(),
    );
  }
}

class ShopPage extends StatefulWidget {
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // Maintain a list of selected products
  List<bool> selectedProducts = [false, false, false, false, false];

  // Define the prices of the products
  List<double> productPrices = [99.99, 49.99, 149.99, 79.99, 199.99];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop'),
        backgroundColor: Colors.red, // Set the background color to red
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          buildProductItem(
            'Product 1', // Product name
            'Price: \$99.99', // Product price
            'Asset/Images/apple.png', // Image asset path
            0, // Index of the product in the list
          ),
          SizedBox(height: 16.0), // Add space between products
          buildProductItem(
            'Product 2', // Product name
            'Price: \$49.99', // Product price
            'Asset/Images/apple.png', // Image asset path
            1, // Index of the product in the list
          ),
          SizedBox(height: 16.0), // Add space between products
          buildProductItem(
            'Product 3', // Product name
            'Price: \$149.99', // Product price
            'Asset/Images/apple.png', // Image asset path
            2, // Index of the product in the list
          ),
          SizedBox(height: 16.0), // Add space between products
          buildProductItem(
            'Product 4', // Product name
            'Price: \$79.99', // Product price
            'Asset/Images/apple.png', // Image asset path
            3, // Index of the product in the list
          ),
          SizedBox(height: 16.0), // Add space between products
          buildProductItem(
            'Product 5', // Product name
            'Price: \$199.99', // Product price
            'Asset/Images/apple.png', // Image asset path
            4, // Index of the product in the list
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Total Price: \$${calculateTotalPrice().toStringAsFixed(2)}', // Display the total price
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Implement your checkout logic here
                  // This button can be used for checkout
                },
                child: Text('Checkout'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildProductItem(String productName, String price, String imagePath, int index) {
    return Container(
      padding: EdgeInsets.all(16.0), // Add padding to the container
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!), // Set the border color to embossed gray
        borderRadius: BorderRadius.circular(10.0), // Add rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Set the shadow color
            spreadRadius: 2, // Set the spread radius
            blurRadius: 5, // Set the blur radius
            offset: Offset(0, 2), // Set the shadow offset
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Checkbox for product selection
          Checkbox(
            value: selectedProducts[index],
            onChanged: (value) {
              setState(() {
                selectedProducts[index] = value!;
              });
            },
          ),
          SizedBox(height: 8.0), // Add space between checkbox and product name

          // Left side: Image
          Container(
            width: 150, // Set the width of the image container
            child: Image.asset(imagePath), // Replace with your image asset path
          ),
          SizedBox(height: 16.0), // Add space between image and text

          // Right side: Product Name and Price
          Text(
            productName, // Replace with your product name
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          if (selectedProducts[index])
            SizedBox(height: 8.0), // Add space when checkbox is selected
          if (selectedProducts[index])
            Text(
              price, // Replace with your product price
              style: TextStyle(fontSize: 16.0),
            ),
          SizedBox(height: 16.0), // Add space between price and other content
          Text(
            'Product description goes here. You can provide more details about the product in this section.',
            style: TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }

  // Function to calculate the total price based on selected products
  double calculateTotalPrice() {
    double totalPrice = 0.0;
    for (int i = 0; i < selectedProducts.length; i++) {
      if (selectedProducts[i]) {
        totalPrice += productPrices[i];
      }
    }
    return totalPrice;
  }
}