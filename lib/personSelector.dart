import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class addPersonButton extends StatelessWidget
{
    addPersonButton({@required this.onPressed});

    final GestureTapCallback onPressed;

    @override
    Widget build(BuildContext context)
    {
        return RawMaterialButton(
            fillColor: Color.fromRGBO(137, 40, 52, 0.75),
            splashColor: Color.fromRGBO(137, 40, 52, 1.0),
            child:Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 20.0
                ),
                child:Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const <Widget>[
                        Icon(
                            Icons.supervisor_account,
                        ),
                        SizedBox(width: 6.0,),
                        Text("Add Member",style:TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        ),
                    ],
                ),
            ),
            onPressed: onPressed,
            shape: StadiumBorder(),
        );
    }
}