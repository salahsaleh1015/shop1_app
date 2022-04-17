import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop1_app/model/shop_login_model.dart';
import 'package:shop1_app/shared/component/constants.dart';
import 'package:shop1_app/shared/cubit/states.dart';
import 'package:shop1_app/shared/network/remote/dio_helper.dart';

class ShopAppLoginCubit extends Cubit<ShopAppLoginStates> {
  ShopAppLoginCubit() : super(ShopAppLoginInitialState());
  static ShopAppLoginCubit get(context) => BlocProvider.of(context);
  late ShopLoginModel shopLoginModel ;
  void userLogin({required String email, required String password}) {
    emit(ShopAppLoadingLoginState());
    DioHelper.postData(url: Login, data: {
      "email": email,
      "password": password,
    }).then((value) {
    shopLoginModel = ShopLoginModel.fromJson(value.data);
    print(shopLoginModel.data.email);
    print(shopLoginModel.data.name);
    print(shopLoginModel.status);
      print(value.data);
      emit(ShopAppSuccessLoginState(shopLoginModel));
    }).catchError((error) {
      print(error.toString());
      print(error.toString());
      emit(ShopAppErrorLoginState(error.toString()));
    });
  }
  IconData suffixIconVisibility = Icons.visibility_off_sharp;
  bool isPassword = true;
  void changeSuffixIconVisibility(){
    isPassword = !isPassword;
    suffixIconVisibility = isPassword?Icons.visibility_off_sharp:Icons.visibility;
    emit(ShopAppSuffixIconVisibilityState());
  }
}
