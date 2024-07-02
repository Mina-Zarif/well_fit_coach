import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:well_fit_coach/features/clients/presentation/mange/clients_state.dart';

class ClientsCubit extends Cubit<ClientsState> {
  ClientsCubit() : super(ClientsInitial());

  TextEditingController searchController = TextEditingController();
  int index = 0;
  PageController pageController = PageController();

  void toggleBetweenIndex(int value) {
    index = value;
    pageController.animateToPage(
      (index == 1) ? 0 : value,
      duration: const Duration(milliseconds: 250),
      curve: Curves.linear,
    );

    emit(ToggleState());
  }
}
