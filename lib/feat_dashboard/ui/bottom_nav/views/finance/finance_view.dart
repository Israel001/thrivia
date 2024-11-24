import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:thrivia_app/common/app_colors.dart';
import 'package:thrivia_app/common/constants.dart';
import 'package:thrivia_app/common/ui_helpers.dart';
import 'package:thrivia_app/feat_dashboard/ui/bottom_nav/components/transaction_list.dart';
import 'package:thrivia_app/feat_dashboard/ui/bottom_nav/views/home/home_view.dart';
import 'package:thrivia_app/ui/widgets/custom_button.dart';
import 'package:thrivia_app/ui/widgets/primary_button.dart';
import 'package:thrivia_app/ui/widgets/svg_picture_colored.dart';

import 'finance_viewmodel.dart';

class FinanceView extends StackedView<FinanceViewModel> {
  const FinanceView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    FinanceViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(
          "Finances",
        ),
        centerTitle: true,
      ),
      body: FinanceBody(
        viewModel: viewModel,
      ),
    );
  }

  @override
  FinanceViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      FinanceViewModel();
}

class FinanceBody extends StatefulWidget {
  const FinanceBody({
    super.key,
    required this.viewModel,
  });

  final FinanceViewModel viewModel;

  @override
  State<FinanceBody> createState() => _FinanceBodyState();
}

class _FinanceBodyState extends State<FinanceBody>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  late final TabController tabController;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        // 28.verticalSpace,
        TabBar(
          controller: tabController,
          indicatorSize: TabBarIndicatorSize.label,

          dividerColor: Colors.transparent,
          labelStyle: TextStyle(
            color: theme.colorScheme.onPrimary,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),

          indicator: UnderlineTabIndicator(
              insets: EdgeInsets.symmetric(horizontal: -20),
              borderSide: BorderSide(
                color: Color(0xFF27816C),
                width: 4,
              ),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(100),
                  topRight: Radius.circular(100))),

          //     ),
          indicatorWeight: 4,
          tabs: [
            Tab(
              text: "Loans",
            ),
            Tab(
              text: "Savings",
            )
          ],
        ),
        8.verticalSpace,

        Expanded(
          child: TabBarView(
            controller: tabController,
            // onPageChanged: viewModel.pageChanged,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: LoanBody(
                  viewModel: widget.viewModel,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: SavingsBody(
                    viewModel: widget.viewModel,
                  ))
              //contribution page

              // ContributionPage(
              //   viewModel: viewModel,
              // ),

              // // loan page
              // LoanPage(viewModel: viewModel)
            ],
          ),
        ),
      ],
    );
  }
}

class SavingsBody extends StatelessWidget {
  final FinanceViewModel viewModel;

  const SavingsBody({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BalanceCard(
          contributionCard: true,
          child: SavingsCardBody(viewModel: viewModel),
        ),
        25.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PrimaryButton(
              width: 148,
              onPressed: viewModel.contributionCardController.withdrawMoney,
              label: "Withdraw funds",
            ),
            PrimaryButton(
                width: 148,
                onPressed: viewModel.loanCardController.applyForLoan,
                label: "Apply for loan"),
          ],
        ),
        24.verticalSpace,
        Expanded(
          child: TransactionList(
            title: "Contribution history",
            transactions: viewModel.contributionHistory,
            viewAll: () {},
          ),
        ),
      ],
    );
  }
}

class LoanBody extends StatelessWidget {
  final FinanceViewModel viewModel;

  const LoanBody({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BalanceCard(
          contributionCard: false,
          child: LoanCardBody(viewModel: viewModel),
        ),
        25.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PrimaryButton(
              width: 148,
              onPressed: viewModel.loanCardController.repayLoan,
              label: "Repay loan",
            ),
            PrimaryButton(
                width: 148,
                onPressed: viewModel.loanCardController.applyForLoan,
                label: "Apply for loan"),
          ],
        ),
        24.verticalSpace,
        Expanded(
          child: TransactionList(
            title: "Loan history",
            transactions: viewModel.loanHistory,
            viewAll: () {},
          ),
        ),
      ],
    );
  }
}

class LoanCardBody extends StatelessWidget {
  final FinanceViewModel viewModel;
  const LoanCardBody({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Loan balance',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontFamily: 'Onest',
            fontWeight: FontWeight.w400,
          ),
        ),
        8.verticalSpace,
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'N',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: 'Onest',
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.lineThrough,
                      decorationColor: Colors.white,
                      height: 0,
                    ),
                  ),
                  TextSpan(
                    text: viewModel.loanCardController.loanBalanceText,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: 'Onest',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            TextButton(
              onPressed: viewModel.loanCardController.toggleObscureLoanBalance,
              child: SvgPictureColored(
                  assetName: AppImagesSVG.eye_slash,
                  color: Colors.white,
                  width: 20,
                  height: 20),
            )
          ],
        ),
        8.verticalSpace,
        CollapsedTextButton(
          onPressed: () {},
          child: Row(
            children: [
              Text(
                'Transaction history',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Onest',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
              8.horizontalSpace,
              Icon(
                Icons.arrow_forward_ios,
              ),
            ],
          ),
        )
      ],
    );
  }
}

class SavingsCardBody extends StatelessWidget {
  final FinanceViewModel viewModel;
  const SavingsCardBody({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Savings balance',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontFamily: 'Onest',
            fontWeight: FontWeight.w400,
          ),
        ),
        8.verticalSpace,
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'N',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: 'Onest',
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.lineThrough,
                      decorationColor: Colors.white,
                      height: 0,
                    ),
                  ),
                  TextSpan(
                    text: viewModel
                        .contributionCardController.contributionBalanceText,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: 'Onest',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            TextButton(
              onPressed: viewModel
                  .contributionCardController.toggleObscureContributionBalance,
              child: SvgPictureColored(
                  assetName: AppImagesSVG.eye_slash,
                  color: Colors.white,
                  width: 20,
                  height: 20),
            )
          ],
        ),
        8.verticalSpace,
        CollapsedTextButton(
          onPressed: () {},
          child: Row(
            children: [
              Text(
                'Transaction history',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Onest',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
              8.horizontalSpace,
              Icon(
                Icons.arrow_forward_ios,
              ),
            ],
          ),
        )
      ],
    );
  }
}
