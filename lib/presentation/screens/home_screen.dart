import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meeting_task/config/color.dart';
import 'package:meeting_task/config/font_style.dart';
import 'package:meeting_task/presentation/cubit/get_data/get_data_cubit.dart';
import 'package:meeting_task/utils/di.dart';
import 'package:meeting_task/presentation/cubit/create_task/create_task_cubit.dart';
import 'package:meeting_task/presentation/screens/new_task.dart';
import 'package:meeting_task/presentation/widgets/curve_clip_widget.dart';
import 'package:meeting_task/presentation/widgets/custom_square_widget.dart';
import 'package:meeting_task/presentation/widgets/custom_text_title_widget.dart';

class HomeScreen extends StatelessWidget {
  bool isSe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              color: const Color(0xFF439AE1),
              child: backgroundWidget(),
            ),
            ClipPath(
              clipper: CurveClip(),
              child: SizedBox(
                height: 400,
                width: double.infinity,
                child: Container(
                  color: Colors.white,
                  child: _largeDateWidget(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _largeDateWidget(context) => Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 22.0, 20.0, 22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                Icon(Icons.filter_list, size: 35.0),
                SizedBox(width: 10.0),
                Icon(Icons.notifications_none, size: 35.0),
              ],
            ),
            const SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: ()=>di<GetDataCubit>().getData(),
                  child: CustomTextTitleWidget(
                    style: textThemeData.headline4!,
                    title: 'My Task',
                  ),
                ),
                CustomSquareWidget(
                  isSelect: true,
                  isIcon: true,
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NewTaskScreen())),
                )
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                CustomTextTitleWidget(
                  style: textThemeData.headline4!,
                  title: 'Today',
                ),
                const Spacer(
                  flex: 1,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: CustomTextTitleWidget(
                    style: textThemeData.bodyText1!,
                    title: 'Monday ,1 jun',
                  ),
                ),
              ],
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(
                  maxHeight: 100, maxWidth: double.infinity),
              child: GridView.count(
                scrollDirection: Axis.horizontal,
                crossAxisCount: 1,
                children: List.generate(
                    10,
                    (index) => CustomSquareWidget(
                          isIcon: false,
                          isSelect: isSe,
                          // onTap: () {
                          //   isSe = !isSe;
                          //   setState(() {});
                          // },
                        )),
              ),
            )
          ],
        ),
      );

  backgroundWidget() => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _myImage(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 300),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: _rememberMe(),
              ),
            ),
          )
        ],
      );

  _myImage() => const Padding(
        padding: EdgeInsets.only(right: 20.0, top: 20),
        child: Align(
          alignment: Alignment.centerRight,
          child: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.white,
            // backgroundImage: NetworkImage('assets/download.jpg'),
          ),
        ),
      );

  _rememberMe() => ListView.builder(
        itemBuilder: (context, i) => _singleRememberMe(),
        shrinkWrap: true,
        itemCount: 50,
        physics: const NeverScrollableScrollPhysics(),
      );

  _singleRememberMe() => Stack(
        alignment: Alignment.bottomRight,
        children: [
          _rememberDetails(),
          Container(
            margin: EdgeInsets.only(right: 10),
            alignment: Alignment.center,
            height: 40,
            width: 110,
            decoration: const BoxDecoration(
                color: smokyBlack,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      10.0,
                    ),
                    bottomRight: Radius.circular(
                      10.0,
                    ))),
            child: CustomTextTitleWidget(
              style: textThemeData.subtitle1!.copyWith(color: white),
              title: '10:00 AM',
            ),
          ),
        ],
      );
  _rememberDetails() => Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Row(
            children: [
              Container(
                width: 90.0,
                height: 90.0,
                color: Colors.red,
              ),
              SizedBox(
                width: 15.0,
              ),
              _rememberInfo()
            ],
          ),
        ),
      );
  _rememberInfo() => Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Team Meeting',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0)),
            SizedBox(
              height: 10.0,
            ),
            Text(' Team Meeting Team Meeting Team Meeting',
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 16.0)),
          ],
        ),
      );
}
