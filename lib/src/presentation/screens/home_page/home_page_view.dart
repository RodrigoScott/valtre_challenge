import 'package:flutter/material.dart';
import 'package:valtre_challege/src/presentation/screens/home_page/widgets/widgets.dart';

import '../../../data/utils/constants.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0.0),
        child: AppBar(backgroundColor: primaryColor),
      ),
      body: Column(
        children: [CustomHeader(), Expanded(child: HomeBodyWidget())],
      ),
    );
  }
}
