import 'package:flutter/material.dart';
import 'package:smoney/core/common/common.export.dart';

class AddTransactionPage extends StatelessWidget {
  const AddTransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.medium(
            flexibleSpace: FlexibleSpaceBar(
              title: Text(context.l10n.addTransaction),
              titlePadding: EdgeInsets.only(left: Dimens.size16),
              centerTitle: false,
            ),
          ),
        ],
      ),
    );
  }
}
