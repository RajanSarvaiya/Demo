// import 'dart:io';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
//
// class PermissonDialog extends StatefulWidget {
//   VoidCallback? onTap;
//
//   PermissonDialog({this.onTap});
//
//   @override
//   State<PermissonDialog> createState() => _PermissonDialogState();
// }
//
// class _PermissonDialogState extends State<PermissonDialog>
//     with SingleTickerProviderStateMixin {
//   late AnimationController controller;
//   late Animation<double> scaleAnimation;
//
//   bool checked = false;
//
//   @override
//   void initState() {
//     super.initState();
//     controller = AnimationController(
//         vsync: this, duration: const Duration(milliseconds: 400));
//     scaleAnimation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
//
//     controller.addListener(() {
//       setState(() {});
//     });
//
//     controller.forward();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () {
//         return Future.value(false);
//       },
//       child: Center(
//         child: Material(
//           color: Colors.transparent,
//           child: ScaleTransition(
//             scale: scaleAnimation,
//             child: Container(
//               margin:
//                   EdgeInsets.symmetric(horizontal: ResponsiveManager.width(5)),
//               constraints: const BoxConstraints(
//                 maxWidth: 360,
//               ),
//               width: MediaQuery.of(context).size.width,
//               decoration: ShapeDecoration(
//                   color: Colors.white,
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10.0))),
//               child: Padding(
//                 padding: EdgeInsets.symmetric(
//                     horizontal: ResponsiveManager.width(5),
//                     vertical: ResponsiveManager.height(2)),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           "${AppLocalizations.of(context)!.ok}! ",
//                           style: text20SemiBold.copyWith(color: kBlack),
//                         ),
//                         Text(
//                           "${AppLocalizations.of(context)!.permissionTitle}!",
//                           style: text18SemiBold.copyWith(
//                               color: kBlack.withOpacity(0.7)),
//                         )
//                       ],
//                     ),
//                     SizedBox(height: ResponsiveManager.height(1.5)),
//                     _buildPermissionTile(
//                         cameraPermission,
//                         AppLocalizations.of(context)!.camera,
//                         AppLocalizations.of(context)!.cameraDesc),
//                     Divider(
//                       height: ResponsiveManager.height(2),
//                       indent: ResponsiveManager.width(2.5),
//                       endIndent: ResponsiveManager.width(2.5),
//                     ),
//                     _buildPermissionTile(
//                         galleryPermission,
//                         AppLocalizations.of(context)!.gallery,
//                         AppLocalizations.of(context)!.galleryDesc),
//                     Divider(
//                       height: ResponsiveManager.height(2),
//                       indent: ResponsiveManager.width(2.5),
//                       endIndent: ResponsiveManager.width(2.5),
//                     ),
//                     _buildPermissionTile(
//                         locationPermission,
//                         AppLocalizations.of(context)!.location,
//                         AppLocalizations.of(context)!.locationDesc),
//                     Divider(
//                       height: ResponsiveManager.height(2),
//                       indent: ResponsiveManager.width(2.5),
//                       endIndent: ResponsiveManager.width(2.5),
//                     ),
//                     _buildPermissionTile(
//                         notificationPermission,
//                         AppLocalizations.of(context)!.notification,
//                         AppLocalizations.of(context)!.notificationDesc),
//                     Divider(
//                       height: ResponsiveManager.height(2),
//                       indent: ResponsiveManager.width(2.5),
//                       endIndent: ResponsiveManager.width(2.5),
//                     ),
//                     _buildPermissionTile(
//                         internetPermission,
//                         AppLocalizations.of(context)!.backgroundPermission,
//                         AppLocalizations.of(context)!.backgroundPermissionDesc),
//                     SizedBox(height: ResponsiveManager.height(2)),
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Checkbox(
//                             materialTapTargetSize:
//                                 MaterialTapTargetSize.shrinkWrap,
//                             visualDensity: const VisualDensity(
//                                 horizontal: -4, vertical: -4),
//                             activeColor: kPrimaryColor,
//                             shape: const RoundedRectangleBorder(
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(4))),
//                             value: checked,
//                             onChanged: (val) {
//                               setState(() {
//                                 checked = val!;
//                               });
//                             }),
//                         SizedBox(width: ResponsiveManager.width(3)),
//                         Expanded(
//                             child: RichText(
//                                 text: TextSpan(children: [
//                           TextSpan(
//                             text: 'By continuing, you agree to our ',
//                             style: text12RegularGrey.copyWith(color: kBlack),
//                           ),
//                           TextSpan(
//                             text: AppLocalizations.of(context)!.tns,
//                             style: text12SemiBoldPrimary,
//                             recognizer: TapGestureRecognizer()
//                               ..onTap = () {
//                                 _openTnC();
//                               },
//                           ),
//                           TextSpan(
//                             text: " & ",
//                             style: text12RegularGrey.copyWith(color: kBlack),
//                           ),
//                           TextSpan(
//                             text: AppLocalizations.of(context)!.privacyPolicy,
//                             style: text12SemiBoldPrimary,
//                             recognizer: TapGestureRecognizer()
//                               ..onTap = () {
//                                 _openPrivacyPolicy();
//                               },
//                           ),
//                         ]))),
//                       ],
//                     ),
//                     SizedBox(height: ResponsiveManager.height(1)),
//                     _buildCancelAndAgreeButton(context),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildCancelAndAgreeButton(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: [
//         GestureDetector(
//           onTap: () {
//             exit(0);
//           },
//           child: Text(
//             AppLocalizations.of(context)!.cancel,
//             style: text14SemiBold.copyWith(color: kRed),
//           ),
//         ),
//         SizedBox(width: ResponsiveManager.width(5)),
//         GestureDetector(
//           onTap: () {
//             if (checked) {
//               PrefUtils().savePermission(true);
//               Navigator.pop(context);
//             }
//           },
//           child: Container(
//               padding: EdgeInsets.symmetric(
//                 horizontal: ResponsiveManager.width(5),
//                 vertical: ResponsiveManager.height(1),
//               ),
//               decoration: BoxDecoration(
//                 color: !checked ? Colors.transparent : kPrimaryColor,
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: Text(AppLocalizations.of(context)!.agree,
//                   style: text14SemiBold.copyWith(
//                       color: !checked ? kBlack.withOpacity(0.7) : kWhite))),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildPermissionTile(String icon, String title, String description) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: ResponsiveManager.width(2)),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SvgPicture.asset(icon, colorFilter: ColorFilter.mode(kBlack, BlendMode.srcIn),
//               height: ResponsiveManager.height(2.5),
//               width: ResponsiveManager.height(2.5)),
//           SizedBox(width: ResponsiveManager.width(3)),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(title,
//                     style: text16SemiBold),
//                 SizedBox(height: ResponsiveManager.height(1)),
//                 Text(description,
//                     style: text13Regular.copyWith(color: kGrey),
//                     maxLines: 10),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   _openTnC() async {
//     String url = tncUrl;
//     if (!await launchUrl(Uri.parse(url), mode: LaunchMode.inAppWebView)) {}
//   }
//
//   _openPrivacyPolicy() async {
//     String url = privacyPolicyUrl;
//     if (!await launchUrl(Uri.parse(url), mode: LaunchMode.inAppWebView)) {
//       // await launchUrl(Uri.parse(url));
//     }
//   }
// }
