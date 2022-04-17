import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:shop1_app/module/register_screen.dart';
import 'package:shop1_app/shared/component/reusable.dart';
import 'package:shop1_app/shared/cubit/cubit.dart';
import 'package:shop1_app/shared/cubit/states.dart';


class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ShopAppLoginCubit(),
      child: BlocConsumer<ShopAppLoginCubit, ShopAppLoginStates>(
        listener: (context, state) {
          if(state is ShopAppSuccessLoginState){
            if(state.shopLoginModel.status){
              print(state.shopLoginModel.message);
              print(state.shopLoginModel.data.token);
              Fluttertoast.showToast(
                  msg: state.shopLoginModel.message,
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
            }else{
              print(state.shopLoginModel.message);
              Fluttertoast.showToast(
                  msg: state.shopLoginModel.message,
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
            }
          }
        },
        builder: (context, state) {
          var cubit = ShopAppLoginCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("login",
                            style: Theme.of(context).textTheme.headline2),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "login  know to discover our products ",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: Colors.grey),
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        defaultFormField(
isPassword: false,
                            suffix: Icons.title,
                            textController: emailController,
                            type: TextInputType.text,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'email is required';
                              }
                            },

                            prefix: Icons.email,
                            label: "enter your email"),
                        SizedBox(
                          height: 20,
                        ),
                        defaultFormField(
                            onSubmitted: (value) {
                              if (formKey.currentState!.validate()) {
                                cubit.userLogin(
                                    email: emailController.text,
                                    password: passwordController.text);
                              }
                            },
                            isPassword: cubit.isPassword,
                            suffix: cubit.suffixIconVisibility,
                            suffixPressed: () {
                              cubit.changeSuffixIconVisibility();
                            },
                            textController: passwordController,
                            type: TextInputType.visiblePassword,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'password too short';
                              }
                            },
                            prefix: Icons.password,
                            label: "password is too short"),
                        SizedBox(
                          height: 30,
                        ),
                        ConditionalBuilder(
                          condition: state is! ShopAppLoadingLoginState,
                          builder: (context) => buildButton(
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                cubit.userLogin(
                                    email: emailController.text,
                                    password: passwordController.text);
                              }
                            },
                            text: "Login",
                          ),
                          fallback: (context) => Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                        Row(
                          children: [
                            Text("i don\'t have an account"),
                            buildTextButton(
                                onTap: () {
                                  navigatePush(context, RegisterScreen());
                                },
                                text: "Register")
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
