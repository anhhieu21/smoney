import 'package:flutter/material.dart';

import 'package:smoney/core/common/common.export.dart';

class WrapMenuItem<T> extends StatelessWidget {
  final T item;
  final VoidCallback onTap;
  final Widget Function(T) leading;
  final String Function(T, BuildContext) title;
  final String Function(T, BuildContext)? subTitle;
  const WrapMenuItem({
    super.key,
    required this.item,
    required this.onTap,
    required this.leading,
    required this.title,
    this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimens.size8),
        side: BorderSide(
          color: context.colorScheme.primary.withValues(alpha: 0.8),
          width: 2,
        ),
      ),
      leading: leading(item),
      horizontalTitleGap: Dimens.size4,
      contentPadding: EdgeInsets.symmetric(
        horizontal: Dimens.size8,
      ),
      title: Text(title(item, context)),
      titleTextStyle:
          context.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600),
      subtitle: subTitle == null ? null : Text(subTitle!(item, context)),
      subtitleTextStyle: context.textTheme.bodySmall,
    );
  }
}
