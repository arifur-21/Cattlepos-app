import 'dart:math';

import 'package:cattle_pos_app/screens/print_preview_screen.dart';
import 'package:cattle_pos_app/widgets/rounded_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:short_uuids/short_uuids.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:uuid/uuid.dart';

import '../data/response/status.dart';
import '../utils/style_colors.dart';
import '../view_model/login view model/login_view_model.dart';
import '../view_model/receipt_view_model/receipt_view_model.dart';
import '../widgets/reuseable_text_filed.dart';

class AndroidLarge2Screen extends StatefulWidget {
  const AndroidLarge2Screen({Key? key}) : super(key: key);

  @override
  State<AndroidLarge2Screen> createState() => _AndroidLarge2ScreenState();
}

class _AndroidLarge2ScreenState extends State<AndroidLarge2Screen> {
  final loginVM = Get.put(LoginViewModel());
  final receiptVM = Get.put(ReceiptViewModel());
  final _formKey = GlobalKey<FormState>();

  List<String> serviceTypeList = ['Cow', 'Goad', 'Buffalo'];
  String cattleType = 'Select Cattle Type';
  bool isServiceType = false;
  dynamic hasil;
  dynamic totalPrice;

  static const uuid = ShortUuid();


  @override
  void initState() {
    loginVM.getLoginUserData();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Styles.primaryColor,
        actions: [

          Row(
            children: [
              Text("Hasan",style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Colors.white),),
              SizedBox(width: 16,),
              Icon(Icons.file_copy),
              SizedBox(width: 10,),
            ],
          )


        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Center(
                  child: Text(
                "Money Receipt",
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black),
              )),
              SizedBox(
                height: 20,
              ),
              _dateTimeContainerWidget(),

              SizedBox(height: 10,),

              Container(
                width: double.infinity,
                color: Color(0xffD9D9D9),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Form(
                        key: _formKey,
                          child: Column(
                        children: [
                          ResuableTextField(
                            controllerValue: receiptVM.byerNameController.value,
                            lableText: 'Buyer Name',
                            hintText: 'Enter Buyer Name',
                            errorMsg: "Please enter buyer name",),
                          SizedBox(height: 10,),
                          ResuableTextField(
                            controllerValue: receiptVM.phoneController.value,
                            lableText: 'Phone',
                            hintText: "Enter phone number",
                            errorMsg: "Please enter buyer phone number",
                            keyBordType: TextInputType.number,),
                          SizedBox(height: 10,),


                          ResuableTextField(
                            controllerValue: receiptVM.priceController.value,
                            lableText: 'Price',
                            hintText: "Enter cattle price",
                            errorMsg: "Please enter cattle price",
                            keyBordType: TextInputType.number,),
                          SizedBox(height: 10,),


                          cattleTypeWidget(),

                        ],
                      )),


                    SizedBox(height: 40,),

                    Obx(() =>
                        RoundedButton(
                            width: Get.width * 0.5,
                            title: "Preview",
                            loading: receiptVM.loading.value,
                            color: Styles.primaryColor,
                            onTap: (){
                              print("${generateInvoiceNumber()}");
                              if(_formKey.currentState!.validate()){
                                receiptVM.addReceiptData(cattleType);

                                hasil = (int.parse(receiptVM.priceController.value.text) / 100) * 5;
                                var price = int.parse(receiptVM.priceController.value.text);
                                totalPrice = price + hasil;
                                print("Total ${totalPrice}");

                              }

                              Navigator.push(context, MaterialPageRoute(builder: (context)=> PrintPreviewScreen(
                                currentDate: receiptVM.currentDate,
                                currentTime: receiptVM.currentTime,
                                cattlePrice: receiptVM.priceController.value.text,
                                buyerName: receiptVM.byerNameController.value.text,
                                cattleType:  cattleType,
                                hasil: hasil,
                                totlaPrice: totalPrice,
                              )));
                            }),
                    ),




                  ],),
                ),
              ),

              SizedBox(height: 20,),

/*Obx((){
  switch(loginVM.rxRequestStatus.value){
    case Status.LOADING:
      return Center(child:  CircularProgressIndicator(),);

    case Status.ERROR:
      print("error ${loginVM.error.value.toString()}");
      return Text(loginVM.error.value.toString());

    case Status.SUCCESS:
      print("data length ${loginVM.loginUserDataList.value.length}");
      return Text("data foun ${loginVM.loginUserDataList.value[1].email}");
  }
})*/

            ],
          ),
        ),
      ),
    );
  }



  String generateInvoiceNumber() {
    var rng = Random();
    var codeUnits = List.generate(8, (index) {
      return rng.nextInt(26) + 65;
    });
print("code ${codeUnits}");
    return String.fromCharCodes(codeUnits);
  }

  Widget _dateTimeContainerWidget(){
    return  Container(
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("Receipt NO :",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
                        SizedBox(width: 8,),
                        Expanded(child: Text(uuid.generate(),style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),))
                      ],
                    )

                  ],
                )),
            SizedBox(width: 10,),


            Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(() =>
                        Row(
                          children: [
                            Text("Date : ", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),),
                            SizedBox(width: 8,),
                            Text("${receiptVM.currentDate}",style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),),
                          ],
                        ),
                    ),

                    SizedBox(height: 10,),

                    Row(
                      children: [
                        Text("Time : ",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
                        SizedBox(width: 8,),
                        TimerBuilder.periodic(Duration(seconds: 1), builder: (context) {
                          return Text(
                            "${getSystemTime()}",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500, color: Colors.black),
                          );
                        }),
                      ],
                    ),

                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Text("Entry by:",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
                        SizedBox(width: 8,),
                        Expanded(child: Text("Hasan",style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),)),
                      ],
                    ),
                    SizedBox(height: 10,),


                  ],
                )),
          ],
        ),
      ),
    );
  }
  Widget cattleTypeWidget() {
    return Container(
      color: Colors.white.withOpacity(0.7),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                isServiceType = !isServiceType;
                //  registerVM.getGender();
              });
            },
            child: Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border:
                    Border.all(width: 2, color: Styles.primaryColor)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        cattleType,
                        style: TextStyle(color: Styles.primaryColor),
                      ),
                      Icon(
                        isServiceType
                            ? Icons.keyboard_arrow_down_outlined
                            : Icons.keyboard_arrow_up,
                        color: Styles.primaryColor,
                      ),
                    ],
                  ),
                )),
          ),
          if (isServiceType)
            Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.grey)),
              child: SingleChildScrollView(
                child: ListView(
                  primary: true,
                  shrinkWrap: true,
                  children: serviceTypeList
                      .map((e) => e == null
                      ? CircularProgressIndicator()
                      : Container(
                    decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(
                              width: 0.7, color: Colors.grey)),
                      color: cattleType == e
                          ? Styles.primaryColor
                          : Colors.white,
                    ),
                    child: InkWell(
                        onTap: () {
                          if(cattleType == 'Select Service Type'){
                            cattleType = "";
                          }else{
                            cattleType = e.toString();
                          }
                          print(cattleType);
                          isServiceType = false;
                          setState(() {});
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            e.toString(),
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: cattleType == e
                                    ? Colors.white
                                    : Styles.primaryColor),
                          ),
                        )),
                  ))
                      .toList(),
                ),
              ),
            ),
        ],
      ),
    );
  }


  String getSystemTime() {
    var now = new DateTime.now();
    return new DateFormat.jm().format(now);
  }

}
