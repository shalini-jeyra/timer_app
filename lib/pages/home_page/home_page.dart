import 'package:flutter/material.dart';
import 'package:timer_app/pages/create_activity_page/create_activity_page.dart';
import 'package:timer_app/pages/home_page/home_page_components/home_page_components.dart';

import 'package:timer_app/styles/styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.ternary,
        title: Text(
          'Task Timer',
          style: HeaderFonts.primaryHeader,
        ),
      ),
      body: const SafeArea(
        child: ListActivity()
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.ternary,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const CreateActivityPage(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
