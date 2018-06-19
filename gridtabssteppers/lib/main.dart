import 'package:flutter/material.dart';

main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    tabController.dispose();
    super.dispose();
  }

  TabBar makeTabBar() {
    return TabBar(tabs: <Tab>[
      Tab(
        icon: Icon(Icons.home),
      ),
      Tab(
        icon: Icon(Icons.settings_power),
      )
    ], controller: tabController);
  }

  TabBarView makeTabBarView(tabs) {
    return TabBarView(
      children: tabs,
      controller: tabController,
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          bottom: makeTabBar(),
        ),
        body: makeTabBarView(<Widget>[TheGridView().build(), SimpleWidget()]),
      ),
    );
  }
}

class SimpleWidget extends StatefulWidget {
  @override
  _SimpleWidgetState createState() => _SimpleWidgetState();
}

class _SimpleWidgetState extends State<SimpleWidget> {
  int step_counter = 0;
  List<Step> steps = [
    Step(
        title: Text("Step One"),
        content: Text("This is first step"),
        isActive: true),
    Step(
        title: Text("Step Two"),
        content: Text("This is second step"),
        isActive: true),
    Step(
        title: Text("Step Three"),
        content: Text("This is three step"),
        isActive: true),
    Step(
      title: Text("Step Four"),
      content: Text("This is fourth step"),
      //isActive: true
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stepper(
        currentStep: this.step_counter,
        steps: steps,
        type: StepperType.horizontal,
        onStepCancel: () {
          setState(() {
            step_counter > 0 ? step_counter = -1 : step_counter = 0;
          });
        },
        onStepTapped: (step) {
          setState(() {
            step_counter = step;
          });
        },
        onStepContinue: () {
          setState(() {
            step_counter < steps.length - 1
                ? step_counter += 1
                : step_counter = 0;
          });
        },
      ),
    );
  }
}

class TheGridView {
  Card makeGridCell(String name, IconData icon) {
    return Card(
      elevation: 1.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          Center(
            child: Icon(icon),
          ),
          Center(child: Text(name))
        ],
      ),
    );
  }

  GridView build() {
    return GridView.count(
      primary: true,
      padding: EdgeInsets.all(1.0),
      crossAxisCount: 2,
      childAspectRatio: 1.0,
      mainAxisSpacing: 1.0,
      crossAxisSpacing: 1.0,
      children: <Widget>[
        makeGridCell("Home", Icons.home),
        makeGridCell("Email", Icons.email),
        makeGridCell("Chat", Icons.chat_bubble),
        makeGridCell("New", Icons.new_releases),
        makeGridCell("Networl", Icons.network_wifi),
        makeGridCell("Options", Icons.settings),
      ],
    );
  }
}
