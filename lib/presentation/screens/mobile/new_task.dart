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

import '../../../utils/constant.dart';

class NewTaskScreen extends StatelessWidget {
  const NewTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.all(width! >= 600 ? 20.0 : 8.0),
            child: Icon(
              Icons.filter_list,
              size: width! >= 600 ? 50 : 25,
              color: gray,
            ),
          )
        ],
      ),
      body: BlocProvider(
        create: (context) => di<CreateTaskCubit>(),
        child: Container(
          padding: EdgeInsets.only(left: width!>=600 ?30: 20, top: width!>=600 ?50: 30.0),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomTextTitleWidget(
                title: 'Create New Task',
                style: width! >= 600
                    ? textThemeData.headline3!
                    : textThemeData.headline5!,
              ),
               SizedBox(
                height: width!>=600 ?50: 30,
              ),
              CustomTextTitleWidget(
                title: ' Task Name',
                style: width! >= 600
                    ? textThemeData.headline5!.copyWith(color: lightMint)
                    : textThemeData.subtitle2!,
              ),
              Padding(
                  padding: EdgeInsets.only(right: width! >= 600 ? 60.0 : 30.0),
                  child: CustomTextForm(
                    style: width! >= 600
                        ? textThemeData.headline5!.copyWith(color: lightMint)
                        : textThemeData.subtitle1!.copyWith(color: darkBlack),
                    controller: di<CreateTaskCubit>().titleTaskControl,
                  )),
               SizedBox(
                height: width!>=600 ?40: 30.0,
              ),
              _buildCategoryTitlePart(),
               SizedBox(
                height: width!>=600 ?40:  30.0,
              ),
              _buildCategoryButtonTypesPart(),
               SizedBox(
                height: width!>=600 ?50:  30.0,
              ),
              _buildTimeDatePart(context),
              const  SizedBox(
                height: 40,
              ),
              _buildTimePart(context),
               SizedBox(
                height:  width!>=600 ?40:30,
              ),
              _buildDescriptionPart(),
              const Spacer(
                flex: 1,
              ),
              _buildButtonCreatePart(context),
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
          children: [
            Text(
              ' Select Category',
              style: width! >= 600
                  ? textThemeData.headline5!.copyWith(color: lightMint)
                  : textThemeData.subtitle2,
            ),
            Text('see all',
                style: width! >= 600
                    ? textThemeData.subtitle1!.copyWith(color: gray)
                    : textThemeData.bodyText1!.copyWith(color: gray))
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
                  style: width! >= 600
                      ? textThemeData.subtitle1!
                          .copyWith(color: isSelect[i] ? white : smokyMint)
                      : textThemeData.bodyText1!
                          .copyWith(color: isSelect[i] ? white : smokyMint),
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
  _buildTimeDatePart(context) => Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextTitleWidget(
                title: ' Date',
                style: width! >= 600
                    ? textThemeData.headline5!.copyWith(color: lightMint)
                    : textThemeData.subtitle2!,
              ),
              SizedBox(
                  width:  width!>=600 ?250:230,
                  height: width!>=600 ?50: 30,
                  child: CustomTextForm(
                    controller: di<CreateTaskCubit>().dateControl,
                    style:  width!>=600 ?textThemeData.headline6!:textThemeData.subtitle1!.copyWith(color: darkBlack),
                  )),
            ],
          ),
          const Spacer(
            flex: 1,
          ),
          GestureDetector(
            onTap: () => di<CreateTaskCubit>().getDatePicker(context),
            child:  Padding(
              padding: EdgeInsets.only(right: 50.0),
              child: CircleAvatar(
                radius:  width!>=600 ?30: 22,
                backgroundColor: Color(0xff5797B0),
                child: Icon(
                  Icons.date_range,
                  size:   width!>=600 ?40:30,
                ),
              ),
            ),
          )
        ],
      );
  _buildEndTimePart(context) => Padding(
        padding:  EdgeInsets.only(right:  width!>=600 ?30:20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextTitleWidget(
              style: width! >= 600
                  ? textThemeData.headline5!.copyWith(color: lightMint)
                  : textThemeData.subtitle2!,
              title: 'End Time',
            ),
            BlocBuilder<CreateTaskCubit, CreateTaskState>(
                builder: (context, state) {
              return SizedBox(
                width: width!>=600 ?180: 140,
                height:  width!>=600 ?60:40,
                child: CustomTextForm(
                  onPress: () {
                    di<CreateTaskCubit>().getEndTimePicker(context);
                  },
                  isIcon: true,
                  style: width! >= 600
                      ? textThemeData.headline6!
                      : textThemeData.bodyText2!,
                  controller: di<CreateTaskCubit>().endControl,
                ),
              );
            }),
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
                style: width! >= 600
                    ? textThemeData.headline5!.copyWith(color: lightMint)
                    : textThemeData.subtitle2!,
              ),
              SizedBox(
                width: width!>=600 ?180:140,
                height: width!>=600 ?60: 40,
                child: CustomTextForm(
                  onPress: () =>
                      di<CreateTaskCubit>().getStartTimePicker(context),
                  isIcon: true,
                  style:width!>=600 ? textThemeData.headline6!: textThemeData.bodyText2!,
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
            style: width! >= 600
                ? textThemeData.headline5!.copyWith(color: lightMint)
                : textThemeData.subtitle2!,
          ),
          SizedBox(
            width: 350,
            height: 40,
            child: BlocBuilder<CreateTaskCubit, CreateTaskState>(
              builder: (context, state) {
                return CustomTextForm(
                  style: width! >= 600
                      ? textThemeData.headline6!
                      : textThemeData.subtitle1!,
                  controller: di<CreateTaskCubit>().descriptionControl,
                );
              },
            ),
          ),
        ],
      );
  _buildButtonCreatePart(context) => Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 20.0, 35.0, 20.0),
        child: CustomButtonWidget(
          style:  width!>=600 ?  textThemeData.headline3!.copyWith(color: white):textThemeData.headline6!.copyWith(color: white),
          txt: ' Create Task ',
          onPress: () {
            int i = 0;

            di<CreateTaskCubit>().setData(
              i:i,
              meetingType: di<CreateTaskCubit>().states ==true?di<CreateTaskCubit>().categoryType!:null!,
                day: dayName!,
                monthName: monthName!,
                date: di<CreateTaskCubit>().dateFormat!,
                title: di<CreateTaskCubit>().titleTaskControl.text,
                description: di<CreateTaskCubit>().descriptionControl.text,
                // meetingType:di<CreateTaskCubit>().categoryList,
                startTime: di<CreateTaskCubit>().startControl.text,
                endTime: di<CreateTaskCubit>().endControl.text,
                context: context);
            i++;
          },
          isSelect: true,
        ),
      );
}
