// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum DeviceSize {
  mobile,
  tablet,
  desktop,
}

abstract class FlutterFlowTheme {
  static DeviceSize deviceSize = DeviceSize.mobile;

  static FlutterFlowTheme of(BuildContext context) {
    deviceSize = getDeviceSize(context);
    return LightModeTheme();
  }

  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary;
  late Color secondary;
  late Color tertiary;
  late Color alternate;
  late Color primaryText;
  late Color secondaryText;
  late Color primaryBackground;
  late Color secondaryBackground;
  late Color accent1;
  late Color accent2;
  late Color accent3;
  late Color accent4;
  late Color success;
  late Color warning;
  late Color error;
  late Color info;

  late Color buttonPrimary00;
  late Color buttonDisabled0;
  late Color backgroundBrand;
  late Color field001;
  late Color borderDefault;
  late Color supportError0;
  late Color customColor1;
  late Color primaryBtnText;
  late Color background;
  late Color backgroundActive;
  late Color backgroundHover;
  late Color backgroundSelected;
  late Color backgroundSelectedHover;
  late Color backgroundbrand;
  late Color backgroundInverse;
  late Color backgroundInverseHover;
  late Color transparent;
  late Color layer01;
  late Color layer02;
  late Color layer03;
  late Color layerHover01;
  late Color layerHover02;
  late Color layerHover03;
  late Color layerActive01;
  late Color layerActive02;
  late Color layerActive03;
  late Color layerSelected01;
  late Color layerSelected02;
  late Color layerSelected03;
  late Color layerSelectedHover01;
  late Color layerSelectedHover02;
  late Color layerSelectedHover03;
  late Color layerSelectedDisabled;
  late Color layerSelectedInverse;
  late Color layerAccent01;
  late Color layerAccent02;
  late Color layerAccent03;
  late Color layerAccentHover01;
  late Color layerAccentHover02;
  late Color layerAccentHover03;
  late Color layerAccentActive01;
  late Color layerAccentActive02;
  late Color layerAccentActive03;
  late Color field01;
  late Color field02;
  late Color field03;
  late Color fieldHover01;
  late Color fieldHover02;
  late Color fieldHover03;
  late Color borderSubtle00;
  late Color borderSubtle01;
  late Color borderSubtle02;
  late Color borderSubtle03;
  late Color borderSubtleSelected01;
  late Color borderSubtleSelected02;
  late Color borderSubtleSelected03;
  late Color borderStrong01;
  late Color borderStrong02;
  late Color borderStrong03;
  late Color borderInverse;
  late Color borderInteractive;
  late Color borderDisabled;
  late Color textPrimary;
  late Color textSecondary;
  late Color textPlaceholder;
  late Color textOnColor;
  late Color textOnColorDisabled;
  late Color textHelper;
  late Color textError;
  late Color textInverse;
  late Color textDisabled;
  late Color linkPrimary;
  late Color linkPrimaryHover;
  late Color linkInverse;
  late Color linkSecondary;
  late Color linkVisted;
  late Color iconPrimary;
  late Color iconSecondary;
  late Color iconOnColor;
  late Color iconInverse;
  late Color iconOncolorDisabled;
  late Color iconDisabled;
  late Color buttonPrimary;
  late Color buttonPrimaryHover;
  late Color buttonPrimaryActive;
  late Color buttonSecondary;
  late Color buttonSecondaryHover;
  late Color buttonSecondaryActive;
  late Color buttonTertiary;
  late Color buttonTertiaryHover;
  late Color buttonTertiaryActive;
  late Color buttonDangerPrimary;
  late Color buttonDangerSecondary;
  late Color buttonDangerHover;
  late Color buttonDangerActive;
  late Color buttonDisabled;
  late Color buttonSeparator;
  late Color supportError;
  late Color supportSuccess;
  late Color supportWarning;
  late Color supportInfo;
  late Color supportCautionMajor;
  late Color supportCautionMinor;
  late Color supportUndefined;
  late Color supportErrorInverse;
  late Color supportSuccessInverse;
  late Color supportWarningInverse;
  late Color supportInfoInverse;
  late Color focus;
  late Color focusInverse;
  late Color focusInset;
  late Color skeletonBackground;
  late Color skeletonElement;
  late Color highlight;
  late Color interactive;
  late Color overlay;
  late Color toggleOff;
  late Color notificationInfoBackground;
  late Color notificationInfoBorder;
  late Color notificationSucessBackground;
  late Color notificationSucessBorder;
  late Color notificationErrorBackground;
  late Color notificationErrorBorder;
  late Color notificationWarningBackground;
  late Color notificationWarningBorder;
  late Color notificationActionHover;
  late Color notificationActionTertiaryInverse;
  late Color notificationActionTertiaryInverseText;
  late Color notificationActionTertiaryInverseHover;
  late Color borderSubtle001;
  late Color lineColor;
  late Color white70;

  @Deprecated('Use displaySmallFamily instead')
  String get title1Family => displaySmallFamily;
  @Deprecated('Use displaySmall instead')
  TextStyle get title1 => typography.displaySmall;
  @Deprecated('Use headlineMediumFamily instead')
  String get title2Family => typography.headlineMediumFamily;
  @Deprecated('Use headlineMedium instead')
  TextStyle get title2 => typography.headlineMedium;
  @Deprecated('Use headlineSmallFamily instead')
  String get title3Family => typography.headlineSmallFamily;
  @Deprecated('Use headlineSmall instead')
  TextStyle get title3 => typography.headlineSmall;
  @Deprecated('Use titleMediumFamily instead')
  String get subtitle1Family => typography.titleMediumFamily;
  @Deprecated('Use titleMedium instead')
  TextStyle get subtitle1 => typography.titleMedium;
  @Deprecated('Use titleSmallFamily instead')
  String get subtitle2Family => typography.titleSmallFamily;
  @Deprecated('Use titleSmall instead')
  TextStyle get subtitle2 => typography.titleSmall;
  @Deprecated('Use bodyMediumFamily instead')
  String get bodyText1Family => typography.bodyMediumFamily;
  @Deprecated('Use bodyMedium instead')
  TextStyle get bodyText1 => typography.bodyMedium;
  @Deprecated('Use bodySmallFamily instead')
  String get bodyText2Family => typography.bodySmallFamily;
  @Deprecated('Use bodySmall instead')
  TextStyle get bodyText2 => typography.bodySmall;

  String get displayLargeFamily => typography.displayLargeFamily;
  TextStyle get displayLarge => typography.displayLarge;
  String get displayMediumFamily => typography.displayMediumFamily;
  TextStyle get displayMedium => typography.displayMedium;
  String get displaySmallFamily => typography.displaySmallFamily;
  TextStyle get displaySmall => typography.displaySmall;
  String get headlineLargeFamily => typography.headlineLargeFamily;
  TextStyle get headlineLarge => typography.headlineLarge;
  String get headlineMediumFamily => typography.headlineMediumFamily;
  TextStyle get headlineMedium => typography.headlineMedium;
  String get headlineSmallFamily => typography.headlineSmallFamily;
  TextStyle get headlineSmall => typography.headlineSmall;
  String get titleLargeFamily => typography.titleLargeFamily;
  TextStyle get titleLarge => typography.titleLarge;
  String get titleMediumFamily => typography.titleMediumFamily;
  TextStyle get titleMedium => typography.titleMedium;
  String get titleSmallFamily => typography.titleSmallFamily;
  TextStyle get titleSmall => typography.titleSmall;
  String get labelLargeFamily => typography.labelLargeFamily;
  TextStyle get labelLarge => typography.labelLarge;
  String get labelMediumFamily => typography.labelMediumFamily;
  TextStyle get labelMedium => typography.labelMedium;
  String get labelSmallFamily => typography.labelSmallFamily;
  TextStyle get labelSmall => typography.labelSmall;
  String get bodyLargeFamily => typography.bodyLargeFamily;
  TextStyle get bodyLarge => typography.bodyLarge;
  String get bodyMediumFamily => typography.bodyMediumFamily;
  TextStyle get bodyMedium => typography.bodyMedium;
  String get bodySmallFamily => typography.bodySmallFamily;
  TextStyle get bodySmall => typography.bodySmall;

  Typography get typography => {
        DeviceSize.mobile: MobileTypography(this),
        DeviceSize.tablet: TabletTypography(this),
        DeviceSize.desktop: DesktopTypography(this),
      }[deviceSize]!;
}

DeviceSize getDeviceSize(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  if (width < 479) {
    return DeviceSize.mobile;
  } else if (width < 991) {
    return DeviceSize.tablet;
  } else {
    return DeviceSize.desktop;
  }
}

class LightModeTheme extends FlutterFlowTheme {
  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary = const Color(0xFFFF5315);
  late Color secondary = const Color(0xFF1C1C38);
  late Color tertiary = const Color(0xFFAADD33);
  late Color alternate = const Color(0xFF6E6EC3);
  late Color primaryText = const Color(0xFF181A20);
  late Color secondaryText = const Color(0xFF626468);
  late Color primaryBackground = const Color(0xFFF0F5FA);
  late Color secondaryBackground = const Color(0xFFFFFFFF);
  late Color accent1 = const Color(0xFF616161);
  late Color accent2 = const Color(0xFF757575);
  late Color accent3 = const Color(0xFFE0E0E0);
  late Color accent4 = const Color(0xFFEEEEEE);
  late Color success = const Color(0xFF04A24C);
  late Color warning = const Color(0xFFFCDC0C);
  late Color error = const Color(0xFFE21C3D);
  late Color info = const Color(0xFF1C4494);

  late Color buttonPrimary00 = Color(0xFFFF5315);
  late Color buttonDisabled0 = Color(0xFFC8C5D0);
  late Color backgroundBrand = Color(0xFF222239);
  late Color field001 = Color(0xFFF4F4F4);
  late Color borderDefault = Color(0xFFDDE7ED);
  late Color supportError0 = Color(0xFFDA1E28);
  late Color customColor1 = Color(0xFFE79D4E);
  late Color primaryBtnText = Color(0xFFFFFFFF);
  late Color background = Color(0xFFFFFFFF);
  late Color backgroundActive = Color(0x7F8D8D8D);
  late Color backgroundHover = Color(0x1F8D8D8D);
  late Color backgroundSelected = Color(0x328D8D8D);
  late Color backgroundSelectedHover = Color(0x528D8D8D);
  late Color backgroundbrand = Color(0xFF222239);
  late Color backgroundInverse = Color(0xFF393939);
  late Color backgroundInverseHover = Color(0xFF4C4C4C);
  late Color transparent = Color(0xFFFFFFFF);
  late Color layer01 = Color(0xFFF4F4F4);
  late Color layer02 = Color(0xFFFFFFFF);
  late Color layer03 = Color(0xFFF4F4F4);
  late Color layerHover01 = Color(0xFFE5E5E5);
  late Color layerHover02 = Color(0xFFE5E5E5);
  late Color layerHover03 = Color(0xFFE5E5E5);
  late Color layerActive01 = Color(0xFFC6C6C6);
  late Color layerActive02 = Color(0xFFC6C6C6);
  late Color layerActive03 = Color(0xFFC6C6C6);
  late Color layerSelected01 = Color(0xFFE0E0E0);
  late Color layerSelected02 = Color(0xFFE0E0E0);
  late Color layerSelected03 = Color(0xFFE0E0E0);
  late Color layerSelectedHover01 = Color(0xFFCACACA);
  late Color layerSelectedHover02 = Color(0xFFCACACA);
  late Color layerSelectedHover03 = Color(0xFFCACACA);
  late Color layerSelectedDisabled = Color(0xFF8D8D8D);
  late Color layerSelectedInverse = Color(0xFF161616);
  late Color layerAccent01 = Color(0xFFDDE7ED);
  late Color layerAccent02 = Color(0xFFE0E0E0);
  late Color layerAccent03 = Color(0xFFE0E0E0);
  late Color layerAccentHover01 = Color(0xFFCACACA);
  late Color layerAccentHover02 = Color(0xFFCACACA);
  late Color layerAccentHover03 = Color(0xFFCACACA);
  late Color layerAccentActive01 = Color(0xFFA8A8A8);
  late Color layerAccentActive02 = Color(0xFFA8A8A8);
  late Color layerAccentActive03 = Color(0xFFA8A8A8);
  late Color field01 = Color(0xFFFFFFFF);
  late Color field02 = Color(0xFFF0F5FA);
  late Color field03 = Color(0xFFF4F4F4);
  late Color fieldHover01 = Color(0xFFE5E5E5);
  late Color fieldHover02 = Color(0xFFE5E5E5);
  late Color fieldHover03 = Color(0xFFE5E5E5);
  late Color borderSubtle00 = Color(0xFF50EE2B);
  late Color borderSubtle01 = Color(0xFFD0D5DD);
  late Color borderSubtle02 = Color(0xFFE0E0E0);
  late Color borderSubtle03 = Color(0xFFE0E0E0);
  late Color borderSubtleSelected01 = Color(0xFFC6C6C6);
  late Color borderSubtleSelected02 = Color(0xFFC6C6C6);
  late Color borderSubtleSelected03 = Color(0xFFC6C6C6);
  late Color borderStrong01 = Color(0xFF8D8D8D);
  late Color borderStrong02 = Color(0xFF8D8D8D);
  late Color borderStrong03 = Color(0xFF8D8D8D);
  late Color borderInverse = Color(0xFF161616);
  late Color borderInteractive = Color(0xFF3D3C8F);
  late Color borderDisabled = Color(0xFFC6C6C6);
  late Color textPrimary = Color(0xFF161616);
  late Color textSecondary = Color(0xFF525252);
  late Color textPlaceholder = Color(0xFFA8A8A8);
  late Color textOnColor = Color(0xFFFFFFFF);
  late Color textOnColorDisabled = Color(0xFF8D8D8D);
  late Color textHelper = Color(0xFF6F6F6F);
  late Color textError = Color(0xFFBA1A1A);
  late Color textInverse = Color(0xFFFFFFFF);
  late Color textDisabled = Color(0x3F161616);
  late Color linkPrimary = Color(0xFF3D3C8F);
  late Color linkPrimaryHover = Color(0xFFCC4211);
  late Color linkInverse = Color(0xFFFFB59F);
  late Color linkSecondary = Color(0xFFFF5315);
  late Color linkVisted = Color(0xFF852300);
  late Color iconPrimary = Color(0xFF161616);
  late Color iconSecondary = Color(0xFF525252);
  late Color iconOnColor = Color(0xFFFFFFFF);
  late Color iconInverse = Color(0xFFFFFFFF);
  late Color iconOncolorDisabled = Color(0xFF8D8D8D);
  late Color iconDisabled = Color(0x40161616);
  late Color buttonPrimary = Color(0xFFFF5315);
  late Color buttonPrimaryHover = Color(0xFFDA3F00);
  late Color buttonPrimaryActive = Color(0xFFAE3100);
  late Color buttonSecondary = Color(0xFFFFDBD0);
  late Color buttonSecondaryHover = Color(0xFF4C4C4C);
  late Color buttonSecondaryActive = Color(0xFFFFB59F);
  late Color buttonTertiary = Color(0xFFAADD33);
  late Color buttonTertiaryHover = Color(0xFF759E00);
  late Color buttonTertiaryActive = Color(0xFF006702);
  late Color buttonDangerPrimary = Color(0xFFBA1111);
  late Color buttonDangerSecondary = Color(0xFFDE3333);
  late Color buttonDangerHover = Color(0xFF690000);
  late Color buttonDangerActive = Color(0xFF410000);
  late Color buttonDisabled = Color(0xFFC6C6C6);
  late Color buttonSeparator = Color(0xFFE0E0E0);
  late Color supportError = Color(0xFFBA1A1A);
  late Color supportSuccess = Color(0xFF198038);
  late Color supportWarning = Color(0xFFF1C21B);
  late Color supportInfo = Color(0xFF0043CE);
  late Color supportCautionMajor = Color(0xFFFF832B);
  late Color supportCautionMinor = Color(0xFFF1C21B);
  late Color supportUndefined = Color(0xFF8A3FFC);
  late Color supportErrorInverse = Color(0xFFFA4D56);
  late Color supportSuccessInverse = Color(0xFF42BE65);
  late Color supportWarningInverse = Color(0xFFF1C21B);
  late Color supportInfoInverse = Color(0xFF4589FF);
  late Color focus = Color(0xFF222239);
  late Color focusInverse = Color(0xFFFFFFFF);
  late Color focusInset = Color(0xFFFFFFFF);
  late Color skeletonBackground = Color(0xFFE5E5E5);
  late Color skeletonElement = Color(0xFFC6C6C6);
  late Color highlight = Color(0xFFD0E2FF);
  late Color interactive = Color(0xFFFF5315);
  late Color overlay = Color(0x7F161616);
  late Color toggleOff = Color(0xFF8D8D8D);
  late Color notificationInfoBackground = Color(0xFFEDF5FF);
  late Color notificationInfoBorder = Color(0x4C0043CE);
  late Color notificationSucessBackground = Color(0xFFDEFBE6);
  late Color notificationSucessBorder = Color(0x4C24A148);
  late Color notificationErrorBackground = Color(0xFFFFF1F1);
  late Color notificationErrorBorder = Color(0x4DDA1E28);
  late Color notificationWarningBackground = Color(0xFFFCF4D6);
  late Color notificationWarningBorder = Color(0x4CF1C21B);
  late Color notificationActionHover = Color(0xFFFFFFFF);
  late Color notificationActionTertiaryInverse = Color(0xFFFFFFFF);
  late Color notificationActionTertiaryInverseText = Color(0xFF161616);
  late Color notificationActionTertiaryInverseHover = Color(0xFFF4F4F4);
  late Color borderSubtle001 = Color(0xFFE0E0E0);
  late Color lineColor = Color(0xFFE0E3E7);
  late Color white70 = Color(0xB3FFFFFF);
}

abstract class Typography {
  String get displayLargeFamily;
  TextStyle get displayLarge;
  String get displayMediumFamily;
  TextStyle get displayMedium;
  String get displaySmallFamily;
  TextStyle get displaySmall;
  String get headlineLargeFamily;
  TextStyle get headlineLarge;
  String get headlineMediumFamily;
  TextStyle get headlineMedium;
  String get headlineSmallFamily;
  TextStyle get headlineSmall;
  String get titleLargeFamily;
  TextStyle get titleLarge;
  String get titleMediumFamily;
  TextStyle get titleMedium;
  String get titleSmallFamily;
  TextStyle get titleSmall;
  String get labelLargeFamily;
  TextStyle get labelLarge;
  String get labelMediumFamily;
  TextStyle get labelMedium;
  String get labelSmallFamily;
  TextStyle get labelSmall;
  String get bodyLargeFamily;
  TextStyle get bodyLarge;
  String get bodyMediumFamily;
  TextStyle get bodyMedium;
  String get bodySmallFamily;
  TextStyle get bodySmall;
}

class MobileTypography extends Typography {
  MobileTypography(this.theme);

  final FlutterFlowTheme theme;

  String get displayLargeFamily => 'Nunito';
  TextStyle get displayLarge => GoogleFonts.getFont(
        'Nunito',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 57.0,
      );
  String get displayMediumFamily => 'Nunito';
  TextStyle get displayMedium => GoogleFonts.getFont(
        'Nunito',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 45.0,
      );
  String get displaySmallFamily => 'Nunito';
  TextStyle get displaySmall => GoogleFonts.getFont(
        'Nunito',
        color: theme.buttonPrimary00,
        fontWeight: FontWeight.w600,
        fontSize: 24.0,
      );
  String get headlineLargeFamily => 'Nunito';
  TextStyle get headlineLarge => GoogleFonts.getFont(
        'Nunito',
        color: theme.primaryText,
        fontWeight: FontWeight.bold,
        fontSize: 32.0,
      );
  String get headlineMediumFamily => 'Nunito';
  TextStyle get headlineMedium => GoogleFonts.getFont(
        'Nunito',
        color: theme.secondaryText,
        fontWeight: FontWeight.w600,
        fontSize: 22.0,
      );
  String get headlineSmallFamily => 'Nunito';
  TextStyle get headlineSmall => GoogleFonts.getFont(
        'Nunito',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 20.0,
      );
  String get titleLargeFamily => 'Nunito';
  TextStyle get titleLarge => GoogleFonts.getFont(
        'Nunito',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 22.0,
      );
  String get titleMediumFamily => 'Lato';
  TextStyle get titleMedium => GoogleFonts.getFont(
        'Lato',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 18.0,
      );
  String get titleSmallFamily => 'Lato';
  TextStyle get titleSmall => GoogleFonts.getFont(
        'Lato',
        color: theme.secondaryText,
        fontWeight: FontWeight.w600,
        fontSize: 16.0,
      );
  String get labelLargeFamily => 'Nunito';
  TextStyle get labelLarge => GoogleFonts.getFont(
        'Nunito',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 14.0,
      );
  String get labelMediumFamily => 'Nunito';
  TextStyle get labelMedium => GoogleFonts.getFont(
        'Nunito',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 12.0,
      );
  String get labelSmallFamily => 'Nunito';
  TextStyle get labelSmall => GoogleFonts.getFont(
        'Nunito',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 11.0,
      );
  String get bodyLargeFamily => '';
  TextStyle get bodyLarge => GoogleFonts.getFont(
        'Roboto',
      );
  String get bodyMediumFamily => 'Lato';
  TextStyle get bodyMedium => GoogleFonts.getFont(
        'Lato',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 14.0,
      );
  String get bodySmallFamily => 'Lato';
  TextStyle get bodySmall => GoogleFonts.getFont(
        'Lato',
        color: theme.secondaryText,
        fontWeight: FontWeight.w600,
        fontSize: 14.0,
      );
}

class TabletTypography extends Typography {
  TabletTypography(this.theme);

  final FlutterFlowTheme theme;

  String get displayLargeFamily => 'Nunito';
  TextStyle get displayLarge => GoogleFonts.getFont(
        'Nunito',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 57.0,
      );
  String get displayMediumFamily => 'Nunito';
  TextStyle get displayMedium => GoogleFonts.getFont(
        'Nunito',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 45.0,
      );
  String get displaySmallFamily => 'Nunito';
  TextStyle get displaySmall => GoogleFonts.getFont(
        'Nunito',
        color: theme.buttonPrimary00,
        fontWeight: FontWeight.w600,
        fontSize: 24.0,
      );
  String get headlineLargeFamily => 'Nunito';
  TextStyle get headlineLarge => GoogleFonts.getFont(
        'Nunito',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 32.0,
      );
  String get headlineMediumFamily => 'Nunito';
  TextStyle get headlineMedium => GoogleFonts.getFont(
        'Nunito',
        color: theme.secondaryText,
        fontWeight: FontWeight.w600,
        fontSize: 22.0,
      );
  String get headlineSmallFamily => 'Nunito';
  TextStyle get headlineSmall => GoogleFonts.getFont(
        'Nunito',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 20.0,
      );
  String get titleLargeFamily => 'Nunito';
  TextStyle get titleLarge => GoogleFonts.getFont(
        'Nunito',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 22.0,
      );
  String get titleMediumFamily => 'Nunito';
  TextStyle get titleMedium => GoogleFonts.getFont(
        'Nunito',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 18.0,
      );
  String get titleSmallFamily => 'Nunito';
  TextStyle get titleSmall => GoogleFonts.getFont(
        'Nunito',
        color: theme.secondaryText,
        fontWeight: FontWeight.w600,
        fontSize: 16.0,
      );
  String get labelLargeFamily => 'Nunito';
  TextStyle get labelLarge => GoogleFonts.getFont(
        'Nunito',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 14.0,
      );
  String get labelMediumFamily => 'Nunito';
  TextStyle get labelMedium => GoogleFonts.getFont(
        'Nunito',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 12.0,
      );
  String get labelSmallFamily => 'Nunito';
  TextStyle get labelSmall => GoogleFonts.getFont(
        'Nunito',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 11.0,
      );
  String get bodyLargeFamily => 'Nunito';
  TextStyle get bodyLarge => GoogleFonts.getFont(
        'Nunito',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
      );
  String get bodyMediumFamily => 'Nunito';
  TextStyle get bodyMedium => GoogleFonts.getFont(
        'Nunito',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 14.0,
      );
  String get bodySmallFamily => 'Nunito';
  TextStyle get bodySmall => GoogleFonts.getFont(
        'Nunito',
        color: theme.secondaryText,
        fontWeight: FontWeight.w600,
        fontSize: 14.0,
      );
}

class DesktopTypography extends Typography {
  DesktopTypography(this.theme);

  final FlutterFlowTheme theme;

  String get displayLargeFamily => 'Nunito';
  TextStyle get displayLarge => GoogleFonts.getFont(
        'Nunito',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 57.0,
      );
  String get displayMediumFamily => 'Nunito';
  TextStyle get displayMedium => GoogleFonts.getFont(
        'Nunito',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 45.0,
      );
  String get displaySmallFamily => 'Nunito';
  TextStyle get displaySmall => GoogleFonts.getFont(
        'Nunito',
        color: theme.buttonPrimary00,
        fontWeight: FontWeight.w600,
        fontSize: 24.0,
      );
  String get headlineLargeFamily => 'Nunito';
  TextStyle get headlineLarge => GoogleFonts.getFont(
        'Nunito',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 32.0,
      );
  String get headlineMediumFamily => 'Nunito';
  TextStyle get headlineMedium => GoogleFonts.getFont(
        'Nunito',
        color: theme.secondaryText,
        fontWeight: FontWeight.w600,
        fontSize: 22.0,
      );
  String get headlineSmallFamily => 'Nunito';
  TextStyle get headlineSmall => GoogleFonts.getFont(
        'Nunito',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 20.0,
      );
  String get titleLargeFamily => 'Nunito';
  TextStyle get titleLarge => GoogleFonts.getFont(
        'Nunito',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 22.0,
      );
  String get titleMediumFamily => 'Nunito';
  TextStyle get titleMedium => GoogleFonts.getFont(
        'Nunito',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 18.0,
      );
  String get titleSmallFamily => 'Nunito';
  TextStyle get titleSmall => GoogleFonts.getFont(
        'Nunito',
        color: theme.secondaryText,
        fontWeight: FontWeight.w600,
        fontSize: 16.0,
      );
  String get labelLargeFamily => 'Nunito';
  TextStyle get labelLarge => GoogleFonts.getFont(
        'Nunito',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 14.0,
      );
  String get labelMediumFamily => 'Nunito';
  TextStyle get labelMedium => GoogleFonts.getFont(
        'Nunito',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 12.0,
      );
  String get labelSmallFamily => 'Nunito';
  TextStyle get labelSmall => GoogleFonts.getFont(
        'Nunito',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 11.0,
      );
  String get bodyLargeFamily => 'Nunito';
  TextStyle get bodyLarge => GoogleFonts.getFont(
        'Nunito',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
      );
  String get bodyMediumFamily => 'Nunito';
  TextStyle get bodyMedium => GoogleFonts.getFont(
        'Nunito',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 14.0,
      );
  String get bodySmallFamily => 'Nunito';
  TextStyle get bodySmall => GoogleFonts.getFont(
        'Nunito',
        color: theme.secondaryText,
        fontWeight: FontWeight.w600,
        fontSize: 14.0,
      );
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    FontStyle? fontStyle,
    bool useGoogleFonts = true,
    TextDecoration? decoration,
    double? lineHeight,
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
              fontFamily!,
              color: color ?? this.color,
              fontSize: fontSize ?? this.fontSize,
              letterSpacing: letterSpacing ?? this.letterSpacing,
              fontWeight: fontWeight ?? this.fontWeight,
              fontStyle: fontStyle ?? this.fontStyle,
              decoration: decoration,
              height: lineHeight,
            )
          : copyWith(
              fontFamily: fontFamily,
              color: color,
              fontSize: fontSize,
              letterSpacing: letterSpacing,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              decoration: decoration,
              height: lineHeight,
            );
}
