import 'package:PersonalToolbag/theme/constants.dart';
import 'package:PersonalToolbag/view_model/hes_code_view_model.dart';
import 'package:PersonalToolbag/widgets/activity_card.dart';
import 'package:PersonalToolbag/widgets/custom_input_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HesCodeView extends StatelessWidget {
  final HesCodeViewModel _viewModel = HesCodeViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _buildBody(context),
      floatingActionButton: _buildFloatingActionButton(context),
    );
  }

  FloatingActionButton _buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        _showDialog(context);
      },
      backgroundColor: AppConstants.green,
      child: Icon(Icons.add),
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
          _callHesCodeStream(),
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

  Widget _callHesCodeStream() {
    return StreamBuilder(
      stream: _viewModel.getHesCodes(),
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
              return Text("no data");
            }
            break;
          default:
            return Text('Active');
        }
      },
    );
  }

  Expanded _buildRecentActivitiesList(List hesCodeList) {
    return Expanded(
      child: ListView.builder(
        itemCount: hesCodeList.length,
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
          text: hesCodeList[i]['code'].toString(),
          date: "3 weeks",
        ),
      ),
    );
  }

  Future _showDialog(BuildContext context) async {
    var data = await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return CustomInputDialog(
          text: 'Enter your HES Code below:',
        );
      },
    );
    return data;
  }
}
