import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class addPersonButton extends StatelessWidget
{
    addPersonButton({@required this.onPressed});

    final GestureTapCallback onPressed;

    @override
    Widget build(BuildContext context)
    {
        return new RawMaterialButton(
            fillColor: Color.fromRGBO(137, 40, 52, 0.75),
            splashColor: Color.fromRGBO(137, 40, 52, 1.0),
            child: Text("+"),
            onPressed: onPressed,
        );
    }
}