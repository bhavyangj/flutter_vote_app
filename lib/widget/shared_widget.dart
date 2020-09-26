import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  String label;
  double size;
  Function onPressed;
  LoginButton({this.label, this.size = 300, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      child: MaterialButton(
        height: 60,
        padding: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: Colors.blueAccent[200],
        child: Text(
          label,
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
