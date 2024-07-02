import 'package:flutter/material.dart';

import '../../mange/chat_cubit.dart';
import '../../mange/chat_state.dart';

class ChatBodyView extends StatelessWidget {
  const ChatBodyView({super.key, required this.cubit, required this.state});

  final ChatCubit cubit;
  final ChatState state;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: cubit.scrollController,
      itemCount: cubit.messages.length,
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      physics: const AlwaysScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        if (cubit.messages[index].messageContent != null) {
          return Container(
            padding:
                const EdgeInsets.only(left: 14, right: 14, top: 0, bottom: 10),
            child: Align(
              alignment: (cubit.messages[index].sender == false
                  ? Alignment.topLeft
                  : Alignment.topRight),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.only(
                      bottomStart: Radius.circular(
                        (cubit.messages[index].sender == false ? 10 : 20),
                      ),
                      bottomEnd: Radius.circular(
                          cubit.messages[index].sender == false ? 20 : 10),
                      topEnd: const Radius.circular(20),
                      topStart: const Radius.circular(20)),
                  color: (cubit.messages[index].sender == false
                      ? Colors.grey.shade200
                      : const Color(0xffFEE7E0)),
                ),
                padding: const EdgeInsets.all(16),
                child: Text(
                  cubit.messages[index].messageContent!,
                  style: const TextStyle(fontSize: 15),
                ),
              ),
            ),
          );
        }
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.file(
            cubit.messages[index].img!,
            height: 200,
            alignment: (cubit.messages[index].sender)
                ? Alignment.centerRight
                : Alignment.centerLeft,
          ),
        );
      },
    );
  }
}
