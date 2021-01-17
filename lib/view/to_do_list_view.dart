import 'package:PersonalToolbag/theme/constants.dart';
import 'package:PersonalToolbag/view_model/to_do_list_view_model.dart';
import 'package:PersonalToolbag/widgets/custom_input_dialog.dart';
import 'package:PersonalToolbag/widgets/todo_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TodoListView extends StatelessWidget {
  final TodoListViewModel _viewModel = TodoListViewModel();
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
          Text("To-Do List", style: Theme.of(context).textTheme.headline6),
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
            "- You can store your todos here\n" +
                "- In order to add todo, click the button below\n" +
                "- Check to complete your task",
          ),
          SizedBox(height: 20),
          _callTodoStream(),
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

  Widget _callTodoStream() {
    return StreamBuilder(
      stream: _viewModel.getTodoList(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Text('Waiting');
            break;
          case ConnectionState.active:
          case ConnectionState.done:
            if (snapshot.hasData) {
              return _buildTodoItemsList(snapshot.data.docs);
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

  Expanded _buildTodoItemsList(List<QueryDocumentSnapshot> todoList) {
    return Expanded(
      child: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, i) => TodoCard(
          margin: EdgeInsets.symmetric(vertical: 10),
          bgColor: i % 3 == 0
              ? AppConstants.green
              : i % 3 == 1
                  ? AppConstants.purple
                  : AppConstants.somon,
          text: todoList[i]['text'].toString(),
          isChecked: todoList[i]['isCompleted'],
          onChange: (value) {
            _viewModel.updateTodo(todoList[i].reference, value);
          },
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
          text: 'Enter your task below!',
        );
      },
    );
    return data != '' ? _viewModel.addTodo(data) : null;
  }
}
