import 'package:PersonalToolbag/theme/constants.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        actions: [Icon(Icons.notifications_none)],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildSectionTitle(context, "Toolbag Items"),
          buildToolbagItemsList(context),
          _buildSectionTitle(context, "Recent Activities"),
          _buildRecentActivitiesList(),
        ],
      ),
    );
  }

  Padding _buildSectionTitle(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }

  SingleChildScrollView buildToolbagItemsList(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
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
              Text(
                countText,
                style: Theme.of(context).textTheme.caption,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded _buildRecentActivitiesList() {
    return Expanded(
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, i) => _buildRecentActivitiesCard(
          i % 3 == 0
              ? AppConstants.green
              : i % 3 == 1
                  ? AppConstants.purple
                  : AppConstants.somon,
          "New Task Added",
          "New Task Added",
        ),
      ),
    );
  }

  Container _buildRecentActivitiesCard(
      Color bgColor, String text, String date) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 18),
      decoration: BoxDecoration(
        color: bgColor.withOpacity(.30),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(Icons.check),
          SizedBox(width: 10),
          Text(text),
          Spacer(),
          Text(date),
        ],
      ),
    );
  }
}
