import 'package:flutter/material.dart';

import './worksites_list_page_app_bar.dart';
import './worksites_list_page_body.dart';
import './worksites_list_page_floating_action_button.dart';

class WorksitesListPage extends StatelessWidget {
  const WorksitesListPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: WorksitesListPageAppBar(),
      body: WorksitesListPageBody(),
      backgroundColor: Colors.white,
      floatingActionButton: WorksitesListPageFloatingActionButton(),
    );
  }
}
