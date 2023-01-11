import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/dummy_model/dummy_model.dart';
import 'package:whatsapp_clone/extras/app_text_styles.dart';
import 'package:whatsapp_clone/extras/colors.dart';
import 'package:whatsapp_clone/extras/constants.dart';
import 'package:whatsapp_clone/extras/extensions.dart';
import 'package:whatsapp_clone/screens/contact/view_contact.dart';
import 'package:whatsapp_clone/widgets/chat_message.dart';
import 'package:whatsapp_clone/widgets/margin_widget.dart';
import 'package:flutter/foundation.dart' as foundation;
import '../extras/app_assets.dart';

class ChatBox extends StatefulWidget {
  const ChatBox({Key? key}) : super(key: key);

  @override
  State<ChatBox> createState() => _ChatBoxState();
}

class _ChatBoxState extends State<ChatBox> {
  late double width, height, padding;
  ChatMenu? selectedMenu;
  List<DummyMessage> uniquelist = [];
  TextEditingController messageController = TextEditingController();

  bool emojiCheck = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = context.width;
    height = context.height;
    return Scaffold(
      body: Column(
        children: [
          headerRow(),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppImages.wallpaper), fit: BoxFit.fill),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    messages(),
                    messageType(),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget messageType() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    // color: CColors.lightGrey,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, top: 8, bottom: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                           // FocusScope.of(context).unfocus();
                            setState(() {
                              emojiCheck = false;
                            });
                          },
                          child: Icon(
                            Icons.emoji_emotions_outlined,
                            color: Colors.black.withOpacity(0.45),
                          ),
                        ),
                        const MarginWidget(isHorizontal: true),
                        Expanded(
                          child: TextField(
                            maxLines: null,
                            controller: messageController,
                            keyboardType: TextInputType.multiline,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 0),
                              isDense: true,
                              border: InputBorder.none,
                              hintText: "Message",
                              hintStyle: TextStyle(fontSize: 19),
                            ),
                            onChanged: (value) {
                              setState(() {});
                            },
                          ),
                        ),
                        Icon(
                          Icons.attach_file_sharp,
                          color: Colors.black.withOpacity(0.45),
                        ),
                        const MarginWidget(isHorizontal: true),
                        Icon(
                          Icons.camera_alt,
                          color: Colors.black.withOpacity(0.45),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const MarginWidget(
                isHorizontal: true,
                factor: 1,
              ),
              Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: CColors.primary,
                ),
                child: Center(
                  child: InkWell(
                    onTap: () {
                      if (messageController.text.isNotEmpty) {
                        DummyMessage dummy = DummyMessage(
                            message: messageController.text,
                            sent: true,
                            dateTime: DateTime.now());
                        setState(() {
                          Constants.dummyMessage.add(dummy);
                        });
                        messageController.text = "";
                      }
                    },
                    child: Icon(
                      messageController.text.isNotEmpty
                          ? Icons.send_outlined
                          : Icons.mic,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Offstage(
          offstage: emojiCheck,
          child: SizedBox(
            height: 250,
            child: EmojiPicker(
              onEmojiSelected: (category, emoji) {
                // Do something when emoji is tapped (optional)
              },
              onBackspacePressed: () {
                setState(() {
                  emojiCheck = true;
                });
              },
              textEditingController: messageController,
              // pass here the same [TextEditingController] that is connected to your input field, usually a [TextFormField]
              config: Config(
                columns: 7,
                emojiSizeMax: 32 *
                    (foundation.defaultTargetPlatform == TargetPlatform.iOS
                        ? 1.30
                        : 1.0),
                // Issue: https://github.com/flutter/flutter/issues/28894
                verticalSpacing: 0,
                horizontalSpacing: 0,
                gridPadding: EdgeInsets.zero,
                initCategory: Category.RECENT,
                bgColor: Color(0xFFF2F2F2),
                indicatorColor: Colors.blue,
                iconColor: Colors.grey,
                iconColorSelected: Colors.blue,
                backspaceColor: Colors.blue,
                skinToneDialogBgColor: Colors.white,
                skinToneIndicatorColor: Colors.grey,
                enableSkinTones: true,
                showRecentsTab: true,
                recentsLimit: 28,
                noRecents: const Text(
                  'No Recents',
                  style: TextStyle(fontSize: 20, color: Colors.black26),
                  textAlign: TextAlign.center,
                ),
                // Needs to be const Widget
                loadingIndicator: const SizedBox.shrink(),
                // Needs to be const Widget
                tabIndicatorAnimDuration: kTabScrollDuration,
                categoryIcons: const CategoryIcons(),
                buttonMode: ButtonMode.MATERIAL,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget messages() {
    var seen = <String>{};
    uniquelist = Constants.dummyMessage
        .where((student) => seen.add(
            "${student.dateTime.year}-${student.dateTime.month}-${student.dateTime.day}"))
        .toList();

    return Expanded(
      child: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: [
            for (int i = 0; i < uniquelist.length; i++) ...[
              ChatMessage(dateTime: uniquelist[i].dateTime)
              // chatDate(),
            ]

            // chatDate(),
            // messageBox(Alignment.centerLeft, "Hii"),
            // const MarginWidget(
            //   factor: 0.5,
            // ),
            // messageBox(Alignment.centerLeft, "Lorem ipsum dolor"),
            // const MarginWidget(),
            // messageBox(Alignment.centerRight, "sit amet, consctetur",
            //     read: true),
            // const MarginWidget(
            //   factor: 0.5,
            // ),
            // messageBox(Alignment.centerRight,
            //     "Nullam auctor accumsan ex.\nAenean ac commodo felis\nVivamus cursus libero",
            //     read: true),
            // const MarginWidget(),
            // messageBox(Alignment.centerLeft,
            //     "adipiscing elit. Praesent\negestas mi id cus"),
            // const MarginWidget(
            //   factor: 0.5,
            // ),
            // messageBox(Alignment.centerLeft, "Hii"),
            // const MarginWidget(),
            // chatDate(),
            // const MarginWidget(),
            // messageBox(Alignment.centerRight, "sit amet, consctetur",
            //     read: true),
            // const MarginWidget(
            //   factor: 0.5,
            // ),
            // messageBox(Alignment.centerRight,
            //     "Nullam auctor accumsan ex.\nAenean ac commodo felis\nVivamus cursus libero"),
            // const MarginWidget(),
          ],
        ),
      ),
    );
  }

  Widget headerRow() {
    return Container(
      width: double.infinity,
      height: height * 0.12,
      color: CColors.primary,
      child: Padding(
        padding: EdgeInsets.only(top: height * 0.042, left: 5, right: 5),
        child: InkWell(
          onTap: () {
            context.push(child: const ViewContact());
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  context.pop();
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
              const MarginWidget(
                isHorizontal: true,
                factor: 0.4,
              ),
              Stack(
                children: [
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: CColors.primary,
                    ),
                    child: Image(
                      image: AssetImage(AppImages.person),
                    ),
                  ),
                  const Positioned(
                    right: 0,
                    child: CircleAvatar(
                      backgroundColor: Colors.green,
                      radius: 7,
                    ),
                  ),
                ],
              ),
              const MarginWidget(
                isHorizontal: true,
              ),
              Expanded(
                child: Text(
                  "Abelson",
                  style: AppTextStyle.robot(
                    style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Colors.white),
                  ),
                ),
              ),
              const Icon(
                Icons.videocam_rounded,
                color: Colors.white,
                size: 33,
              ),
              const MarginWidget(
                isHorizontal: true,
                factor: 1.5,
              ),
              const Icon(
                Icons.phone,
                color: Colors.white,
                size: 33,
              ),
              const MarginWidget(
                isHorizontal: true,
              ),
              PopupMenuButton(
                child: const Icon(
                  Icons.more_vert_outlined,
                  color: Colors.white,
                  size: 33,
                ),
                onSelected: (value) {
                  // your logic
                },
                itemBuilder: (BuildContext bc) {
                  return Constants.chatMenuItem;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
