import 'package:flutter/material.dart';
import 'package:sakan/config/theme/header_widget.dart';
import 'package:sakan/core/constant/constant.dart';
import 'package:sakan/core/widgets/button_weidget.dart';
import 'package:sakan/core/widgets/card_decoration_weidget.dart';

class RegisterOnSakanDetailesPage extends StatelessWidget {
  const RegisterOnSakanDetailesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 4,
              child:
                  HeaderWidget(height: MediaQuery.of(context).size.height / 4),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(20),
              decoration: cardDecorationWeidget(),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'شرح آلية التسجيل على السكن',
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'للتسجل على  السكن يجب عليك اتباع ثلاث خطوات بسيطة :',
                    style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Wrap(
                    children: [
                      Text(
                        'الخطوة الأولى : ',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'اختيار غرفة ',
                        style: TextStyle(
                          color: Colors.black45,
                        ),
                      ),
                    ],
                  ),
                    SizedBox(
                    height: 10,
                  ),
                  Wrap(
                    children: [
                      Text(
                        'الخطوة الثانية : ',
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'إرسال المرفقات (صورة الهوية وجه أمامي و خلفي ...)',
                        style: TextStyle(
                          color: Colors.black45,
                        ),
                      ),
                    ],
                  ),
                    SizedBox(
                    height: 10,
                  ),
                  Wrap(
                    children: [
                      Text(
                        'الخطوة الثالثة : ',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'الدفع الإلكتروني ',
                        style: TextStyle(
                          color: Colors.black45,
                        ),
                      ),
                    ],
                  ),
                  
                ],
              ),
            ),
            ButtonWeidget( title: 'الانتقال إلى صفحة التسجيل', onPressed:() {
    
                    Navigator.pushNamed(context, registerOnSakanPage);
                  },)
          ],
        ),
      ),
    );
  }
}
