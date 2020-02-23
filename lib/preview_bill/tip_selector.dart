import 'package:flutter/material.dart';
import '../util/money_formatter.dart';

class TipSelector extends StatefulWidget {
  const TipSelector({
    @required this.billSubtotal,
    @required this.tipAmount,
    @required this.changeTip,
  });
  final int billSubtotal;
  final int tipAmount;
  final Function changeTip;
  @override
  _TipSelectorState createState() => _TipSelectorState();
}

class _TipSelectorState extends State<TipSelector> {
  TextEditingController _tipTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                    flex: 7,
                    child: Text('Tip Amount'),
                  ),
                  Expanded(
                    flex: 3,
                    child: TextField(
                      textAlign: TextAlign.end,
                      keyboardType: TextInputType.numberWithOptions(),
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
                    onPressed: () => widget.changeTip(widget.billSubtotal ~/ 10),
                  ),
                  FlatButton(
                      child: const Text('15%'),
                      onPressed: () =>
                          widget.changeTip(widget.billSubtotal * 3 ~/ 20)),
                  RaisedButton(
                    child:
                        const Text('20%', style: TextStyle(color: Colors.white)),
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
