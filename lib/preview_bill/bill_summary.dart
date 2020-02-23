import 'package:flutter/material.dart';
import 'bill_row.dart';
import '../util/money_formatter.dart';
import '../util/bill_items.dart';

/// Widget with the summary of items on the bill.
class BillSummary extends StatelessWidget {
  const BillSummary({@required this.billItems});

  /// List of items on the bill.
  final List<BillItem> billItems;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Card(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Column(
                // This creates a list of widgets and dumps them into the
                // column. We use the list.map() function to create a row widget
                // for every list item.
                children: billItems.map((item) {
                  return BillRow(
                    billItem: item.name,
                    billCost: '${formatMoney(item.cost)}',
                  );
                }).toList(), // toList() required due to lazy loading
              ),
              Divider(),
              BillRow(
                billItem: 'Subtotal',
                billCost: '${formatMoney(sumUpBill(billItems))}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
