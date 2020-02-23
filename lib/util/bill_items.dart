/// A container for a bill item with a name and cost.
class BillItem {
  const BillItem(this.name, this.cost);
  /// The name of the item added to the bill.
  final String name;
  /// The cost of the item added to the bill in cents (150 means $1.50).
  final int cost;
}

/// Sums up the costs of all items on the bill.
///
/// Returns an int representing the total cost in cents (150 means $1.50).
int sumUpBill(List<BillItem> billItems) {
  int total = 0;
  billItems.forEach((item) => total += item.cost);
  return total;
}
