import 'dart:io';

double calculateTotal({
      required double subtotal,
      required double taxRate,
      String? discountCode,
    }) {
      double finalAmount = subtotal;

      if (discountCode == "SAVE10") {
        print(">> Coupon applied: \$10.00 off!");
        finalAmount = finalAmount - 10.00;
      }

      if (finalAmount < 0) finalAmount = 0;

      return finalAmount + (finalAmount * taxRate);
    }

    void displayInventory(List<Map<String, dynamic>> inventory) {
    print("\n--- Current Inventory ---");
    for (var item in inventory) {
      print("${item['name']} - \$${item['price']} (Stock: ${item['stock']})");
    }
    print("-------------------------\n");
   
    
  }
void main() {
  // Topic 27: Collections (List of Maps) [cite: 105, 125]
  // Topic 23: Dynamic (used in Map values because stock is int and price is double) [cite: 44]
  List<Map<String, dynamic>> inventory = [
    {"name": "Apple", "price": 1.50, "stock": 10},
    {"name": "Bread", "price": 2.50, "stock": 5},
    {"name": "Milk", "price": 1.20, "stock": 8},
  ];

  // Topic 28: List (Empty cart) [cite: 111]
  List<Map<String, dynamic>> cart = [];
  
  // Topic 20: Double [cite: 63]
  double currentSubtotal = 0.0;
  const double taxRate = 0.10; // 10% tax

  print("Welcome to the Dart Grocery Store!");

  // Topic 49: While Loop (Runs while condition is true) [cite: 183]
  bool isRunning = true; // Topic 22: Bool [cite: 71]

  while (isRunning) {
    print("1. View Inventory");
    print("2. Add Item to Cart");
    print("3. Checkout");
    print("4. Exit");
    stdout.write("Choose an option: "); // Similar to print, but no new line
    
    // Reading input (Standard CLI practice)
    String? input = stdin.readLineSync();

    // Topic 41: Switch Case [cite: 155]
    switch (input) {
      case '1':
        displayInventory(inventory);
        break;

      case '2':
        stdout.write("Enter item name: ");
        String? nameInput = stdin.readLineSync();
        
        // logic to find ite
        var foundItem = inventory.firstWhere(
            (item) => item['name'] == nameInput, 
            orElse: () => {});

        if (foundItem.isNotEmpty) {
           // Check Stock
           if (foundItem['stock'] > 0) {
             cart.add(foundItem);
             // Decreasing stock
             foundItem['stock'] = foundItem['stock'] - 1; 
             currentSubtotal += foundItem['price'];
             print("Added ${foundItem['name']} to cart.");
           } else {
             print("Sorry, out of stock!");
           }
        } else {
          print("Item not found.");
        }
        break;

      case '3':
        stdout.write("Enter discount code (or press enter to skip): ");
        String? code = stdin.readLineSync();
        if (code == "") code = null; // forcing null if empty for practice

        double total = calculateTotal(
          subtotal: currentSubtotal, 
          taxRate: taxRate, 
          discountCode: code
        );

        print("Subtotal: \$${currentSubtotal.toStringAsFixed(2)}");
        print("Total with Tax: \$${total.toStringAsFixed(2)}");
        
        // Reset for next customer
        cart.clear();
        currentSubtotal = 0;
        break;

      case '4':
        print("Goodbye!");
        isRunning = false; // Stops the while loop
        break;

      default:
        print("Invalid option.");
    }
  }
}
