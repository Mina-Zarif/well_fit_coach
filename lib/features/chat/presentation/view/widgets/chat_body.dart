import 'package:flutter/material.dart';
import 'package:well_fit_coach/core/utils/app_router.dart';
import 'package:well_fit_coach/features/chat/presentation/mange/chat_cubit.dart';
import 'package:well_fit_coach/features/chat/presentation/mange/chat_state.dart';
import 'package:well_fit_coach/features/chat/presentation/view/widgets/custom_chat_appbar.dart';
import 'package:well_fit_coach/features/chat/presentation/view/widgets/custom_send_bar.dart';

import 'chat_body_view.dart';

class ChatBody extends StatelessWidget {
  const ChatBody({super.key, required this.cubit, required this.state});

  final ChatCubit cubit;
  final ChatState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomChatAppbar(
          onTapBack: () {
            cubit.chatTextController.clear();
            AppRouter.router.pop();
          },
        ),
        Expanded(
          child: ChatBodyView(
            cubit: cubit,
            state: state,
          ),
        ),
        CustomSendBar(
          textEditingController: cubit.chatTextController,
          onPressed: () {
            if (cubit.chatTextController.text.isNotEmpty) {
              cubit.onSendMessage();
            }
          },
          onPickImgTap: () => cubit.pickImage(isCamera: false),
        ),
      ],
    );
  }
}
