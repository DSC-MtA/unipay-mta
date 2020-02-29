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
  var cursorPos = new TextSelection.fromPosition(new TextPosition(offset: 2));

  /// Updates the tip amount to the amount given (in cents).
  ///
  /// Specifically, it calls the parent widget's function changeTip and
  /// updates the local text to reflect the change.
  void updateTip(int tip) {
    widget.changeTip(tip);
    _tipTextController.text = '\$  ${formatMoney(tip)}';
  }

  @override
  void initState() {
    // Sets the text to be the $ value passed as a property
    // (must convert to a string format first).
    _tipTextController.text = '\$  ${formatMoney(widget.tipAmount)}';

    // When the text changes for tip selection, we do something
    _tipTextController.addListener(() {
      // Get the tip amount and update it
      var tip = extractInt(_tipTextController.text);
      widget.changeTip(tip);

      // Determine what the text should be and where the cursor should be.
      // We keep the cursor at the end of the line, so we have the offset to
      // equal the length of the text string
      var newText = '\$  ${formatMoney(tip)}';
      var cursorPos = new TextSelection.fromPosition(
          new TextPosition(offset: newText.length));

      // We update the tip text controller with the new text and selection
      _tipTextController.value = _tipTextController.value.copyWith(
        text: newText,
        composing: TextRange.empty,
        selection: cursorPos,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                    // Set the tip to 10% (integer division)
                    onPressed: () => updateTip(widget.billSubtotal ~/ 10),
                  ),
                  FlatButton(
                    child: const Text('15%'),
                    // Set the tip to 15% (integer division)
                    onPressed: () => updateTip(widget.billSubtotal * 3 ~/ 20),
                  ),
                  RaisedButton(
                    child: const Text(
                      '20%',
                      style: TextStyle(color: Colors.white),
                    ),
                    // Set the tip to 20% (integer division)
                    onPressed: () => updateTip(widget.billSubtotal ~/ 5),
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
