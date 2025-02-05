import 'package:evently_app/core/constants/app_assets.dart';
import 'package:evently_app/core/widgets/custom_drop_down_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/app_colors.dart';
import '../../../provider/app_language_provider.dart';
import '../../../provider/theme_mode_provider.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              height: MediaQuery.of(context).size.height * 0.27,
              decoration: BoxDecoration(
                color: AppColors.primaryColorLight,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(70),
                ),
              ),
              child: Row(
                children: [
                  Image.asset(
                    AppAssets.profileImage,
                    height: MediaQuery.of(context).size.height * 0.2,
                  ),
                  Column(
                    children: [
                      Expanded(
                        child: Text(
                          "John Safwat",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: AppColors.white),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "johnsafwat.route@gmail.com",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColors.white),
                          softWrap: true,
                          overflow: TextOverflow.visible,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.language,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: AppColors.primaryColorLight, width: 2)),
                    child: CustomDropdownMenu(
                      hintText: AppLocalizations.of(context)!.language,
                      textColor: AppColors.primaryColorLight,
                      options: [
                        AppLocalizations.of(context)!.english,
                        AppLocalizations.of(context)!.arabic,
                      ],
                      onChange: (String? newValue) {
                        if (newValue == AppLocalizations.of(context)!.arabic) {
                          languageProvider.changeAppLanguage("ar");
                        } else {
                          languageProvider.changeAppLanguage("en");
                        }

                        setState(() {
                          selectedValue = newValue;
                        });
                      },
                      value: selectedValue,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    AppLocalizations.of(context)!.theme,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: AppColors.primaryColorLight, width: 2)),
                    child: CustomDropdownMenu(
                      hintText: AppLocalizations.of(context)!.selectTheme,
                      textColor: AppColors.primaryColorLight,
                      options: [
                        AppLocalizations.of(context)!.light,
                        AppLocalizations.of(context)!.dark,
                      ],
                      onChange: (String? newValue) {
                        if (newValue == AppLocalizations.of(context)!.dark) {
                          themeProvider.changeAppTheme(ThemeMode.dark);
                        } else {
                          themeProvider.changeAppTheme(ThemeMode.light);
                        }

                        setState(() {
                          selectedValue = newValue;
                        });
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
