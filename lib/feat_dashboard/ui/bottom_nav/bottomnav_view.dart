// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thrivia_app/app/app.router.dart';

import 'package:thrivia_app/common/constants.dart';
import 'package:thrivia_app/common/ui_helpers.dart';

import 'bottomnav_viewmodel.dart';

class BottomNavView extends StackedView<BottomNavViewModel> {
  const BottomNavView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    BottomNavViewModel viewModel,
    Widget? child,
  ) {
    final views = [
      Container(
          // color: Colors.blue,
          ),
      Container(
        color: Colors.red,
      ),
      Container(
        color: Colors.blue,
      ),
      Container(
        color: Colors.red,
      )
    ];
    return Scaffold(
      // backgroundColor: Theme.of(context).colorScheme.background,
      bottomNavigationBar: CustomBottomNav(
        setMethod: viewModel.setIndex,
        currentIndex: viewModel.currentIndex,
      ),
      //   type: BottomNavigationBarType.fixed,
      //   backgroundColor: Colors.grey[800],
      //   currentIndex: viewModel.currentIndex,
      //   onTap: viewModel.setIndex,
      //   items: [
      //     BottomNavigationBarItem(
      //       label: 'Home',
      //       icon: Icon(Icons.art_track),
      //     ),
      //     BottomNavigationBarItem(
      //       label: 'Finance',
      //       icon: Icon(Icons.list),
      //     ),
      //     BottomNavigationBarItem(
      //       label: 'Community',
      //       icon: Icon(Icons.list),
      //     ),
      //     BottomNavigationBarItem(
      //       label: 'Profile',
      //       icon: Icon(Icons.list),
      //     ),
      //   ],
      // ),
      // body: ExtendedNavigator(
      //   navigatorKey: StackedService.nestedNavigationKey(1),
      //   initialRoute: Routes.homeView,
      //   router: StackedRouter(),
      // ),
      body: SafeArea(child: viewModel.getViewForIndex(viewModel.currentIndex)),
    );
  }

  @override
  BottomNavViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      BottomNavViewModel();
}

class CustomBottomNav extends StatelessWidget {
  final void Function(int value) setMethod;
  final int currentIndex;
  const CustomBottomNav({
    Key? key,
    required this.setMethod,
    required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      padding: const EdgeInsets.only(
        // top: 16,
        left: 44,
        right: 43,
        // bottom: 15,
      ),
      decoration: BoxDecoration(
        color: lightMode(context) ? Colors.white : Color(0xFF0D1015),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        border: Border(
          // left: BorderSide(color: Color(0xFFE8E7E7)),
          top: BorderSide(width: 1, color: Color(0xFFE8E7E7)),
          // right: BorderSide(color: Color(0xFFE8E7E7)),
          // bottom: BorderSide(color: Color(0xFFE8E7E7)),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          NavBarItem(
            index: 0,
            onTap: () => setMethod(0),
            iconPath: AppImagesSVG.home,
            label: 'Home',
            currentIndex: currentIndex,
          ),
          NavBarItem(
            index: 1,
            onTap: () => setMethod(1),
            iconPath: AppImagesSVG.statusUp,
            label: 'Finance',
            currentIndex: currentIndex,
          ),
          NavBarItem(
            index: 2,
            onTap: () => setMethod(2),
            iconPath: AppImagesSVG.community,
            label: 'Community',
            currentIndex: currentIndex,
          ),
          NavBarItem(
            index: 3,
            onTap: () => setMethod(3),
            iconPath: AppImagesSVG.userTag,
            label: 'Profile',
            currentIndex: currentIndex,
          ),
        ],
      ),
    );
  }
}

class NavBarItem extends StatelessWidget {
  final VoidCallback onTap;

  final String iconPath;

  final String label;

  final int currentIndex;
  final int index;

  const NavBarItem({
    Key? key,
    required this.onTap,
    required this.iconPath,
    required this.label,
    required this.currentIndex,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isSelected = index == currentIndex;
    final color = isSelected
        ? Theme.of(context).colorScheme.onPrimary
        : Color(0xFF939090);
    return TextButton(
      onPressed: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            iconPath,
            colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
            width: 20,
            height: 20,
          ),
          verticalSpace(3),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 10,
              fontFamily: 'Onest',
              fontWeight: FontWeight.w400,
            ),
          ),
          isSelected
              ? Container(
                  width: 40,
                  height: 3,
                  decoration: ShapeDecoration(
                    color: Color(0xFF237A66),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                )
              : verticalSpace(3),
        ],
      ),
    );
  }
}
