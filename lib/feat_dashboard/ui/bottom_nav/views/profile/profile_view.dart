import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:thrivia_app/common/constants.dart';
import 'package:thrivia_app/common/ui_helpers.dart';
import 'package:thrivia_app/feat_auth/ui/login/login_view.dart';
import 'package:thrivia_app/ui/widgets/custom_button.dart';
import 'package:thrivia_app/ui/widgets/item_card.dart';
import 'package:thrivia_app/ui/widgets/svg_picture_colored.dart';

import 'profile_viewmodel.dart';

class ProfileView extends StackedView<ProfileViewModel> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ProfileViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //profile card

              ItemCard(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //dp
                    Container(
                      width: 40,
                      height: 40,
                      padding: const EdgeInsets.all(8),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                          color: Color(0xFFDDDDDD), shape: CircleBorder()),
                      child: SvgPicture.asset(AppImagesSVG.profile_circle),
                    ),
                    const SizedBox(width: 8),

                    //details
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Chinonye Umeh',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Onest',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'ID 23567',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Onest',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),

                    Spacer(),

                    Container(
                      padding: const EdgeInsets.all(8),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: Color(0xFFF3F3F3),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 3,
                            height: 3,
                            decoration: ShapeDecoration(
                              color: Color(0xFF27816C),
                              shape: OvalBorder(),
                            ),
                          ),
                          const SizedBox(width: 2),
                          Text(
                            'Active member',
                            style: TextStyle(
                              color: Color(0xFF27816C),
                              fontSize: 8,
                              fontFamily: 'Onest',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              32.verticalSpace,
              // Account details
              Text(
                'Account Details',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Onest',
                  fontWeight: FontWeight.w400,
                ),
              ),

              8.verticalSpace,

              ItemCard(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //personal info
                      ItemTile(
                        label: "Personal info",
                        iconPath: AppImagesSVG.userEdit,
                        onTap: () {},
                      ),
                      Divider(),

                      ItemTile(
                        label: "Membership details",
                        iconPath: AppImagesSVG.profile_2user,
                        onTap: () {},
                      ),
                      Divider(),
                      ItemTile(
                        label: "Financial information",
                        iconPath: AppImagesSVG.statusUp,
                        onTap: () {},
                      ),
                      Divider(),

                      ItemTile(
                        label: "Refer and earn",
                        iconPath: AppImagesSVG.cup,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
              //help and support

              32.verticalSpace,

              Text(
                'Help and Support',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Onest',
                  fontWeight: FontWeight.w400,
                ),
              ),

              8.verticalSpace,

              ItemCard(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ItemTile(
                        label: "Help center",
                        iconPath: AppImagesSVG.support24,
                        onTap: () {},
                      ),
                      Divider(),
                      ItemTile(
                        label: "FAQs",
                        iconPath: AppImagesSVG.messageQuestion,
                        onTap: () {},
                      ),
                      Divider(),
                      ItemTile(
                        label: "Log out",
                        iconPath: AppImagesSVG.logout,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  ProfileViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProfileViewModel();
}

class ItemTile extends StatelessWidget {
  const ItemTile({
    super.key,
    required this.label,
    required this.iconPath,
    required this.onTap,
  });

  final String label, iconPath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    var onPrimary2 = Theme.of(context).colorScheme.onPrimary;
    return CollapsedTextButton(
      onPressed: onTap,
      child: Row(
        children: [
          SvgPictureColored(
            width: 16,
            height: 16,
            color: onPrimary2,
            assetName: iconPath,
          ),
          8.horizontalSpace,
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: onPrimary2,
              fontFamily: 'Onest',
              fontWeight: FontWeight.w400,
            ),
          ),
          Spacer(),
          Icon(
            Icons.arrow_forward_ios,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ],
      ),
    );
  }
}
