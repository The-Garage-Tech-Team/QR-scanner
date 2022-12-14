// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../controller/user_controller.dart';
import '../../utils/colors.dart';
import '../widget/scanQR/qr_widget.dart';
import '../../model/admin/text_widget.dart';

class Home extends StatelessWidget {
  Home({super.key});
  UserController controller = Get.find(tag: "data");
  final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
  Future sendEmail() async {
    final request = await http.post(url,
        headers: {
          'origin': 'http://localhost',
          'Content-Type': 'application/json'
        },
        body: json.encode({
          'service_id': 'service_xzvc7yw',
          'template_id': 'template_8bkp8ig',
          'user_id': 'LdDLNcQ3JEglZmH07',
          'template_params': {
            'from_Event': 'The Garage',
            'to_name': controller.userName.value,
            'email': controller.uniqueString.value,
            'message': 'Details'
          }
        }));
    print(request.statusCode);
  }

  @override
  Widget build(BuildContext context) {
    controller.currentUser(0);
    sendEmail();
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.95,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1537),
                      TextWidget(
                        text: controller.userName.value,
                        color: blackColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.0258),
                      TextWidget(
                        text: controller.userJob.value,
                        color: blackColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.0258),
                      TextWidget(
                        text: controller.userCompany.value,
                        color: blackColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.0375),
                      QRWidget(
                        uniqueString: controller.uniqueString.value,
                        size: 200,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1514),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              color: greyColor,
              height: MediaQuery.of(context).size.height * 0.1537,
              width: MediaQuery.of(context).size.width,
              child: Center(
                  child: TextWidget(
                      text: 'Company logo and name',
                      color: blackColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600)),
            )
          ],
        ),
      ),
    );
  }
}
