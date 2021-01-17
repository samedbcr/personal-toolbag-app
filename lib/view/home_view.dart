import 'package:PersonalToolbag/core/providers/theme_provider.dart';
import 'package:PersonalToolbag/theme/constants.dart';
import 'package:PersonalToolbag/widgets/activity_card.dart';
import 'package:PersonalToolbag/widgets/theme_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        actions: [
          ThemeSwitch(),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildSectionTitle(context, "Toolbag Items"),
          buildToolbagItemsList(context),
          SizedBox(height: 20),
          _buildSectionTitle(context, "Recent Activities"),
          _buildRecentActivitiesList(),
        ],
      ),
    );
  }

  Padding _buildSectionTitle(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .bodyText1
            .copyWith(fontWeight: FontWeight.w500),
      ),
    );
  }

  SingleChildScrollView buildToolbagItemsList(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            _buildToolbagItemsCard(context, "To-Do List", "Organize your tasks",
                "You have 2 tasks", AppConstants.gold),
            _buildToolbagItemsCard(context, "HES Code", "Organize your codes",
                "You have 5 codes", AppConstants.blue),
          ],
        ),
      ),
    );
  }

  Container _buildToolbagItemsCard(BuildContext context, String title,
      String desciption, String countText, Color bgColor) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      width: MediaQuery.of(context).size.width * .55,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: bgColor,
          boxShadow: [
            BoxShadow(
              color: bgColor.withOpacity(.45),
              blurRadius: 0,
              spreadRadius: 0,
              offset: Offset(6, 6),
            ),
          ]),
      child: AspectRatio(
        aspectRatio: 4 / 3,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(18),
            onTap: () {
              Navigator.pushNamed(context, "/hes_code");
            },
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: Theme.of(context).textTheme.headline6),
                  Text(
                    desciption,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                  Row(
                    children: [
                      Image.asset(
                        "assets/images/profile-pic.png",
                        width: 32,
                        height: 32,
                      ),
                      SizedBox(width: 10),
                      Text(
                        countText,
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Expanded _buildRecentActivitiesList() {
    return Expanded(
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, i) => ActivityCard(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          bgColor: i % 3 == 0
              ? AppConstants.green
              : i % 3 == 1
                  ? AppConstants.purple
                  : AppConstants.somon,
          icon: SvgPicture.asset(
            "assets/icons/checked.svg",
            height: 27,
            width: 27,
          ),
          text: "New Task Added",
          date: "Yesterday",
        ),
      ),
    );
  }
}
