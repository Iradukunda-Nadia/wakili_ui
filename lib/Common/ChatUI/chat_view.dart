import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wakili_ui/Common/ChatUI/received_bubble.dart';
import 'package:wakili_ui/Common/ChatUI/sent_bubble.dart';
import 'package:wakili_ui/Common/custom_transition.dart';
import 'package:wakili_ui/Common/doc_view.dart';
import 'package:wakili_ui/Common/rTextField.dart';
import 'package:wakili_ui/appUtils/app_colors.dart';

class ChatViewPage extends StatefulWidget {
  final String chatID;
  final String? chatType;
  final String? name;
  final String? text;
  final String? image;


  const ChatViewPage({Key? key,
    required this.chatID,
    this.chatType,
    this.name,
    this.text,
    this.image,}) : super(key: key);

  @override
  _ChatViewPageState createState() => _ChatViewPageState();
}

class _ChatViewPageState extends State<ChatViewPage> {

  TextEditingController msgController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            GestureDetector(
              onTap: (){},
              child: widget.image== null?
              CircleAvatar(
                radius: 20,
                backgroundColor: Theme.of(context).primaryColor,
                child: Text(
                  (widget.name == ' ' || widget.name ==''? '!' :widget.name ?? '!').substring(0, 1).toUpperCase(),
                  style:
                  TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ):CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(widget.image!),
              ),),
            SizedBox(width: 8,),
            Text(widget.name?? ''),
          ],
        ),
      ),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView(
                shrinkWrap: true,
                children: [
                  kIsWeb? SizedBox(height: 0,):
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                          context,
                          CustomPageRoute(
                              DocView()));
                    },
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.primaryDarken.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20)
                          ),
                          child: ListTile(
                            title: Text("filename. pdf",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: AppColors.primaryDarken),
                            ),
                            trailing: Icon(Icons.attachment_rounded,
                                color: AppColors.primaryDarken),
                          )
                        ),
                      ),
                    ),
                  ),
                  SentMessage(message: "Hello this is cool"),
                  ReceivedMessage(
                    message: "Hi this is an awesome chat bubble",
                    chatType: widget.chatType?? 'group',
                    date: '2023-05-03T13:48:32+00:00',
                    name: 'peter pan',
                    image: 'assets/images/maleface.png',
                  ),
                  SentMessage(message: "How are you"),
                  ReceivedMessage(message: "I am great how are you doing. It while when we talked.",
                    chatType: widget.chatType?? 'group',
                    date: '2023-05-03T13:48:32+00:00',
                    name: 'peter pan',
                    image: 'assets/images/maleface.png',),
                  SentMessage(message: "Today is a good day to try something new and work on it. Stick to the plan"),
                  ReceivedMessage(message: "I agree !!",
                    chatType: widget.chatType?? 'group',
                    date: '2023-05-03T13:48:32+00:00',
                    name: 'peter pan',
                    image: 'assets/images/tongueEmoji.png',),

                ],
              ),
            ),
            RTextField(
              controller: msgController,
              hintText: "Ask Something",
              onSuffixTapped: (txt) async {},
            )
          ],
        ),
      ),
    );
  }
}