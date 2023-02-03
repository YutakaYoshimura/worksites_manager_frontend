import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../models/worksites_model.dart';

class WorksitesListPageFloatingActionButton extends StatelessWidget implements PreferredSizeWidget {
  const WorksitesListPageFloatingActionButton({
    super.key,
  });

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        WorksitesModel worksites = WorksitesModel();
        context.go("/worksites_add", extra: worksites);
      },
      child: const Icon(Icons.add),
    );
  }
}
