import 'package:flutter/material.dart';
import 'package:scapio/features/chats/screens/widgets/post_card.dart';
import 'package:scapio/features/chats/screens/widgets/post_view.dart';

class GroupScreen extends StatefulWidget {
  const GroupScreen({Key? key}) : super(key: key);

  @override
  _GroupScreenState createState() => _GroupScreenState();
}

class _GroupScreenState extends State<GroupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF2F6FA),
        appBar: AppBar(
          surfaceTintColor: Colors.white,
          automaticallyImplyLeading: false,
          title: const Text(
            'SAPIO',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w300,
                fontSize: 24,
                letterSpacing: 2),
          ),
          backgroundColor: Color(0xffF2F6FA),
        ),
        body: PostView());
  }
}
