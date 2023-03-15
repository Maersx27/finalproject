import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalpro/constants/r.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatPagee extends StatefulWidget {
  const ChatPagee({super.key});

  @override
  State<ChatPagee> createState() => _ChatPageeState();
}

class _ChatPageeState extends State<ChatPagee> {
  final textController = TextEditingController();
  late CollectionReference chat;
  late QuerySnapshot chatData;
  List<QueryDocumentSnapshot>? listChat;
  getDataFromFirebase() async {
    chatData = await FirebaseFirestore.instance
        .collection("room")
        .doc("kimia")
        .collection("chat")
        .get();
    listChat = chatData.docs;
    setState(() {});
    // print(chatData.docs);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataFromFirebase();
  }

  @override
  Widget build(BuildContext context) {
    chat = FirebaseFirestore.instance
        .collection("room")
        .doc("kimia")
        .collection("chat");

    return Scaffold(
      appBar: AppBar(
        title: Text("Diskusi Soal"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: listChat == null
                  ? CircularProgressIndicator()
                  : ListView.builder(
                      itemCount: listChat!.length,
                      itemBuilder: (BuildContext context, int index) {
                        final currentChat = listChat![index];
                        return Container(
                          margin: EdgeInsets.only(bottom: 5),
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                currentChat["nama"],
                                style: TextStyle(
                                  fontSize: 11,
                                  color: R.colors.greySubtitleHome,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Color(0xFFAF8EF7),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                ),
                                child: Text(
                                  currentChat["content"],
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                              ),
                              // ),
                              Text(
                                "Waktu Kirim",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Color(0xff979797),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ),
          SafeArea(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, -1),
                      blurRadius: 10,
                      color: Colors.black.withOpacity(0.25))
                ],
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.add,
                      color: Colors.blue,
                    ),
                    onPressed: () {},
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 40,
                              child: TextField(
                                controller: textController,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.camera_alt,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  contentPadding: EdgeInsets.zero,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  hintText: "Ketuk untuk menulis . . .",
                                  hintStyle: TextStyle(
                                    color: Color(0xff979797),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if (textController.text.isEmpty) {
                        return;
                      }
                      print(textController.text);
                      final user = FirebaseAuth.instance.currentUser!;
                      final chatContant = {
                        "nama": user.displayName,
                        "uid": user.uid,
                        "content": textController.text,
                        "email": user.email,
                        "photo": user.photoURL,
                        "time": FieldValue.serverTimestamp()
                      };
                      chat.add(chatContant).whenComplete(() {
                        getDataFromFirebase();
                      });
                    },
                    icon: Icon(
                      Icons.send,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
