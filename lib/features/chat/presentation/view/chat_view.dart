import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:well_fit_coach/features/chat/presentation/mange/chat_cubit.dart';
import 'package:well_fit_coach/features/chat/presentation/mange/chat_state.dart';
import 'package:well_fit_coach/features/chat/presentation/view/widgets/chat_body.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit(),
      child: BlocBuilder<ChatCubit, ChatState>(
        builder: (context, state) {
          BlocProvider.of<ChatCubit>(context).scrollToBottom();
          return Scaffold(
            body: Padding(
              padding: const EdgeInsetsDirectional.only(
                start: 24,
                end: 24,
                top: 24,
                bottom: 14,
              ),
              child: SafeArea(
                child: ChatBody(
                  cubit: BlocProvider.of<ChatCubit>(context),
                  state: state,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
