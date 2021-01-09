import 'package:PersonalToolbag/theme/constants.dart';
import 'package:PersonalToolbag/widgets/activity_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HesCodeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _buildBody(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }

  Padding _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("HES Code", style: Theme.of(context).textTheme.headline6),
          SizedBox(height: 20),
          _buildInfoRow(context),
          SizedBox(height: 20),
          Text(
            "Description",
            style: Theme.of(context)
                .textTheme
                .bodyText1
                .copyWith(fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 10),
          Text(
            "Lorem ipsum lorem ipsum, Lorem ipsum lorem ipsum Lorem ipsum lorem ipsum Lorem ipsum lorem ipsum",
          ),
          SizedBox(height: 20),
          _buildRecentActivitiesList(),
        ],
      ),
    );
  }

  Row _buildInfoRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildInfoCard(
          context,
          leading: Image.asset(
            "assets/images/profile-pic.png",
            width: 52,
            height: 52,
          ),
          upperText: "Assigned to",
          lowerText: "Samed Bicer",
        ),
        SizedBox(width: 10),
        _buildInfoCard(
          context,
          leading: Container(
            alignment: Alignment.center,
            width: 52,
            height: 52,
            child: SvgPicture.asset(
              "assets/icons/calendar.svg",
              width: 18,
              height: 18,
              color: AppConstants.dark,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppConstants.gold,
            ),
          ),
          upperText: "Due date",
          lowerText: "Sep 20",
        ),
      ],
    );
  }

  Row _buildInfoCard(BuildContext context,
      {Widget leading, String upperText, String lowerText}) {
    return Row(
      children: [
        leading,
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(upperText),
            Text(
              lowerText,
              style: Theme.of(context).textTheme.bodyText2.copyWith(
                  color: AppConstants.dark, fontWeight: FontWeight.w500),
            ),
          ],
        )
      ],
    );
  }

  Expanded _buildRecentActivitiesList() {
    return Expanded(
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, i) => ActivityCard(
          margin: EdgeInsets.symmetric(vertical: 10),
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
          text: "Y6X5-5521-14",
          date: "3 weeks",
        ),
      ),
    );
  }
}
