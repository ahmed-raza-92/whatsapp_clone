import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/extras/app_text_styles.dart';
import 'package:whatsapp_clone/extras/colors.dart';
import 'package:whatsapp_clone/extras/extensions.dart';
import 'package:whatsapp_clone/widgets/margin_widget.dart';

import '../../extras/app_assets.dart';
import '../../extras/constants.dart';

class ViewContact extends StatefulWidget {
  const ViewContact({Key? key}) : super(key: key);

  @override
  State<ViewContact> createState() => _ViewContactState();
}

class _ViewContactState extends State<ViewContact> {
  bool notificationCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(slivers: [
          // SliverAppBar(
          //   backgroundColor: Colors.transparent,
          //   title: profileDetail(),
          //   automaticallyImplyLeading: false,
          //   titleSpacing: 0,
          //   expandedHeight: 400,
          //   flexibleSpace: profileDetail(),
          //   pinned: true,
          //
          // ),
          SliverToBoxAdapter(child: profileDetail()),
          gap(),
          SliverToBoxAdapter(child: about()),
          gap(),
          SliverToBoxAdapter(child: mediaLinksDocs()),
          gap(),
          SliverToBoxAdapter(child: notificationsMedia()),
          gap(),
          SliverToBoxAdapter(child: encryption()),
          gap(),
          SliverToBoxAdapter(child: groups()),
          gap(),
          SliverToBoxAdapter(
            child: blockOrReport(),
          ),
        ]),
      ),
    );
  }

  Widget blockOrReport() {
    return parentCard(
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            notificationsMediaRow("Block Ahmed Raza", Icons.block, color: true),
            const MarginWidget(factor: 1.5),
            notificationsMediaRow("Report Ahmed Raza", Icons.thumb_down, color: true),

          ],
        ),
      ),
    );
  }

  MarginWidget gap() => const MarginWidget(isSliver: true);

  Widget groups() {
    return parentCard(
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            h2("No groups in common"),
            const MarginWidget(),
            Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: CColors.primary,
                  ),
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.people,
                    color: Colors.white,
                  ),
                ),
                const MarginWidget(isHorizontal: true),
                h1("Create group with Ahmed Raza"),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget encryption() {
    return parentCard(Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          notificationsMediaRow(
              "Encryption", Icons.enhanced_encryption_rounded),
          const MarginWidget(factor: 1.5),
          notificationsMediaRow("Disappering messages", Icons.timer),
        ],
      ),
    ));
  }

  Widget mediaLinksDocs() {
    return parentCard(
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [h1("Media, links, and docs"), h2("4 >")],
        ),
      ),
    );
  }

  Widget notificationsMedia() {
    return parentCard(
      Padding(
        padding:
            const EdgeInsets.only(top: 20, bottom: 20, left: 25, right: 25),
        child: Column(
          children: [
            notificationsMediaRow("Mute notifications", Icons.notifications,
                check: true),
            const MarginWidget(factor: 1.5),
            notificationsMediaRow("Custom notifications", Icons.music_note),
            const MarginWidget(factor: 1.5),
            notificationsMediaRow("Media visibility", Icons.photo),
          ],
        ),
      ),
    );
  }

  Widget notificationsMediaRow(String text, IconData data,
      {bool check = false, bool color = false}) {
    return Row(
      children: [
        Icon(
          data,
          color: color == false ? Colors.black.withOpacity(0.6) : Colors.red,
        ),
        const MarginWidget(isHorizontal: true),
        Expanded(child: h1(text, color: color)),
        if (check)
          Switch(
            value: notificationCheck,
            activeColor: CColors.primary,
            onChanged: (val) {
              setState(() {
                notificationCheck = !notificationCheck;
              });
            },
          ),
      ],
    );
  }

  Widget parentCard(Widget child) {
    return Card(
      elevation: 1,
      child: child,
    );
  }

  Widget about() {
    return parentCard(
      SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              h1("Ahamdulilah for everything.❤️"),
              const MarginWidget(factor: 0.3),
              h2("October 18, 2022"),
            ],
          ),
        ),
      ),
    );
  }

  Text h2(String str) {
    return Text(
      str,
      style: TextStyle(
        color: Colors.black.withOpacity(0.5),
      ),
    );
  }

  Text h1(String str, {bool color = false}) {
    return Text(
      str,
      style: AppTextStyle.robot(
        style: TextStyle(
            fontSize: 17, color: color == false ? Colors.black : Colors.red),
      ),
    );
  }

  Widget profileDetail() {
    return parentCard(
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      context.pop();
                    },
                    child: const Icon(Icons.arrow_back),
                  ),
                  Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Image(
                      image: AssetImage(AppImages.person),
                    ),
                  ),
                  PopupMenuButton(
                    child: const Icon(
                      Icons.more_vert_outlined,
                    ),
                    onSelected: (value) {
                      // your logic
                    },
                    itemBuilder: (BuildContext bc) {
                      return Constants.profileMenuList;
                    },
                  )
                ],
              ),
              const MarginWidget(),
              Text(
                "Ahmed Raza",
                style: AppTextStyle.robot(
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 24,
                  ),
                ),
              ),
              const MarginWidget(factor: 0.5),
              buildText("+92302*****1245"),
              const MarginWidget(factor: 0.5),
              buildText("Last seen Thu 2:003 PM", size: 15),
              const MarginWidget(factor: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  options(Icons.phone, "Audio"),
                  const MarginWidget(isHorizontal: true, factor: 2.5),
                  options(Icons.videocam_rounded, "Video"),
                  const MarginWidget(isHorizontal: true, factor: 2.5),
                  options(Icons.search, "Search"),
                ],
              ),
              const MarginWidget(factor: 0.3),
            ],
          ),
        ),
      ),
    );
  }

  Widget options(IconData data, String text) {
    return Column(
      children: [
        Icon(
          data,
          color: CColors.primary,
          size: 35,
        ),
        const MarginWidget(factor: 0.5),
        Text(
          text,
          style: AppTextStyle.robot(
              style: TextStyle(
                  color: CColors.primary, fontWeight: FontWeight.w500)),
        )
      ],
    );
  }

  Text buildText(String str, {double size = 18}) {
    return Text(
      str,
      style: AppTextStyle.robot(
        style: TextStyle(
          fontSize: size,
          color: Colors.black.withOpacity(0.5),
        ),
      ),
    );
  }
}
