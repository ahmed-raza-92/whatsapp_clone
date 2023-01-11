import 'package:flutter/material.dart';
import 'package:whatsapp_clone/dummy_model/dummy_model.dart';

class Constants {
  static List<DummyMessage> dummyMessage = [
    DummyMessage(
      message: " Hey, what's up?",
      sent: true,
      read: true,
      dateTime: DateTime.parse('2023-01-03 20:18:04Z'),
    ),
    DummyMessage(
      message: "Not much, just finished up a project at work.How about you?",
      sent: false,
      dateTime: DateTime.parse('2023-01-03 20:24:04Z'),
    ),
    DummyMessage(
      message:
          "Same, it's been a busy day. I just got home and was about to make dinner.",
      sent: true,
      read: true,
      dateTime: DateTime.parse('2023-01-03 20:30:04Z'),
    ),
    DummyMessage(
      message: "Oh, what are you making?",
      sent: false,
      read: true,
      dateTime: DateTime.parse('2023-01-03 20:40:04Z'),
    ),
    DummyMessage(
      message: "Just some pasta with marinara sauce. Nothing too fancy.",
      sent: true,
      read: true,
      dateTime: DateTime.parse('2023-01-03 20:45:04Z'),
    ),
    DummyMessage(
      message:
          "That sounds good. I'm actually at a restaurant right now, trying out this new sushi place.",
      sent: false,
      dateTime: DateTime.parse('2023-01-03 20:55:04Z'),
    ),
    DummyMessage(
      message: "Oh, that sounds delicious. How is it?",
      sent: true,
      read: true,
      dateTime: DateTime.parse('2023-01-03 21:18:04Z'),
    ),
    DummyMessage(
      message:
          "It's actually really good. The sushi is fresh and the service is great.",
      sent: false,
      dateTime: DateTime.parse('2023-01-04 07:18:04Z'),
    ),
    DummyMessage(
      message:
          "I love sushi. Maybe I'll have to check out this place sometime.",
      sent: true,
      read: true,
      dateTime: DateTime.parse('2023-01-04 08:20:04Z'),
    ),
    DummyMessage(
      message:
          "You definitely should. They have a wide variety of rolls to choose from,and the prices are reasonable.",
      sent: false,
      dateTime: DateTime.parse('2023-01-04 10:34:04Z'),
    ),
    DummyMessage(
      message:
          "Sounds like a plan. I'll have to treat myself to some sushi soon.",
      sent: true,
      read: true,
      dateTime: DateTime.parse('2023-01-04 11:18:04Z'),
    ),


    DummyMessage(
      message:
          "Yeah, you should. It's a great way to relax and treat yourself after a long day.",
      sent: false,
      dateTime: DateTime.parse('2023-01-04 13:39:04Z'),
    ),
    DummyMessage(
      message:
          "Definitely. Thanks for the recommendation.I'll have to try it out.",
      sent: true,
      read: true,
      dateTime: DateTime.parse('2023-01-04 16:09:04Z'),
    ),
    DummyMessage(
      message: "No problem. I'm glad I could help.Enjoy your dinner!",
      sent: false,
      dateTime: DateTime.parse('2023-01-04 15:44:04Z'),
    ),
    DummyMessage(
      message: "Thanks! You too.",
      sent: true,
      dateTime: DateTime.parse('2023-01-04 07:18:04Z'),
    ),
  ];

  static List<PopupMenuItem> chatMenuItem = [
    returnMenu("viewContact", "View Contact"),
    returnMenu("media", "Media and Notifications"),
    returnMenu("search", "Search"),
    returnMenu("mute", "Mute Notifications"),
    returnMenu("more", "More"),
  ];

  static List<PopupMenuItem> homeMenuList = [
    returnMenu("newGroup", "New Group"),
    returnMenu("newBroadcast", "New broadcast"),
    returnMenu("linkedDevices", "Linked devices"),
    returnMenu("starredMessages", "Starred messages"),
    returnMenu("settings", "Settings"),
  ];

  static List<PopupMenuItem> profileMenuList = [
    returnMenu("share", "Share"),
    returnMenu("edit", "Edit"),
    returnMenu("view", "View in address book"),
    returnMenu("verify", "Verify security code"),
  ];

  static PopupMenuItem returnMenu(String value, String text) {
    return PopupMenuItem(
      value: '/$value',
      child: Text(text),
    );
  }
}

enum ProfileMenu { share, edit, view, verify }

enum HomeMenu {
  newGroup,
  newBroadcast,
  linkedDevices,
  starredMessages,
  settings
}

enum ChatMenu { viewContact, media, search, mute, more }
