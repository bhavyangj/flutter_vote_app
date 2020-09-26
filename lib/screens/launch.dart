import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vote_app/Animation/FadeAnimation.dart';
import 'package:flutter_vote_app/state/authentication.dart';
import 'package:flutter_vote_app/utilities.dart';
import 'package:flutter_vote_app/widget/shared_widget.dart';
import 'file:///C:/Users/Bhavyang/AndroidStudioProjects/flutter_vote_app/lib/services/constant.dart';
import 'package:provider/provider.dart';

class Launch extends StatefulWidget {
  @override
  _LaunchState createState() => _LaunchState();
}

class _LaunchState extends State<Launch> with SingleTickerProviderStateMixin{
  TabController _tabcontroller;
  void initState(){
    super.initState();
    _tabcontroller = new TabController(length: 2, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthenticationState>(
      builder: (builder, authState, child){
        print(authState.authStatus);
        gotoHomeScreen(context, authState);
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  colors: [Colors.blue[900], Colors.blue[600], Colors.blue[200]]
              )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 80,),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FadeAnimation(1, Text("Login", style: TextStyle(color: Colors.white, fontSize: 40),)),
                    SizedBox(height: 10,),
                    FadeAnimation(1.3, Text("Welcome to "+kAppName, style: TextStyle(color: Colors.white, fontSize: 22),)),
                    SizedBox(height: 5,),
                    FadeAnimation(1.3, Text("We appreciate your valuable vote", style: TextStyle(color: Colors.white , fontSize: 18),)),
                  ],
                ),
              ),
              SizedBox(height: 100),
              new Image.asset(
                'assets/launch.png',
                height: 180,
                width: 400,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    // boxShadow: ,
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(70), topRight: Radius.circular(70))
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(30),
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: new TabBar(
                              indicatorColor: Colors.blue,
                              unselectedLabelColor: Colors.red,
                              labelColor: Colors.blue,
                              controller: _tabcontroller,
                              tabs: [
                                Tab(icon: Icon(Icons.people, color: Colors.blue,), text: 'Student',),
                                Tab(icon: Icon(Icons.person, color: Colors.blue,), text: 'Admin',),
                              ],
                            ),
                          ),
                          SizedBox(height: 30,),
                          if (authState.authStatus == kAuthLoading)
                            Text(
                              'loading...',
                              style: TextStyle(fontSize: 12.0, color: Colors.red),
                            ),
                          if (authState.authStatus == null ||
                              authState.authStatus == kAuthError)
                            Container(
                              height: 80,
                              child: new TabBarView(

                                controller: _tabcontroller,
                                children: <Widget>[
                                  LoginButton(
                                    label: 'Google Sign In',
                                    onPressed: () =>
                                        signIn(context, kAuthSignInGoogle, authState),
                                  ),
                                  LoginButton(
                                    label: 'Anonymous Sign In',
                                    onPressed: () =>
                                        signIn(context, kAuthSignInAnonymous, authState),
                                  ),
                                ],
                              ),
                            ),
                          if (authState.authStatus == kAuthError)
                            Text(
                              'Error...',
                              style: TextStyle(fontSize: 12.0, color: Colors.redAccent),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      }
    );
  }

  void signIn(context, String service, AuthenticationState authState) {
    // / Navigator.pushReplacementNamed(contextment, '/home');
    authState.login(serviceName: service);
  }
}
