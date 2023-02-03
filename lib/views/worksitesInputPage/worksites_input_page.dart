import 'package:flutter/material.dart';

import './worksites_input_page_app_bar.dart';
import './worksites_input_page_body.dart';

class WorksitesInputPage extends StatelessWidget {
  const WorksitesInputPage({
    super.key,
    required this.id,
  });
  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WorksitesInputPageAppBar(id: id),
      body: WorksitesInputPageBody(id: id),
      backgroundColor: Colors.white,
    );
  }
}
