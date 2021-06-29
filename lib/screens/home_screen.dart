import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/constants.dart';
import 'package:untitled3/models/load_category.dart';
import 'package:http/http.dart'as http;
import 'package:untitled3/screens/bottom_bar_screens/pr_screen.dart';

import '../service.dart';
import 'bottom_bar_screens/ch_screen.dart';
import 'bottom_bar_screens/glawny_screen.dart';
import 'bottom_bar_screens/iz_screen.dart';
import 'bottom_bar_screens/raz_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Uri url = Uri.parse('http://127.0.0.1:8000/app/category-list/?format=json');
  Future<List<Categories>> fetchCategories() async{
    http.Response response = await http.get(url);
    if (response.statusCode ==200){
      return parseCategories(response);
    }
  }
  List<Categories> parseCategories(var response){
    final parsed = jsonDecode(utf8.decode(response.bodyBytes)).cast<Map<String, dynamic>>();
    return parsed.map<Categories>((json)=> Categories.fromMap(json)).toList();
  }
  int currentTab = 0;
  final List<Widget> screens = [
    GlawnyScreen(),
    IzbrannyScreen(),
    RazmestitScreen(),
    ChatScreen(),
    ProfileScreen()

  ];
  Color PrimaryColor = Color(0xff206676);
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = GlawnyScreen();
  void _incrementCounter(){
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    print(fetchCategories());
    return DefaultTabController(
      length: 6,
      child: Scaffold(
          backgroundColor: kBackgroundColor,
          appBar: AppBar(
            backgroundColor: PrimaryColor,

            title: Text('Elyeter', style: TextStyle(
                color: kAllIconColor,fontWeight: FontWeight.w800, fontFamily: 'RougeScript', fontSize: 45),
            ),
              bottom: TabBar(
                isScrollable: true,
                indicatorColor: Color(0xff60B9CE),
                indicatorWeight: 6.0,
                onTap: (index){
                  setState(() {
                    switch(index){
                      case 0: PrimaryColor = Color(0xff206676);
                      break;
                      case 1: PrimaryColor = Color(0xff3a9db3);
                      break;
                      case 2: PrimaryColor = Color(0xff2471ab);
                      break;
                      case 3: PrimaryColor = Color(0xff1b6298);
                      break;
                      case 4: PrimaryColor = Color(0xff175a8d);
                      break;
                      case 5: PrimaryColor = Color(0xff0f4e7e);
                      break;
                      default:

                    }
                  });
                },
                tabs: <Widget>[
                  Tab(
                    child: Container(
                      child: IconButton(
                        onPressed: (){},
                      icon: Icon(Icons.tune, color: kAllIconColor,),)
                    ),
                  ),
                  GestureDetector(
                    child: Tab(
                      child: Container(
                        child: Text('Telephone', style: TextStyle(
                          color: kAllIconColor,fontSize: 18
                        ),) ,
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      child: Text('Telephone', style: TextStyle(
                          color: kAllIconColor,fontSize: 18
                      ),) ,
                    ),
                  ),
                  Tab(
                    child: Container(
                      child: Text('Telephone', style: TextStyle(
                          color: kAllIconColor,fontSize: 18
                      ),) ,
                    ),
                  ),
                  Tab(
                    child: Container(
                      child: Text('Telephone', style: TextStyle(
                          color:kAllIconColor,fontSize: 18
                      ),) ,
                    ),
                  ),
                  Tab(
                    child: Container(
                      child: Text('Telephone', style: TextStyle(
                          color: kAllIconColor,fontSize: 18
                      ),) ,
                    ),
                  ),

                ],
              ),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {

                }, icon: Icon(Icons.search), color: kAllIconColor,)
            ],
          ),
          body: PageStorage(bucket: bucket, child: currentScreen),
          floatingActionButton: FloatingActionButton(

            child: Icon(Icons.add),
            backgroundColor: Color(0xff206676),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> RazmestitScreen()));
            },
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            shape: CircularNotchedRectangle(),
            notchMargin: 10,
            child: Container(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MaterialButton(
                        minWidth: 40,
                        onPressed: () {
                          setState(() {
                            currentScreen = GlawnyScreen();
                            currentTab = 0;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.home,
                              color: currentTab == 0 ? Color(0xff015367) : Colors
                                  .grey,
                            ),
                            Text('Главная', style: TextStyle(color: currentTab ==
                                0 ? Color(0xff015367) : Colors.grey),)

                          ],
                        ),

                      ),
                      MaterialButton(
                        minWidth: 40,
                        onPressed: () {
                          setState(() {
                            currentScreen = IzbrannyScreen();
                            currentTab = 1;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.favorite,
                              color: currentTab == 1 ? Color(0xff015367) : Colors
                                  .grey,
                            ),
                            Text('Избранное', style: TextStyle(color: currentTab ==
                                1 ? Color(0xff015367) : Colors.grey),)

                          ],
                        ),

                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MaterialButton(
                        minWidth: 40,
                        onPressed: () {
                          setState(() {
                            currentScreen = ChatScreen();
                            currentTab = 2;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.chat,
                              color: currentTab == 2 ? Color(0xff015367) : Colors
                                  .grey,
                            ),
                            Text('Сообщения', style: TextStyle(color: currentTab ==
                                2 ? Color(0xff015367) : Colors.grey),)

                          ],
                        ),

                      ),
                      MaterialButton(
                        minWidth: 40,
                        onPressed: () {
                          setState(() {
                            currentScreen = ProfileScreen();
                            currentTab = 3;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.person,
                              color: currentTab == 3 ? Color(0xff015367) : Colors
                                  .grey,
                            ),
                            Text('Профиль', style: TextStyle(color: currentTab ==
                                3 ? Color(0xff015367) : Colors.grey),)

                          ],
                        ),

                      ),
                    ],
                  ),
                ],
              ),
            ),

          ),

      ),
    );
  }
}