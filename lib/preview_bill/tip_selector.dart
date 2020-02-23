import 'package:flutter/material.dart';
import '../util/money_formatter.dart';

class TipSelector extends StatefulWidget {
  const TipSelector({@required this.billSubtotal});
  final int billSubtotal;
  @override
  State<StatefulWidget> createState() => _TipSelectorState();
}

class _TipSelectorState extends State<TipSelector> {
  int tipAmount = 0;
  TextEditingController _tipTextController = TextEditingController();

  void changeTipTo(int value) {
    tipAmount = value;
    _tipTextController.text = '\$  ${formatMoney(tipAmount)}';
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 7,
                  child: Text('Tip Amount'),
                ),
                Expanded(
                  flex: 3,
                  child: TextField(
                    textAlign: TextAlign.end,
                    keyboardType: TextInputType.numberWithOptions(),
                    onChanged: (String value) async {
                      changeTipTo(extractInt(value));
                    },
                    controller: _tipTextController,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
