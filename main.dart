void main() {
  // 1. Setup Data
  List<Map<String, dynamic>> inventory = [
    {"name": "Laptop", "price": 999.99, "stock": 5},
    {"name": "Mouse", "price": 25.50, "stock": 10},
  ];
  List<String> cart = [];

  // 2. Loop simulation (Since we aren't using stdin in this basic guide)
  // In a real app, you would ask for user input.
  // For practice, call your functions here manually.

  print("--- Store Open ---");
  
  // TODO: Call a function to display inventory using a loop
  
  // TODO: Call addToCart function
  
  // TODO: Call calculateTotal with a nullable discount code
}

// TODO: Create displayInventory function

// TODO: Create addToCart function

// TODO: Create calculateTotal function with named parameters and null safety
double calculateTotal({required double subtotal, required double tax, String? discountCode}) {
  // Logic here
  return 0.0; // temporary return
}