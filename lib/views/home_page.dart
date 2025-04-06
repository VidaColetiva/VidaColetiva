import 'package:flutter/material.dart';
import 'package:vidacoletiva/resources/widgets/main_drawer.dart';
import 'package:vidacoletiva/resources/widgets/sliver_app_bar.dart';
import 'package:vidacoletiva/views/events_page.dart';
import 'package:vidacoletiva/views/home2_page.dart';
import '../resources/widgets/main_bottom_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          key: scaffoldKey,
          bottomNavigationBar: mainBottomBar(context, 0),
          endDrawer: mainDrawer(context),
          body: CustomScrollView(
            slivers: [
              mainSliverAppBar(context, scaffoldKey: scaffoldKey),
              SliverToBoxAdapter(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: const TabBarView(
                    children: [
                      Home2Page(),
                      EventsPage(),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
