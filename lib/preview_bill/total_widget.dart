import 'package:flutter/material.dart';
import 'bill_row.dart';
import '../util/money_formatter.dart';

/// Widget displaying the total amount due for a bill.
class TotalWidget extends StatelessWidget {
  TotalWidget({@required this.total});

  /// The total amount due in cents (e.g. 150 means $1.50).
  final int total;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: Card(
        child: Container(
          padding: EdgeInsets.all(20),
          // We just have one row holding the total.
          child: BillRow(
              billItem: 'Total',
              billCost: '${formatMoney(total)}',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
