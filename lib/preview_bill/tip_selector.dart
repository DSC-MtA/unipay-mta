import 'package:flutter/material.dart';
import '../util/money_formatter.dart';

/// Widget for selecting a tip on a bill.
class TipSelector extends StatefulWidget {
  const TipSelector({
    @required this.billSubtotal,
    @required this.tipAmount,
    @required this.changeTip,
  });

  /// The subtotal for the bill (used for calculating % tips).
  final int billSubtotal;

  /// The current tip amount which has been selected.
  final int tipAmount;

  /// The function to call in order to change the tip amount.
  ///
  /// Note that we cannot simply change tipAmount directly, since we want
  /// the parent of this widget to change when the tipAmount changes. So, we
  /// call a function of the parent widget to call when the tip changes, which
  /// will in turn change the state with setState() and reload the page.
  final Function changeTip;

  @override
  _TipSelectorState createState() => _TipSelectorState();
}

/// The state for the widget that selects tips on a bill.
class _TipSelectorState extends State<TipSelector> {
  TextEditingController _tipTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Update the tip amount to what is passed in as a parameter (tipAmount).
    _tipTextController.text = '\$  ${formatMoney(widget.tipAmount)}';
    return Container(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: Card(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 7, // Takes up 70% of width.
                    child: Text('Tip Amount'),
                  ),
                  Expanded(
                    flex: 3, // Takes up 30% of width.
                    child: TextField(
                      textAlign: TextAlign.end,
                      keyboardType: TextInputType.numberWithOptions(),
                      // On change the input, get the integer representing the
                      // tip amount and tell the parent widget that the tip
                      // changed. This will cause the children widgets to
                      // refresh their data because setState() is called.
                      onChanged: (String value) async {
                        widget.changeTip(extractInt(value));
                      },
                      controller: _tipTextController,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FlatButton(
                    child: const Text('10%'),
                    // Set the tip to subtotal / 10 (integer division).
                    onPressed: () =>
                        widget.changeTip(widget.billSubtotal ~/ 10),
                  ),
                  FlatButton(
                    child: const Text('15%'),
                    onPressed: () =>
                        widget.changeTip(widget.billSubtotal * 3 ~/ 20),
                  ),
                  RaisedButton(
                    child: const Text(
                      '20%',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () => widget.changeTip(widget.billSubtotal ~/ 5),
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
