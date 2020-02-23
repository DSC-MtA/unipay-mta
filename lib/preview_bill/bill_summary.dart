import 'package:flutter/material.dart';
import '../util/money_formatter.dart';
import '../util/bill_items.dart';

class BillSummary extends StatelessWidget {
  const BillSummary({@required this.billItems});

  final List<BillItem> billItems;

  Widget buildRow({@required Widget left, @required Widget right}) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 7,
            child: left,
          ),
          Expanded(
            flex: 3,
            child: right,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Column(
              children: billItems.map((item) {
                return buildRow(
                  left: Text(item.name),
                  right: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text('\$'),
                      Container(
                        width: 50,
                        alignment: Alignment.centerRight,
                        child: Text('${formatMoney(item.cost)}'),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
            Divider(),
            buildRow(
              left: Text(
                'Total',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              right: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    '\$',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Container(
                    width: 50,
                    alignment: Alignment.centerRight,
                    child: Text(
                      '${formatMoney(sumUpBill(billItems))}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
