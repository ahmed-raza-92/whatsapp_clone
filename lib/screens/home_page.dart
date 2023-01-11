import 'package:flutter/material.dart';
import 'package:whatsapp_clone/extras/app_assets.dart';
import 'package:whatsapp_clone/extras/colors.dart';
import 'package:whatsapp_clone/extras/extensions.dart';
import 'package:whatsapp_clone/screens/chat_box.dart';
import 'package:whatsapp_clone/widgets/margin_widget.dart';

import '../extras/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late double width, padding;
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  List<Widget> tabBarViews = [
    const ChatScreen(),
    const Center(child: Text("This Is Second View")),
    const Center(child: Text("This Is Third View")),
  ];

  @override
  Widget build(BuildContext context) {
    width = context.width;
    padding = width * 0.05;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: CColors.primary,
        onPressed: () {},
        child: const Icon(Icons.messenger),
      ),
      appBar: appBarWidget(),
      body: TabBarView(
        controller: controller,
        children: tabBarViews,
      ),
    );
  }

  PreferredSize appBarWidget() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(110),
      child: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: CColors.primary,
        title: const Text(
          "WhatsApp",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          const Icon(
            Icons.search,
            color: Colors.white,
          ),
          const MarginWidget(isHorizontal: true),
          PopupMenuButton(
            child: const Icon(
              Icons.more_vert_outlined,
              color: Colors.white,
            ),
            onSelected: (value) {
              // your logic
            },
            itemBuilder: (BuildContext bc) {
              return Constants.homeMenuList;
            },
          )
        ],
        bottom: TabBar(
          indicatorColor: Colors.white,
          isScrollable: true,
          indicator: const UnderlineTabIndicator(
            borderSide: BorderSide(width: 3.0, color: Colors.white),
          ),
          labelPadding:  EdgeInsets.symmetric(horizontal: width * 0.104),
          tabs: [
            buildText("CHAT"),
            buildText("CALLS"),
            buildText("STATS"),
          ],
          controller: controller,
        ),
      ),
    );
  }

  Widget buildText(String str) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        str,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 16,
        ),
      ),
    );
  }
}

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 12,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              context.push(child: const ChatBox());
            },
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: CColors.primary,
                    ),
                    child: Image(
                      image: AssetImage(AppImages.person),
                    ),
                  ),
                  const MarginWidget(isHorizontal: true, factor: 1),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          "Jane",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        const MarginWidget(factor: 0.5),
                        Text(
                          "Hey There. Are you using whatsapp",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black.withOpacity(0.3)),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        "5:27 am",
                        style: TextStyle(
                          color: CColors.primary,
                        ),
                      ),
                      const MarginWidget(factor: 0.5),
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: CColors.primary,
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          "4",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
