
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:number_to_words_english/number_to_words_english.dart';

import '../utils/style_colors.dart';
import '../widgets/rounded_button.dart';

class PrintPreviewScreen extends StatefulWidget {

  final dynamic currentDate;
  final dynamic currentTime;
  final dynamic buyerName;
  final dynamic cattleType;
  final dynamic cattlePrice;
  final dynamic hasil;
  final dynamic totlaPrice;



  PrintPreviewScreen({this.currentDate, this.currentTime, this.buyerName,
      this.cattleType, this.cattlePrice, this.hasil, this.totlaPrice});

  @override
  State<PrintPreviewScreen> createState() => _PrintPreviewScreenState();
}

class _PrintPreviewScreenState extends State<PrintPreviewScreen> {

  var f = NumberFormat("###.0#", "en_US");


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  height: Get.height * 0.9,
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.black),
                      color: Color(0xffFFF8F8)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        SizedBox(height: 20,),
                        Center(child: Text("Money Receipt", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16, color: Colors.black),)),
                        SizedBox(height: 30,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text("Receipt No :", style: Styles.normalTextBlack16_600),
                                SizedBox(width: 8,),
                                Text("09857",style:  Styles.normalTextBlack14_400),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Date :", style: Styles.normalTextBlack16_600),
                                SizedBox(width: 8,),
                                Text("${widget.currentDate}",style:  Styles.normalTextBlack14_400),
                              ],
                            )
                          ],
                        ),

                        SizedBox(height: 40,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("To", style:  Styles.normalTextBlack14_400),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("${widget.buyerName}", style:  Styles.normalTextBlack16_600),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Text("Description", style:  Styles.normalTextBlack16_600),
                            SizedBox(width: 8,),
                            Text("${widget.cattleType}", style:  Styles.normalTextBlack14_400),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Net Price :", style:  Styles.normalTextBlack16_600),
                            SizedBox(width: 8,),
                            Text("BDT ${widget.cattlePrice}", style:  Styles.normalTextBlack14_400),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Hasil :", style:  Styles.normalTextBlack16_600),
                            Text("BDT ${f.format(widget.hasil)}", style:  Styles.normalTextBlack14_400),
                          ],
                        ),

                        SizedBox(height: 30,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Total Amount :", style:  Styles.normalTextBlack16_600),
                            Text("BDT ${widget.totlaPrice}", style:  Styles.normalTextBlack14_400),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            Text("In Word :", style:  Styles.normalTextBlack16_600),
                            SizedBox(width: 8,),

                            Expanded(
                                child: Text(NumberToWordsEnglish.convert(widget.totlaPrice.toInt()), style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500))),
                          ],
                        ),
                        SizedBox(height: Get.height * 0.2),
                        RoundedButton(
                            fontSize: 20,
                            width: Get.width * 0.4,
                            title: "Send",
                            color: Styles.primaryColor,
                            onTap: (){

                            })
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}
