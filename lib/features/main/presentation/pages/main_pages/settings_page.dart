import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sakan/core/colors/colors.dart';
import 'package:sakan/core/widgets/option_settings_widget.dart';
import 'package:sakan/features/main/presentation/widgets/sliver_app_bar.dart';

class SettingsPage extends StatefulWidget {
  
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isNotificaiton=true;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body:CustomScrollView(slivers: [
        SliverAppBarWidget(title: 'الإعدادات',collapsedHeight: MediaQuery.of(context).size.height/4,),
        SliverToBoxAdapter(child:  Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.person,
                      color: Theme.of(context).primaryColor,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'الحساب',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  color: Colors.grey,
                  height: 1,
                ),
                const SizedBox(
                  height: 20,
                ),
                buildAccountOptionWidget(
                  title: 'تغير كلمة السر',
                ),
                buildAccountOptionWidget(title: 'اللغة'),
                 
                
                buildAccountOptionWidget(
                  title: 'تعديل معلومات الحساب',
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.volume_down,
                      color: Theme.of(context).primaryColor,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'الإشعارات',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  color: Colors.grey,
                  height: 1,
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'الإشعارات',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.grey[600]),
                      ),

                      const Spacer(),
                      Transform.scale(
                        scale: 0.8,
                        origin: const Offset(5.0, 5.0),
                        child: CupertinoSwitch(
                          activeColor: MyColors.secondaryColor,
                          trackColor: MyColors.primaryColor,
                          value: isNotificaiton,
                          onChanged: (bool value) {
                            setState(() {
                               isNotificaiton=value;
                            });
                           
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],)
      
    );
  }
}
