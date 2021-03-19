import 'package:esports_community/provider/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Esports News'),
        leading: Icon(Icons.ac_unit_outlined),
        centerTitle: true,
      ),
      body: RaisedButton(
        child: Text('logout '),
        onPressed: () {
          final provider =
              Provider.of<GoogleSignInProvider>(context, listen: false);
          provider.logout();
        },
      ),
    );
  }
}
