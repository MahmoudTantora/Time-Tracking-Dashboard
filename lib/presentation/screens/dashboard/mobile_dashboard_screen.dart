import 'package:flutter/material.dart';import 'package:time_tracking_dashboard/presentation/screens/dashboard/widget/time_tracking_list_widget.dart';import 'package:time_tracking_dashboard/presentation/screens/dashboard/widget/profile_widget.dart';import 'package:time_tracking_dashboard/presentation/themes/custom_colors.dart';class MobileDashboardScreen extends StatelessWidget {  const MobileDashboardScreen({Key? key}) : super(key: key);  @override  Widget build(BuildContext context) {    final paddingWidth = MediaQuery.of(context).size.width / 15;    return Container(      color: CustomColors.darkBlueColor,      child: SafeArea(        child: Scaffold(          backgroundColor: CustomColors.veryDarkBlueColor,          body: SingleChildScrollView(            child: Padding(              padding: EdgeInsets.symmetric(                  vertical: 70.0, horizontal: paddingWidth),              child: Column(                children: const [                  ProfileWidget(),                  SizedBox(height: 30),                  TimeTrackingListWidget(),                ],              ),            ),          ),        ),      ),    );  }}