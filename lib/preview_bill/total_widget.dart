import 'package:flutter/material.dart';
import '../util/money_formatter.dart';

class TotalWidget extends StatelessWidget {
  TotalWidget({@required this.total});
  final int total;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: Card(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 7,
                child: Text(
                  'Total',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                flex: 3,
                child: Row(
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
                        '${formatMoney(total)}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
