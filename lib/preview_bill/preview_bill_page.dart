import 'package:flutter/material.dart';
import 'bill_summary.dart';
import 'tip_selector.dart';
import 'total_widget.dart';
import '../util/bill_items.dart';
import '../util/money_formatter.dart';

const PAGE_NAME = 'Preview Bill';
const TEMP_ITEMS = [
  BillItem('Item1', 100),
  BillItem('Item2', 104),
  BillItem('Item3', 333),
  BillItem('Item4', 1251),
  BillItem('Item5', 1234),
  BillItem('Item6', 550),
];

class PreviewBillPage extends StatefulWidget {
  State<StatefulWidget> createState() => _PreviewBillPageState();
}

class _PreviewBillPageState extends State<PreviewBillPage> {
  int _tipAmount = 0;
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
      body: ListView(
        children: <Widget>[
          BillSummary(billItems: TEMP_ITEMS),
          TipSelector(
            billSubtotal: sumUpBill(TEMP_ITEMS),
            tipAmount: _tipAmount,
            changeTip: changeTip,
          ),
          TotalWidget(total: sumUpBill(TEMP_ITEMS) + _tipAmount),
          FlatButton(
            onPressed: ()=>print('pressed'),
            color: Theme.of(context).primaryColor,
            child: Container(
              height: 300,
              alignment: Alignment.center,
              child: Text(
                'PAY \$${formatMoney(sumUpBill(TEMP_ITEMS) + _tipAmount)}',
                style: Theme.of(context).textTheme.display1.copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
