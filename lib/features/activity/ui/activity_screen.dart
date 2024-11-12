import 'package:challenge/core/theming/styles.dart';
import 'package:challenge/features/activity/ui/widgets/build_pressure_tap.dart';
import 'package:challenge/features/activity/ui/widgets/build_suger_tab.dart';
import 'package:challenge/features/activity/ui/widgets/build_weight_tap.dart';
import 'package:flutter/material.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'الأنشطة',
            style: TextStyles.font18BlackBold,
          ),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
          elevation: 4,
          bottom: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey[300],
            indicatorColor: Colors.yellowAccent,
            indicatorWeight: 4,
            tabs: const [
              Tab(text: 'سكر'),
              Tab(text: 'ضغط'),
              Tab(text: 'وزن'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SugarTabWidget(),
            PressureTab(),
            WeightTab(),
          ],
        ),
      ),
    );
  }
}
