// Guide from https://flutter.dev/docs/cookbook/forms/validation

import 'package:flutter/material.dart';

class AddUserForm extends StatefulWidget
{
  @override
  AddUserFormState createState()
  {
    return AddUserFormState();
  }
}

class AddUserFormState extends State<AddUserForm>
{
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context)
  {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              hintText: "First name",
            ),
            validator: (value) {
              if(value.isEmpty)
              {
                return 'Please enter first name';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: "Last name",
            ),
            validator: (value) {
              if(value.isEmpty)
              {
                return 'Please enter last name';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical:16.0),
            child: RaisedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false
                // otherwise.
                if (_formKey.currentState.validate()) {
                  // If the form is valid, display a Snackbar.
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                }
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
