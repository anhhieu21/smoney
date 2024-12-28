import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:smoney/core/common/common.export.dart';

import 'wrap_menu_item.dart';

enum TopMenuEnum { setting, allSummary }

extension TopMenuEnumExtension on TopMenuEnum {
  IconData get icon {
    switch (this) {
      case TopMenuEnum.setting:
        return MingCute.settings_2_line;
      case TopMenuEnum.allSummary:
        return MingCute.document_2_line;
    }
  }

  String getTitle(BuildContext context) {
    switch (this) {
      case TopMenuEnum.setting:
        return context.l10n.setting;
      case TopMenuEnum.allSummary:
        return context.l10n.allSummary;
    }
  }

  String getSubtitle(BuildContext context) {
    switch (this) {
      case TopMenuEnum.setting:
        return '${context.l10n.theme}, ${context.l10n.language}, ${context.l10n.importExportCSV}';
      case TopMenuEnum.allSummary:
        return context.l10n.statisticsDetail;
    }
  }
}

class TopMenu extends StatelessWidget {
  const TopMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: Dimens.size8),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final item = TopMenuEnum.values[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: Dimens.size8),
              child: WrapMenuItem<TopMenuEnum>(
                onTap: () {},
                item: item,
                leading: (item) => Icon(item.icon),
                title: (item, context) => item.getTitle(context),
                subTitle: (item, context) => item.getSubtitle(context),
              ),
            );
          },
          childCount: TopMenuEnum.values.length,
        ),
      ),
    );
  }
}
