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
  
}
