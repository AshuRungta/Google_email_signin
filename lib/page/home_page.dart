import 'package:esports_community/page/FirstPage.dart';
import 'package:esports_community/provider/google_sign_in.dart';
import 'package:esports_community/widget/sign_up_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            final provider = Provider.of<GoogleSignInProvider>(context);

            if (provider.isSigningIn) {
              return buildLoading();
            } else if (snapshot.hasData) {
              return FirstPage();
            } else {
              return SignUpWidget();
            }
          },
        ),
      );

  Widget buildLoading() => Stack(
        fit: StackFit.expand,
        children: [
          //     CustomPaint(painter: BackgroundPainter()),
          Center(child: CircularProgressIndicator()),
        ],
      );
}
