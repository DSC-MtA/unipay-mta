class BillItem {
  const BillItem(this.name, this.cost);
  final String name;
  final int cost;
}

int sumUpBill(List<BillItem> billItems) {
  int total = 0;
  billItems.forEach((item) => total += item.cost);
  return total;
}
