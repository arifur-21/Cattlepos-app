
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../utils/style_colors.dart';
import '../../view_model/login view model/login_view_model.dart';
import '../../widgets/resueable_image_container_widget.dart';
import '../../widgets/resueable_text_editable_email_widget.dart';
import '../../widgets/resueable_text_field_password_widget.dart';
import '../../widgets/rounded_button.dart';
import '../android_large2_screen.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final loginVM = Get.put(LoginViewModel());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [

              ResueableImageContainerWidget(
                heignt: 213,
                width: double.infinity,
                imageUrl: "assets/images/cattlepos.png",
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    SizedBox(height:  40,),
                    Text("CattlePos Login", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800, color: Color(0xff09541A)),),
                    SizedBox(height:  30,),
                    Form(
                        key: _formKey,
                        child: Column(children: [
                          ResueableEmailTextFieldWidget(
                            emailController: loginVM.emailController.value,
                            hintText: 'Enter your email',
                          ),
                          SizedBox(height: 20,),
                          ResueableTextFieldPasswordWidget(
                              controllerText: loginVM.passwordController.value),
                    ],)),

                    SizedBox(height: 20,),
                    Obx(() =>
                        RoundedButton(
                          width: Get.width * 0.5,
                          fontSize: 20,
                          title: 'Login',
                          loading: loginVM.loading.value,
                          color: Styles.primaryColor,
                          onTap: () {
                            if(_formKey.currentState!.validate()){
                              loginVM.userLogin();
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> AndroidLarge2Screen()));

                            }

                          },),
                    ),


                    SizedBox(height: 40,),

                    ResueableImageContainerWidget(
                      heignt: 213,
                      width: double.infinity,
                      imageUrl: "assets/images/cattlepos.png",
                    ),
                    SizedBox(height: 30,),

                    Container(
                      width:  double.infinity,
                      height: 6,
                      color: Styles.primaryColor,
                    ),
                    SizedBox(height: 10,),
                    Text("copyright 2022", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),),
                    SizedBox(height: 20,),
                  ],
                ),
              )


            ],
          ),
        ),
      ),
    );
  }
}
