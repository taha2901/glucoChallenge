import 'package:flutter/material.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelColor: Colors.black,
      unselectedLabelColor: Colors.grey,
      indicatorColor: Colors.blue,
      indicatorWeight: 4,
      tabs: [
        Tab(text: 'سكر'),
        Tab(text: 'ضغط'),
        Tab(text: 'وزن'),
        Tab(text: 'عدد الخطوات'),
      ],
    );
  }
}

class TabBarViewWidget extends StatelessWidget {
  const TabBarViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: TabBarView(
        children: [
          Center(child: Text('محتوى سكر')),
          Center(child: Text('محتوى ضغط')),
          Center(child: Text('محتوى وزن')),
          Center(child: Text('محتوى عدد الخطوات')),
        ],
      ),
    );
  }
}