import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:traning/new/shared/constants/colors.dart';
import 'package:traning/new/shared/constants/themes.dart';
import 'package:traning/new/shared/constants/uri.dart';
import 'package:traning/new/shared/utils/responsive_manager.dart';
import 'package:traning/new/shared/utils/textstyles/medium_textstyles.dart';
import 'package:traning/new/shared/utils/textstyles/regular_textstyles.dart';
import 'package:url_launcher/url_launcher.dart';

class TnCPPText extends StatelessWidget {
  const TnCPPText({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: ResponsiveManager.width(5),
          vertical: ResponsiveManager.height(2)
        ),
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: "By logging in, I agree to ",
            style: text14Regular.copyWith(color: kGrey, fontFamily: fontFamily),
            children: [
              TextSpan(
                text: "Terms & Conditions",
                style: text14MediumPrimary,
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    _launchURL(tncUrl); // Replace with your terms URL
                  },
              ),
              TextSpan(
                text: "and",
                style: text14Regular.copyWith(color: kGrey),
              ),
              TextSpan(
                text: "\nPrivacy Policy",
                style: text14MediumPrimary,
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    _launchURL(privacyPolicyUrl);
                  },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.platformDefault);
    } else {
      throw 'Could not launch $url';
    }
  }
}
