import 'package:PersonalToolbag/theme/constants.dart';
import 'package:PersonalToolbag/view_model/home_view_model.dart';
import 'package:PersonalToolbag/widgets/activity_card.dart';
import 'package:PersonalToolbag/widgets/empty_data_text.dart';
import 'package:PersonalToolbag/widgets/theme_switch.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeView extends StatelessWidget {
  HomeViewModel _viewModel = HomeViewModel();
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
          _callRecentActivitiesStream(),
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
            _buildToolbagItemsCard(
              context: context,
              title: "To-Do List",
              desciption: "Organize your tasks",
              bgColor: AppConstants.gold,
              countText: "You have 2 tasks",
              onClick: () {
                Navigator.pushNamed(context, "/to_do");
              },
            ),
            _buildToolbagItemsCard(
              context: context,
              title: "HES Code",
              desciption: "Organize your tasks",
              bgColor: AppConstants.blue,
              countText: "You have 5 codes",
              onClick: () {
                Navigator.pushNamed(context, "/hes_code");
              },
            ),
          ],
        ),
      ),
    );
  }

  Container _buildToolbagItemsCard({
    BuildContext context,
    String title,
    String desciption,
    String countText,
    Color bgColor,
    Function onClick,
  }) {
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
            onTap: onClick,
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

  Widget _callRecentActivitiesStream() {
    return StreamBuilder(
      stream: _viewModel.getRecentActivities(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Text('Waiting');
            break;
          case ConnectionState.active:
          case ConnectionState.done:
            if (snapshot.hasData) {
              return _buildRecentActivitiesList(snapshot.data.docs);
            } else {
              return EmptyDataText(
                context: context,
                text: "There is not any Activities!",
              );
            }
            break;
          default:
            return Text('Active');
        }
      },
    );
  }

  Expanded _buildRecentActivitiesList(
      List<QueryDocumentSnapshot> activitiesList) {
    return Expanded(
      child: ListView.builder(
        itemCount: activitiesList.length,
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
          text: activitiesList[i]['text'].toString(),
          date: "Just Now",
        ),
      ),
    );
  }
}
