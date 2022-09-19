import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meeting_task/config/color.dart';
import 'package:meeting_task/config/font_style.dart';
import 'package:meeting_task/presentation/cubit/get_data/get_data_cubit.dart';
import 'package:meeting_task/presentation/cubit/remove_meeting/remove_meeting_cubit.dart';
import 'package:meeting_task/presentation/screens/mobile/new_task.dart';
import 'package:meeting_task/utils/constant.dart';
import 'package:meeting_task/utils/date_time.dart';
import 'package:meeting_task/utils/di.dart';
import 'package:meeting_task/presentation/widgets/curve_clip_widget.dart';
import 'package:meeting_task/presentation/widgets/custom_square_widget.dart';
import 'package:meeting_task/presentation/widgets/custom_text_title_widget.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // bool isTablet (BuildContext context)=>MediaQuery.of(context).size.width >=600;
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    print(width);
    return BlocProvider(
      create: (context) => di<RemoveMeetingCubit>(),
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.only(top: 20.0),
          child: Stack(
            children: [
              Container(
                color: const Color(0xFF439AE1),
                child: _buildBackgroundWidget(context),
              ),
              ClipPath(
                clipper: CurveClip(),
                child: SizedBox(
                  height: width! >= 600 ? height! * 0.5 : height! * 0.5,
                  width: double.infinity,
                  child: Container(
                    color: Colors.white,
                    child: _buildWidgetInsideOfCurve(context),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildBackgroundWidget(context) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildImage(context),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                  top: width! >= 600 ? 400 : 300,
                  right: width! >= 600 ? 40 : 20.0),
              child: Scrollbar(
                trackVisibility: true,
                thumbVisibility: true,
                interactive: true,
                child: BlocBuilder<GetDataCubit, GetDataState>(
                  builder: (context, state) {
                    return ListView.builder(
                      itemBuilder: (context, int i) => _buildSingleMeeting(i),
                      shrinkWrap: true,
                      itemCount: di<GetDataCubit>().dataRepo.meetingData.length,
                      // physics: NeverScrollableScrollPhysics(),
                    );
                  },
                ),
              ),
            ),
          )
        ],
      );

  _buildImage(context) => Padding(
        padding: EdgeInsets.only(
            right: width! >= 600 ? 100 : 30.0, top: width! >= 600 ? 30 : 20),
        child: Align(
          alignment: Alignment.centerRight,
          child: CircleAvatar(
            radius: width! >= 600 ? 40 : 25.0,
            backgroundColor: Colors.white,
            backgroundImage: const NetworkImage(
                'https://cdn-icons-png.flaticon.com/512/21/21104.png'),
          ),
        ),
      );

  _buildWidgetInsideOfCurve(context) => Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 22.0, 20.0, 22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildDrawerAndNotifyButton(),
            SizedBox(
              height: width! >= 600 ? 70 : 40.0,
            ),
            _buildMeetingTitlePartAndAddButton(context),
            SizedBox(
              height: width! >= 600 ? 30 : 15.0,
            ),
            _buildDateTimeAndTitle(),
            SizedBox(
              height: width! >= 600 ? 30 : 20.0,
            ),
            _buildListOfDate()
          ],
        ),
      );

  _buildDrawerAndNotifyButton() => Padding(
      padding: EdgeInsets.only(top: width! >= 600 ? 30 : 20.0),
      child: Row(
        children: const [
          Icon(Icons.filter_list, size: 40.0),
          SizedBox(width: 20.0),
          Icon(Icons.notifications_none, size: 40.0),
        ],
      ));

  _buildMeetingTitlePartAndAddButton(context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomTextTitleWidget(
            style: width! >= 600
                ? textThemeData.headline2!
                : textThemeData.headline3!,
            title: 'Meetings Dates',
          ),
          Padding(
            padding: EdgeInsets.only(right: width! >= 600 ? 30.0 : 0.0),
            child: CustomSquareWidget(
              isSelect: true,
              isIcon: true,
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NewTaskScreen())),
            ),
          )
        ],
      );

  _buildDateTimeAndTitle() => Row(
        children: [
          CustomTextTitleWidget(
            style: width! >= 600
                ? textThemeData.headline3!
                : textThemeData.headline4!,
            title: 'Today',
          ),
          const Spacer(
            flex: 1,
          ),
          BlocBuilder<GetDataCubit, GetDataState>(
            buildWhen: (previous, state) {
              return di<GetDataCubit>().date != null;
            },
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: CustomTextTitleWidget(
                  style: width! >= 600
                      ? textThemeData.subtitle1!
                      : textThemeData.bodyText1!,
                  title: di<GetDataCubit>().date!,
                ),
              );
            },
          ),
        ],
      );

  _buildListOfDate() => SizedBox(
        height: width! >= 600 ? 80.0 : 55.0,
        width: double.infinity,
        child: GridView.count(
          controller: di<GetDataCubit>().scrollController,
          scrollDirection: Axis.horizontal,
          crossAxisCount: 1,
          childAspectRatio: 1.6 / 1.9,
          children: List.generate(
              di<GetDataCubit>().listDate.length,
              (index) => Container(
                    padding: EdgeInsets.only(
                      left: width! >= 600 ? 25.0 : 10.0,
                    ),
                    child: BlocBuilder<GetDataCubit, GetDataState>(
                      builder: (context, state) {
                        return CustomSquareWidget(
                          txt: DateTimeUtils.weekdays[
                                  di<GetDataCubit>().listDate[index].weekday -
                                      1]
                              .substring(0, 1),
                          num:
                              di<GetDataCubit>().listDate[index].day.toString(),
                          isIcon: false,
                          isSelect: di<GetDataCubit>().listDate[index].day ==
                              di<GetDataCubit>().currentDateTime.day,
                          onTap: () => di<GetDataCubit>().getSelect(index),
                        );
                      },
                    ),
                  )),
        ),
      );
  _buildSingleMeeting(int i) {
    print('i : $i');
    return BlocProvider(
      create: (context) => di<RemoveMeetingCubit>(),
      child: Padding(
        padding: EdgeInsets.all(width! >= 600 ? 20.0 : 10.0),
        child: Dismissible(
          background: Container(
            height: 20,
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(10.0)),
          ),
          key: ValueKey(di<GetDataCubit>().dataRepo.meetingData[i].id),
          onDismissed: (DismissDirection direction) =>
              di<RemoveMeetingCubit>().removeMeeting(i),
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              _buildWidgetsInsideOfSingleMeeting(i),
              _buildMeetingTime(i)
            ],
          ),
        ),
      ),
    );
  }

  _buildWidgetsInsideOfSingleMeeting(int i) => Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 90.0,
              height: 90.0,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://w7.pngwing.com/pngs/355/908/png-transparent-teamwork-meeting-team-business-silhouette-brand.png'),
                ),
              ),
            ),
            const SizedBox(
              width: 15.0,
            ),
            _buildMeetingTitleAndDescription(i),
          ],
        ),
      );

  _buildMeetingTitleAndDescription(int i) => Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<GetDataCubit, GetDataState>(
              builder: (context, state) {
                return Text(
                    di<GetDataCubit>().dataRepo.meetingData[i].data().title,
                    style: width! >= 600
                        ? textThemeData.headline3!
                        : textThemeData.headline5);
              },
            ),
            const SizedBox(
              height: 10.0,
            ),
            BlocBuilder<GetDataCubit, GetDataState>(
              builder: (context, state) {
                return Text(
                    di<GetDataCubit>()
                        .dataRepo
                        .meetingData[i]
                        .data()
                        .description,
                    maxLines: 2,
                    style: width! >= 600
                        ? textThemeData.subtitle1!.copyWith(color: gray)
                        : textThemeData.bodyText1!.copyWith(color: gray));
              },
            )
          ],
        ),
      );

  _buildMeetingTime(int i) => Container(
      margin: const EdgeInsets.only(right: 10),
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
      child: BlocBuilder<GetDataCubit, GetDataState>(
        builder: (context, state) {
          return CustomTextTitleWidget(
            style: width! >= 600
                ? textThemeData.headline6!.copyWith(color: white)
                : textThemeData.subtitle1!.copyWith(color: white),
            title: di<GetDataCubit>().dataRepo.meetingData[i].data().startTime,
          );
        },
      ));
}
