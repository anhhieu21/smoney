import 'package:flutter/material.dart';
import 'package:smoney/core/common/common.export.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colorScheme.surface,
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar.medium(
            flexibleSpace: FlexibleSpaceBar(
              title: Text(context.l10n.home),
              titlePadding: EdgeInsets.only(left: Dimens.size16),
              centerTitle: false,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ListTile(
                  title: Text('Item $index'),
                );
              },
              childCount: 100,
            ),
          ),
        ],
      ),
    );
  }
}
