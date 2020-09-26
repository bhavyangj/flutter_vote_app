import 'package:flutter/material.dart';
import 'file:///C:/Users/Bhavyang/AndroidStudioProjects/flutter_vote_app/lib/services/constant.dart';
import 'package:flutter_vote_app/screens/home.dart';
import 'package:flutter_vote_app/screens/launch.dart';
import 'package:flutter_vote_app/screens/result.dart';
import 'package:flutter_vote_app/state/authentication.dart';
import 'package:flutter_vote_app/state/vote.dart';
import 'package:flutter_vote_app/utilities.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(Voteapp());
}
class Voteapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => VoteState()),
          ChangeNotifierProvider(create: (_) => AuthenticationState()),
        ],
      child: Consumer<AuthenticationState>(builder: (context, authState, child){
        return MaterialApp(
          initialRoute: "/",
          routes: {
            '/':(context) => Scaffold(
              body: Launch(),
            ),
            '/home': (context) => Scaffold(
              appBar: AppBar(
                  title: Text(kAppName),
                actions: <Widget>[
                  getActions(context, authState),
                ],
              ),
              body: Home(),
            ),
            '/result': (context) => Scaffold(
              appBar: AppBar(
                title: Text('Result'),
                actions: <Widget>[
                  getActions(context, authState),
                ],
                leading: IconButton(
                  icon: Icon(Icons.home),
                  color: Colors.white,
                  onPressed: (){
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                ),
              ),
              body: Result(),
            ),
          },
        );
      },),
    );
  }
  PopupMenuButton getActions(
      BuildContext context, AuthenticationState authState) {
    return PopupMenuButton<int>(
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          child: Text('Logout'),
        )
      ],
      onSelected: (value) {
        if (value == 1) {
          // logout
          authState.logout();
          gotoLoginScreen(context, authState);
        }
      },
    );
  }
}
