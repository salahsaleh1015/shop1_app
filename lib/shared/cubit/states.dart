 import 'package:shop1_app/model/shop_login_model.dart';

abstract class ShopAppLoginStates {}
 class ShopAppLoginInitialState extends ShopAppLoginStates{}
 class ShopAppSuccessLoginState extends ShopAppLoginStates{
 late final ShopLoginModel shopLoginModel;
 ShopAppSuccessLoginState(this.shopLoginModel);
 }
 class ShopAppLoadingLoginState extends ShopAppLoginStates{}
 class ShopAppErrorLoginState extends ShopAppLoginStates{
 final String error;
 ShopAppErrorLoginState(this.error);

 }
 class ShopAppSuffixIconVisibilityState extends ShopAppLoginStates{}