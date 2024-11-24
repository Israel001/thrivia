// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:thrivia_app/common/ui_helpers.dart';
import 'package:thrivia_app/feat_dashboard/ui/bottom_nav/views/home/home_view.dart';
import 'package:thrivia_app/feat_dashboard/ui/bottom_nav/views/home/home_viewmodel.dart';
import 'package:thrivia_app/ui/widgets/item_card.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({
    super.key,
    required this.title,
    this.viewAll,
    required this.transactions,
  });

  final List<TransactionModel> transactions;
  final String title;
  final VoidCallback? viewAll;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: 18,
                fontFamily: 'Onest',
                fontWeight: FontWeight.w500,
              ),
            ),
            if (viewAll != null)
              Text(
                'View all',
                style: TextStyle(
                  color: Color(0xFF03B98F),
                  fontSize: 16,
                  fontFamily: 'Onest',
                  fontWeight: FontWeight.w500,
                ),
              ),
          ],
        ),
        8.verticalSpace,
        Divider(
          color: Color(0xFF939090),
        ),
        16.verticalSpace,
        Expanded(
            child: ListView.separated(
          padding: EdgeInsets.only(bottom: 16),
          itemCount: transactions.length,
          itemBuilder: (context, index) => ItemCard(
              child: RecentTransactionBody(
            transactionModel: transactions[index],
          )),
          separatorBuilder: (context, index) => 16.verticalSpace,
        )),
      ],
    );
  }
}
