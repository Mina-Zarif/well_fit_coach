import 'package:flutter/material.dart';

import 'clients_list_item_view.dart';

class ClientsListView extends StatelessWidget {
  const ClientsListView({
    super.key,
    required this.onTap,
    required this.profileOnTap,
  });

  final Function() onTap, profileOnTap;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: ListClientItemView(
          onTap: onTap,
          profileOnTap: profileOnTap,
        ),
      ),
      itemCount: 10,
    );
  }
}
