import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:smoney/core/common/common.export.dart';
import 'package:smoney/features/more/view/widgets/wrap_menu_item.dart';

enum MidMenuEnum {
  about,
  feedback,
  notification,
  calender,
  activityLog,
  scheduled,
  goals,
  loans
}

extension MidMenuEnumExtension on MidMenuEnum {
  IconData get icon {
    switch (this) {
      case MidMenuEnum.about:
        return MingCute.information_line;
      case MidMenuEnum.feedback:
        return MingCute.chat_4_line;
      case MidMenuEnum.notification:
        return MingCute.notification_line;
      case MidMenuEnum.calender:
        return MingCute.calendar_2_line;
      case MidMenuEnum.activityLog:
        return MingCute.list_check_2_line;
      case MidMenuEnum.scheduled:
        return MingCute.schedule_line;
      case MidMenuEnum.goals:
        return MingCute.pig_money_line;
      case MidMenuEnum.loans:
        return MingCute.flag_2_line;
    }
  }

  String getTitle(BuildContext context) {
    switch (this) {
      case MidMenuEnum.about:
        return context.l10n.about;
      case MidMenuEnum.feedback:
        return context.l10n.feedback;
      case MidMenuEnum.notification:
        return context.l10n.notification;
      case MidMenuEnum.calender:
        return context.l10n.calendar;
      case MidMenuEnum.activityLog:
        return context.l10n.activityLog;
      case MidMenuEnum.scheduled:
        return context.l10n.scheduled;
      case MidMenuEnum.goals:
        return context.l10n.goals;
      case MidMenuEnum.loans:
        return context.l10n.loans;
    }
  }
}

class MidMenu extends StatelessWidget {
  const MidMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: Dimens.size8),
      sliver: SliverGrid.builder(
          itemCount: MidMenuEnum.values.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: Dimens.size8,
            mainAxisSpacing: Dimens.size8,
            childAspectRatio: 4 / 1.2,
          ),
          itemBuilder: (ctx, index) {
            final item = MidMenuEnum.values[index];
            return WrapMenuItem<MidMenuEnum>(
              onTap: () {},
              item: item,
              leading:Icon(item.icon),
              title:  item.getTitle(context),
            );
          }),
    );
  }
}
