import 'package:flutter/material.dart';
import 'bill_summary.dart';
import '../util/bill_items.dart';

const PAGE_NAME = 'Preview Bill';
const TEMP_ITEMS = [
  BillItem('Item1', 100),
  BillItem('Item2', 104),
  BillItem('Item3', 333),
  BillItem('Item4', 1251),
  BillItem('Item5', 1234),
  BillItem('Item6', 550),
];

class PreviewBillPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(PAGE_NAME),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: <Widget>[
          BillSummary(billItems: TEMP_ITEMS),
        ],
      ),
    );
  }
}
