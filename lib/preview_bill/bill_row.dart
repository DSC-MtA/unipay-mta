import 'package:flutter/material.dart';

/// A row of information for a bill.
///
/// Has an item name and a cost (formatted as Strings).
/// Has a left side which takes up 70% of the width, and a right side that
/// takes up 30% of the width.
class BillRow extends StatelessWidget {
  BillRow({
    @required this.billItem,
    @required this.billCost,
    this.style = const TextStyle(),
  });

  /// A description of the bill item for the row.
  final String billItem;
  /// A String representing the cost of the bill item.
  final String billCost;
  /// The (optional) style for the text in the row.
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 7, // 70% width for item description
            child:
            Text(billItem, style: style), // The widget on the left goes here.
          ),
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text('\$', style: style),
                Container(
                  width: 50, // 30% width for the item price
                  alignment: Alignment.centerRight,
                  child: Text(billCost, style: style),
                ),
              ],
            ), // The widget on the right goes here.
          ),
        ],
      ),
    );
  }
}
