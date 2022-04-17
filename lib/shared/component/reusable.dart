import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop1_app/shared/style/colors.dart';

void navigatePush(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
        context, MaterialPageRoute(builder: (context) => widget), (route) {
      return false;
    });

Widget defaultFormField(
        {@required TextEditingController? textController,
        @required TextInputType? type,
        Function(String val)? onSubmitted,
        Function(String val)? onChanged,
        @required String? Function(String? val)? validate,
        @required IconData? prefix,
        VoidCallback? onTap,
        @required String? label,
         bool  isPassword = true,
          required IconData suffix,
          VoidCallback? suffixPressed,
        }) =>
    TextFormField(

      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(prefix),
        suffixIcon: IconButton(
            onPressed:suffixPressed,
             icon:  Icon(suffix),),
        border: OutlineInputBorder(),
      ),
      controller: textController,
      onTap: onTap,
      keyboardType: type,
      obscureText: isPassword,
      onFieldSubmitted: onSubmitted,
      onChanged: onChanged,
      validator: validate,
    );
Widget buildTextButton(
        {@required VoidCallback? onTap, @required String? text}) =>
    TextButton(
      onPressed: onTap,
      child: Text(text!),
    );
Widget buildButton({@required VoidCallback? onTap, @required String? text}) =>
    GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
            child: Text(
          text!,
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.normal),
        )),
        height: 40,
        width: 270,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
