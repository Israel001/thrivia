// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';

import 'package:thrivia_app/common/app_colors.dart';
import 'package:thrivia_app/common/app_theme.dart';
import 'package:thrivia_app/common/constants.dart';
import 'package:thrivia_app/common/ui_helpers.dart';
import 'package:thrivia_app/ui/widgets/primary_button.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      key: viewModel.scaffoldKey,
      backgroundColor: Theme.of(context).colorScheme.surface,
      drawer: CoopertivesDrawer(viewModel: viewModel),
      body: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              top: 261,
              child: DotsIndicator(
                dotsCount: 2,
                position: viewModel.currentPage,
                decorator: DotsDecorator(
                    activeSize: Size(44, 3),
                    activeColor: Theme.of(context).colorScheme.onPrimary,
                    size: Size(20, 3),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3)),
                    activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3))),
              )),
          Column(
            children: [
              20.verticalSpace,
              Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                child: TopBar(
                  viewModel: viewModel,
                ),
              ),
              20.verticalSpace,
              Expanded(
                child: PageView(
                  onPageChanged: viewModel.pageChanged,
                  children: [
                    //contribution page
                    ContributionPage(
                      viewModel: viewModel,
                    ),

                    // loan page
                    LoanPage(viewModel: viewModel)
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}

class CoopertivesDrawer extends StatelessWidget {
  final HomeViewModel viewModel;
  const CoopertivesDrawer({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 240,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            23.verticalSpace,
            Text(
              'Cooperative Societies',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Onest',
                fontWeight: FontWeight.w500,
              ),
            ),

            15.verticalSpace,

            Divider(
              color: Color(0xFFDADADA),
            ),

            ...List.generate(
              4,
              (index) => CooperativeCard(
                  cooperativeLink: "cooperativeLink",
                  cooperativeName: "cooperativeName",
                  cooperativeImageUrl: "cooperativeImageUrl"),
            ),
            // ElevatedButton(
            //   // onPressed: _closeEndDrawer,
            //   child: const Text('Close Drawer'),
            // ),

            23.verticalSpace,

            PrimaryButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add),
                  12.horizontalSpace,
                  Text(
                    'Add another cooperative',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Onest',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContributionPage extends StatelessWidget {
  final HomeViewModel viewModel;
  const ContributionPage({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      child: Column(
        children: [
          BalanceCard(
            viewModel: viewModel,
            contributionCard: true,
          ),
          38.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Recent transactions',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 18,
                  fontFamily: 'Onest',
                  fontWeight: FontWeight.w500,
                ),
              ),
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
          HorizontalLine(),
          16.verticalSpace,
          Expanded(
              child: ListView.separated(
            padding: EdgeInsets.only(bottom: 16),
            itemCount: viewModel.recentAccoutTransactions.length,
            itemBuilder: (context, index) => ListCard(
                child: RecentTransactionBody(
              transactionModel: viewModel.recentAccoutTransactions[index],
            )),
            separatorBuilder: (context, index) => 16.verticalSpace,
          ))
        ],
      ),
    );
  }
}

class LoanPage extends StatelessWidget {
  final HomeViewModel viewModel;
  const LoanPage({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      child: Column(
        children: [
          BalanceCard(
            viewModel: viewModel,
            contributionCard: false,
          ),
          38.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Loan transactions',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 18,
                  fontFamily: 'Onest',
                  fontWeight: FontWeight.w500,
                ),
              ),
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
          HorizontalLine(),
          16.verticalSpace,
          Expanded(
              child: ListView.separated(
            padding: EdgeInsets.only(bottom: 16),
            itemCount: viewModel.recentAccoutTransactions.length,
            itemBuilder: (context, index) => ListCard(
                child: RecentTransactionBody(
              transactionModel: viewModel.recentAccoutTransactions[index],
            )),
            separatorBuilder: (context, index) => 16.verticalSpace,
          ))
        ],
      ),
    );
  }
}

class HorizontalLine extends StatelessWidget {
  const HorizontalLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1, color: Color(0xFF939090)),
        ),
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  final HomeViewModel viewModel;

  const TopBar({
    Key? key,
    required this.viewModel,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //dp
        Container(
          width: 40,
          height: 40,
          alignment: Alignment.center,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: Color(0xFFDDDDDD),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: InkWell(
            onTap: () {
              viewModel.openEndDrawer();
            },
            child: SvgPicture.asset(
              AppImagesSVG.profile_circle,
              width: 24,
              height: 24,
            ),
          ),
        ),
        16.horizontalSpace,

//text
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome,',
              style: TextStyle(
                // color: Colors.white,
                fontSize: 14,
                fontFamily: 'Onest',
                fontWeight: FontWeight.w300,
              ),
            ),
            2.verticalSpace,
            Text(
              'Hi, ${viewModel.userName}',
              style: TextStyle(
                // color: Colors.white,
                fontSize: 18,
                fontFamily: 'Onest',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
          ],
        ),

        Spacer(),

        //icons
        SvgPicture.asset(
          AppImagesSVG.notification_bing,
          width: 24,
          height: 24,
          colorFilter:
              ColorFilter.mode(theme.colorScheme.onPrimary, BlendMode.srcIn),
        ),
        16.horizontalSpace,
        SvgPicture.asset(
          AppImagesSVG.setting_2,
          width: 24,
          height: 24,
          colorFilter:
              ColorFilter.mode(theme.colorScheme.onPrimary, BlendMode.srcIn),
        )
      ],
    );
  }
}

class BalanceCard extends StatelessWidget {
  final HomeViewModel viewModel;
  final bool contributionCard;
  const BalanceCard({
    Key? key,
    required this.viewModel,
    required this.contributionCard,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // alignment: Alignment.centerLeft,
      height: 165,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.66, -0.75),
          end: Alignment(-0.66, 0.75),
          // colors: [Color(0xFF073B36), Color(0xFF2E9278), Color(0xFF114C46)],
          colors:
              contributionCard ? AppColors.greenLinear : AppColors.goldLinear,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Stack(
        children: [
          SizedBox.expand(),
          Positioned(
            right: 0,
            top: 0,
            child: SvgPicture.asset(AppImagesSVG.group_7),
          ),
          contributionCard
              ? ContributionCardBody(
                  viewModel: viewModel,
                )
              : LoanCardBody(viewModel: viewModel),
        ],
      ),
    );
  }
}

class ContributionCardBody extends StatelessWidget {
  final HomeViewModel viewModel;
  const ContributionCardBody({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your contribution balance',
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
                      text: viewModel.contributionBalanceText,
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
                onPressed: viewModel.toggleObscureContributionBalance,
                child: svgPictureWithColor(
                    assetName: AppImagesSVG.eye_slash,
                    color: Colors.white,
                    width: 20,
                    height: 20),
              )
            ],
          ),
          16.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 148,
                child: PrimaryButton(
                  onPressed: viewModel.addMoney,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(AppImagesSVG.add),
                      8.horizontalSpace,
                      Text(
                        'Add money',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Onest',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (viewModel.showWithdrawButton)
                SizedBox(
                  width: 148,
                  child: PrimaryButton(
                      onPressed: viewModel.withdrawMoney, label: "Withdraw"),
                )
            ],
          ),
        ],
      ),
    );
  }
}

class LoanCardBody extends StatelessWidget {
  final HomeViewModel viewModel;
  const LoanCardBody({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(
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
                      text: viewModel.loanBalanceText,
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
                onPressed: viewModel.toggleObscureLoanBalance,
                child: svgPictureWithColor(
                    assetName: AppImagesSVG.eye_slash,
                    color: Colors.white,
                    width: 20,
                    height: 20),
              )
            ],
          ),
          16.verticalSpace,
          viewModel.showApplyLoan
              ? SizedBox(
                  width: 148,
                  child: PrimaryButton(
                      color: AppColors.gold,
                      onPressed: viewModel.applyForLoan,
                      label: "Apply for loan"),
                )
              : SizedBox(
                  width: 148,
                  child: PrimaryButton(
                    color: AppColors.gold,
                    onPressed: viewModel.repayLoan,
                    label: "Repay loan",
                  ),
                ),
        ],
      ),
    );
  }
}

SvgPicture svgPictureWithColor(
        {required String assetName,
        required Color color,
        double? width,
        double? height}) =>
    SvgPicture.asset(
      assetName,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      width: width,
      height: height,
    );

class ListCard extends StatelessWidget {
  final Widget child;
  const ListCard({
    Key? key,
    required this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        gradient: LinearGradient(
          begin: Alignment(1.00, -0.10),
          end: Alignment(-1, 0.1),
          colors: lightMode(context)
              ? [
                  Color(0xFFF4F4F4),
                  Colors.white.withOpacity(0.5199999988079071)
                ]
              : [
                  Color(0xFFF4F4F4).withOpacity(0.20),
                  Colors.white.withOpacity(0.0444)
                ],
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 0.50, color: Color(0x7FE7E7E7)),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: child,
    );
  }
}

class RecentTransactionBody extends StatelessWidget {
  final TransactionModel transactionModel;
  // final TransactionType transactionType;
  // final String transactionText;

  // final String transactionTime;

  // final String transactionAmount;

  const RecentTransactionBody({
    Key? key,
    required this.transactionModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imagePath = switch (transactionModel.transactionType) {
      TransactionType.credit => AppImagesSVG.receiveIcon,
      TransactionType.debit => AppImagesSVG.sendIcon,
    };
    return Row(
      children: [
        SvgPicture.asset(imagePath),
        11.horizontalSpace,
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 170,
                height: 19,
                child: Text(
                  transactionModel.transactionText,
                  style: TextStyle(
                    // color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'Onest',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 19,
                child: Text(
                  transactionModel.transactionTime,
                  style: TextStyle(
                    // color: Color(0xFFDADADA),
                    fontSize: 14,
                    fontFamily: 'Onest',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 48),
        SizedBox(
          width: 60,
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'N',
                  style: TextStyle(
                    // color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Onest',
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.lineThrough,
                    height: 0,
                  ),
                ),
                TextSpan(
                  text: transactionModel.transactionAmount,
                  style: TextStyle(
                    // color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Onest',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CooperativeCard extends StatelessWidget {
  final String cooperativeLink;
  final String cooperativeName;
  final String cooperativeImageUrl;

  const CooperativeCard({
    Key? key,
    required this.cooperativeLink,
    required this.cooperativeName,
    required this.cooperativeImageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 23.0,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //image
          Container(
            width: 40,
            height: 40,
            alignment: Alignment.center,
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: Color(0xFFDDDDDD),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
            child: SvgPicture.asset(
              AppImagesSVG.profile_circle,
              width: 24,
              height: 24,
            ),
          ),
          8.horizontalSpace,

          //text
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cooperativeName,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Onest',
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  cooperativeLink,
                  style: TextStyle(
                    color: lightMode(context)
                        ? Color(0xFF939090)
                        : Color(0xFFDADADA),
                    fontSize: 10,
                    fontFamily: 'Onest',
                    fontWeight: FontWeight.w300,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

          //button

          const SizedBox(width: 8),
          InkWell(onTap: () {}, child: Icon(Icons.more_vert)),
          // 12.horizontalSpace,
        ],
      ),
    );
  }
}
