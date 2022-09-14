import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meeting_task/config/color.dart';
import 'package:meeting_task/config/font_style.dart';
import 'package:meeting_task/utils/constant.dart';
import 'package:meeting_task/utils/di.dart';
import 'package:meeting_task/presentation/cubit/create_task/create_task_cubit.dart';
import 'package:meeting_task/presentation/widgets/custom_button_widget.dart';
import 'package:meeting_task/presentation/widgets/custom_text_form.dart';
import 'package:meeting_task/presentation/widgets/custom_text_title_widget.dart';

import '../../utils/constant.dart';

class NewTaskScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final width =MediaQuery.of(context).size.width;
    // final orientation =MediaQuery.of(context).size.;

    return Scaffold(
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.filter_list,
              size: 25,
            ),
          )
        ],
      ),
      body: BlocProvider(
  create: (context) => di<CreateTaskCubit>(),
  child: Container(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextTitleWidget(
              title: 'Create New Task',
              style: textThemeData.headline5!,
            ),
            const SizedBox(
              height: 30,
            ),
            CustomTextTitleWidget(
              title: ' Task Name',
              style: textThemeData.subtitle2!,
            ),
            Padding(
                padding: const EdgeInsets.only(right: 30.0),
                child: CustomTextForm(
                  style: textThemeData.subtitle1!.copyWith(color: darkBlack),
                  controller: di<CreateTaskCubit>().titleTaskControl,
                )),
            const SizedBox(
              height: 30.0,
            ),
            _buildCategoryTitlePart(),
            const SizedBox(
              height: 30.0,
            ),
            _buildCategoryButtonTypesPart(),
            const SizedBox(
              height: 30.0,
            ),
            _buildDatePart(context),
            const SizedBox(
              height: 40,
            ),
            _buildTimePart(context),
            const SizedBox(
              height: 30,
            ),
            _buildDescriptionPart(),
            const Spacer(
              flex: 1,
            ),
            _buildButtonCreatePart(),
          ],
        ),
      ),
),
    );
  }

  _buildCategoryTitlePart() => Padding(
        padding: const EdgeInsets.only(right: 30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              ' Select Category',
              style: TextStyle(
                color: Color(0xFF91B4BD),
                fontWeight: FontWeight.w600,
                fontSize: 16.0,
              ),
            ),
            Text(
              'see all',
              style: TextStyle(
                color: Colors.grey,
                // fontWeight: FontWeight.w600,
                fontSize: 14.0,
              ),
            )
          ],
        ),
      );
  _buildCategoryButtonTypesPart() => SizedBox(
        height: 50,
        child: ListView.builder(
          itemCount: categoryList.length,
          itemBuilder: (context, i) => Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: BlocBuilder<CreateTaskCubit, CreateTaskState>(
              builder: (context, state) {
                return CustomButtonWidget(
                  style: ThemeData().textTheme.bodyText1!.copyWith(
                      color: isSelect[i]
                          ? white
                          : smokyMint),
                  isSelect: isSelect[i],
                  onPress: () => di<CreateTaskCubit>().selectCategory(i),
                  txt: categoryList[i],
                );
              },
            ),
          ),
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
        ),
      );
  _buildDatePart(context) => Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextTitleWidget(
                title: ' Date',
                style: textThemeData.subtitle2!,
              ),
              SizedBox(
                  width: 230,
                  height: 30,
                  child: CustomTextForm(
                    controller: di<CreateTaskCubit>().dateControl,
                    style: textThemeData.subtitle1!.copyWith(color: darkBlack),
                  )),
            ],
          ),
          const Spacer(
            flex: 1,
          ),
          GestureDetector(
            onTap: () => di<CreateTaskCubit>().getDatePicker(context),
            child: const Padding(
              padding: EdgeInsets.only(right: 50.0),
              child: CircleAvatar(
                radius: 22,
                backgroundColor: Color(0xff5797B0),
                child: Icon(
                  Icons.date_range,
                  size: 30,
                ),
              ),
            ),
          )
        ],
      );
  _buildEndTimePart(context) => Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextTitleWidget(
              style: textThemeData.subtitle2!,
              title: 'End Time',
            ),
            BlocBuilder<CreateTaskCubit, CreateTaskState>(
                builder: (context, state) {
              return SizedBox(
                width: 140,
                height: 40,
                child: CustomTextForm(
                  onPress: () {
                    print(di<CreateTaskCubit>().endControl.text);
                    di<CreateTaskCubit>().getEndTimePicker(context);
                  },
                  isIcon: true,
                  style: textThemeData.bodyText2!,
                  controller: di<CreateTaskCubit>().endControl,
                ),
              );
            }
                // padding: const EdgeInsets.only(right: 50.0),
                // child: CustomTextForm(
                //   onPress: () =>
                //       CreateTaskCubit().getEndTimePicker(context),
                //   style: textThemeData.bodyText2!,
                //   controller: CreateTaskCubit().endControl,
                //   isIcon: true,
                // ),

                ),
          ],
        ),
      );
  _buildTimePart(context) => Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextTitleWidget(
                title: ' Start Time',
                style: textThemeData.subtitle2!,
              ),
              SizedBox(
                width: 140,
                height: 40,
                child: CustomTextForm(
                  onPress: () {
                    print(di<CreateTaskCubit>().descriptionControl.text);
                    di<CreateTaskCubit>().getStartTimePicker(context);
                  },
                  isIcon: true,
                  style: textThemeData.bodyText2!,
                  controller: di<CreateTaskCubit>().startControl,
                ),
              ),
            ],
          ),
          const Spacer(
            flex: 1,
          ),
          _buildEndTimePart(context)
        ],
      );
  _buildDescriptionPart() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextTitleWidget(
            title: ' Description',
            style: textThemeData.subtitle2!,
          ),
          SizedBox(
            width: 350,
            height: 40,
            child: BlocBuilder<CreateTaskCubit, CreateTaskState>(
              builder: (context, state) {
                return CustomTextForm(
                  style: textThemeData.bodyText2!,
                  controller: di<CreateTaskCubit>().descriptionControl,
                );
              },
            ),
          ),
        ],
      );
  _buildButtonCreatePart() => Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 20.0, 35.0, 20.0),
        child: CustomButtonWidget(
          style: textThemeData.headline6!.copyWith(color: white),
          txt: ' Create Task ',
          onPress: () {
            di<CreateTaskCubit>().setData(
            day: dayName!,
            monthName: monthName!,
            date: di<CreateTaskCubit>().dateFormat!,
            title: di<CreateTaskCubit>().titleTaskControl.text,
            description: di<CreateTaskCubit>().descriptionControl.text,
            // meetingType:di<CreateTaskCubit>().categoryList,
            startTime: di<CreateTaskCubit>().startControl.text,
            endTime: di<CreateTaskCubit>().endControl.text,
          );
          },
          isSelect: true,
        ),
      );
}
