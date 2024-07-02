import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../data/model/message_model.dart';
import 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  File? image;

  Future<void> pickImage({required bool isCamera}) async {
    final pickedFile = await ImagePicker().pickImage(
        source: (isCamera) ? ImageSource.camera : ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      messages.add(
        Message(
          userName: "userName",
          time: DateTime.now(),
          sender: true,
          img: image,
        ),
      );
      emit(PickImageState());
    }
  }

  void scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    });
  }

  TextEditingController chatTextController = TextEditingController();
  ScrollController scrollController = ScrollController();
  List<Message> messages = [
    Message(
      userName: "userName",
      messageContent: "HI",
      time: DateTime.now(),
      sender: true,
    ),
    Message(
      userName: "userName",
      messageContent: "HI",
      time: DateTime.now(),
      sender: false,
    ),
    Message(
      userName: "userName",
      messageContent: "How are You?",
      time: DateTime.now(),
      sender: false,
    ),
  ];

  void onSendMessage() {
    messages.add(
      Message(
        userName: "userName",
        messageContent: chatTextController.text,
        time: DateTime.now(),
        sender: true,
      ),
    );
    chatTextController.clear();
    scrollToBottom();
    emit(ChatSetState());
  }
}
