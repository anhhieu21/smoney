import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smoney/core/common/common.export.dart';
import 'package:smoney/features/more/view/widgets/header_widget.dart';
import 'package:smoney/features/more/view/widgets/mid_menu.dart';
import 'package:smoney/features/more/view/widgets/top_menu.dart';

import 'widgets/bot_menu.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar.medium(
          flexibleSpace: FlexibleSpaceBar(
            title: Text(context.l10n.more),
            titlePadding: EdgeInsets.only(left: Dimens.size8),
            centerTitle: false,
          ),
        ),
        SliverGap(Dimens.size8),
        HeaderWidget(),
        TopMenu(),
        MidMenu(),
        BotMenu(),
      ],
    );
  }
}
