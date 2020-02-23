import 'package:flutter/material.dart';
import 'bill_summary.dart';
import 'tip_selector.dart';
import 'total_widget.dart';
import '../util/bill_items.dart';
import '../util/money_formatter.dart';

/// The name of the page in the app.
const PAGE_NAME = 'Preview Bill';

/// A list of bill items.
///
/// @TODO: Connect this to the backend.
const TEMP_ITEMS = [
  BillItem('Item1', 100),
  BillItem('Item2', 104),
  BillItem('Item3', 333),
  BillItem('Item4', 1251),
  BillItem('Item5', 1234),
  BillItem('Item6', 550),
];

/// The page for previewing a bill, setting the tip, and paying.
class PreviewBillPage extends StatefulWidget {
  State<StatefulWidget> createState() => _PreviewBillPageState();
}

/// The state for the page where we preview a bill, set the tip, and pay.
class _PreviewBillPageState extends State<PreviewBillPage> {
  /// The amount to tip in cents (a value of 150 means $1.50).
  int _tipAmount = 0;

  /// The function call to change the state of the _tipAmount.
  ///
  /// Note that by calling setState(), we tell Flutter to reload the widget
  /// with the new state data (as well as reload all descendant widgets).
  void changeTip(int value) {
    setState(() {
      _tipAmount = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(PAGE_NAME),
      ),
      // A scrollable list of items.
      body: ListView(
        children: <Widget>[
          // The summary of the items on the bill.
          BillSummary(billItems: TEMP_ITEMS),
          // A widget letting us add a tip.
          TipSelector(
            billSubtotal: sumUpBill(TEMP_ITEMS),
            tipAmount: _tipAmount,
            changeTip: changeTip,
          ),
          // A widget holding the total amount to pay.
          TotalWidget(total: sumUpBill(TEMP_ITEMS) + _tipAmount),
          // A button for paying the amount due.
          FlatButton(
            // @TODO: add functionality for when pay button pressed.
            onPressed: () => print('pressed'),
            // Set the color to the primary color of the theme.
            color: Theme.of(context).primaryColor,
            child: Container(
              height: 300,
              alignment: Alignment.center,
              child: Text(
                'PAY \$${formatMoney(sumUpBill(TEMP_ITEMS) + _tipAmount)}',
                // Set the style to a big font with a white color.
                style: Theme.of(context)
                    .textTheme
                    .display1
                    .copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
