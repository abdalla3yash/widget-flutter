import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.deepOrange),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        bottom: new TabBar(controller: tabController, tabs: <Widget>[
          new Tab(
            icon: Icon(Icons.face),
          ),
          new Tab(
            icon: Icon(Icons.mail),
          ),
        ]),
        title: Text('Widget App'),
      ),
      body: TabBarView(
        children: <Widget>[
          page1(),
          page2(),
        ],
        controller: tabController,
      ),
      bottomNavigationBar: new Material(
          color: Colors.deepOrange,
          child: new TabBar(controller: tabController, tabs: <Widget>[
            new Tab(
              icon: Icon(Icons.face),
            ),
            new Tab(
              icon: Icon(Icons.mail),
            ),
          ]
        ),
      ),
    );
  }
}

class page2 extends StatelessWidget {
  int current_step = 2;
  List<Step> my_steps = [
    new Step(
        title: Text('step 1'),
        content: Text('wake up at 9am!'),
        isActive: true),
    new Step(
        title: Text('step 2'),
        content: Text('take shower, pray and eat your meal '),
        isActive: true),
    new Step(
        title: Text('step 3'),
        content: Text('lets go to get the world better'),
        isActive: true),
    new Step(
        title: Text('step 4'),
        content: Text("it's lunch time"),
        isActive: true),
    new Step(
        title: Text('step 5'),
        content: Text("Sitting in front of the sun"),
        isActive: true),
    new Step(
        title: Text('step 6'), content: Text("visit my aunt "), isActive: true),
    new Step(
        title: Text('step 7'),
        content: Text("have a nice night sweety "),
        isActive: true),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stepper(
          steps: my_steps,
          currentStep: this.current_step,
          type: StepperType.vertical,
        ),
      ),
    );
  }
}

class page1 extends StatelessWidget {
  AlertDialog alertDialog = new AlertDialog(
    content: Text(
      'Dialog is Up',
      style: TextStyle(fontSize: 30),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: RaisedButton(
          child: Text('click Here'),
          onPressed: () => Scaffold.of(context).showSnackBar(
            SnackBar(
            content: Text('you Clicked me!'),
            duration: Duration(seconds: 3),
            )
          ),// onPressed: ()=>showDialog(context: context,child:alertDialog),
        ),
      ),
    );
  }
}
