import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_tracking_dashboard/di/git_it.dart';
import 'package:time_tracking_dashboard/presentation/blocs/choose_time_period/choose_time_period_cubit.dart';
import 'package:time_tracking_dashboard/presentation/blocs/fetch_time_tracking/fetch_time_tracking_cubit.dart';
import 'package:time_tracking_dashboard/presentation/responsive_layout.dart';
import 'package:time_tracking_dashboard/presentation/screens/dashboard/descktop_dashboard_Screen.dart';
import 'package:time_tracking_dashboard/presentation/screens/dashboard/mobile_dashboard_screen.dart';

void main() async {
  await init();
  runApp(const TimeTrackingApp());
}

class TimeTrackingApp extends StatelessWidget {
  const TimeTrackingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time Tracking Dashboard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Rubik',
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  getItInstance<FetchTimeTrackingCubit>()..fetchTimesData(),
            ),
            BlocProvider(
              create: (context) => getItInstance<ChooseTimePeriodCubit>(),
            ),
          ],
          child: const ResponsiveLayout(
            mobile: MobileDashboardScreen(),
            web: DesktopDashboardScreen(),
          ),
        ),
      ),
    );
  }
}
