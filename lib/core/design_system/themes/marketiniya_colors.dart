import 'package:flutter/material.dart';
import 'package:marketinya/core/design_system/atoms/colors.dart';
import 'package:marketinya/core/design_system/atoms/secondary_colors.dart';

class MarketiniyaColors {
  const MarketiniyaColors(this.buildContext);

  final BuildContext buildContext;

  TextColors get texts => const TextColors();
  IconColors get icons => const IconColors();
  BorderColors get borders => const BorderColors();
  BackgroundColors get backgrounds => const BackgroundColors();
  Shimmers get shimmers => const Shimmers();
  Decorative get decorative => const Decorative();
  ButtonColors get buttons => const ButtonColors();

  // Plan specific colors
  Color get standardPlanBackground => lightBlue;

  Color get plusPlanBackground => graphite;

  Color get cashbackPlanBackground => indigo;

  Color get proPlanBackground => salmonPink;

  Color get premiumPlanBackground => white;

  Color get proPlanBadge => darkCyan;

  Color get proPlanBadgeVariant => darkCyanVariant;

  Color get plusPlanBadge => moderatePink;

  Color get plusPlanBadgeVariant => moderatePinkVariant;

  // Secondary colors
  Color get secondaryPurple => purple50;

  Color get secondaryNavy => navy100;

  Color get secondaryBlue => blue100;

  Color get secondaryTeal => teal50;

  Color get secondaryYellow => yellow100;

  Color get secondaryOrange => orange100;

  Color get secondaryMagenta => magenta50;

  Color get secondaryBrown => brown100;

  // Funding Options colors
  Color get foPrimary => foPrimary500;
}

class TextColors {
  const TextColors();

  Color get standard => grey1100;
  Color get secondary => grey900;
  Color get tertiary => grey700;
  Color get brand => primary800;
  Color get brandSubtle => primary500;
  Color get brandBold => primary1100;
  Color get disabled => grey500;
  Color get inverse => grey;
  Color get success => green400;
  Color get successBold => green800;
  Color get successBolder => green800;
  Color get warning => yellow400;
  Color get warningBold => yellow800;
  Color get warningBolder => yellow800;
  Color get error => red500;
  Color get errorBold => red800;
  Color get errorBolder => red800;
}

class IconColors {
  const IconColors();

  Color get standard => grey800;
  Color get secondary => grey600;
  Color get disabled => grey700;
  Color get inverse => grey;
  Color get brandSubtle => primary500;
  Color get brand => primary800;
  Color get brandBold => primary1100;
  Color get success => green400;
  Color get successBold => green700;
  Color get warning => yellow400;
  Color get warningBold => yellow800;
  Color get warningBolder => yellow800;
  Color get error => red500;
  Color get errorBold => red800;
  Color get errorBolder => red800;

  Color get purpleSubtle => purple500;
  Color get tealSubtle => teal500;
  Color get magentaSubtle => magenta500;
  Color get blueSubtle => blue500;
  Color get orangeSubtle => orange500;
  Color get brownSubtle => brown500;
  Color get purpleBold => purple700;
  Color get tealBold => teal700;
  Color get magentaBold => magenta700;
  Color get blueBold => blue700;
  Color get orangeBold => orange700;
  Color get brownBold => brown700;
}

class BorderColors {
  const BorderColors();

  Color get subtle => grey300;
  Color get standard => grey400;
  Color get bold => grey600;
  Color get disabled => grey200;
  Color get brandSubtlest => primary200;
  Color get brandSubtler => primary300;
  Color get brandSubtle => primary400;
  Color get brand => primary800;
  Color get brandBolder => primary1100;
  Color get success => green400;
  Color get successBold => green700;
  Color get warning => yellow400;
  Color get warningBold => yellow700;
  Color get error => red500;
  Color get errorBold => red700;
}

class BackgroundColors {
  const BackgroundColors();

  Color get standard => primary100;
  Color get white => grey;
  Color get black => grey1200;
  Color get subtler => grey100;
  Color get subtle => grey400;
  Color get bold => grey600;
  Color get disabled => grey200;
  Color get brandSubtler => primary200;
  Color get brandSubtle => primary300;
  Color get brand => primary800;
  Color get brandBolder => primary1100;
  Color get success => green100;
  Color get successBold => green400;
  Color get successBolder => green700;
  Color get warning => yellow100;
  Color get warningBold => yellow400;
  Color get warningBolder => yellow700;
  Color get error => red100;
  Color get errorBold => red800;
}

class Shimmers {
  const Shimmers();

  Color get background => primary200;
  Color get highlight => primary100;
}

class Decorative {
  const Decorative();

  Color get purpleSubtle => purple50;
  Color get purple => purple300;
  Color get purpleBold => purple700;
  Color get tealSubtle => teal50;
  Color get teal => teal300;
  Color get tealBold => teal700;
  Color get magentaSubtle => magenta50;
  Color get magenta => magenta300;
  Color get magentaBold => magenta700;
  Color get blueSubtle => blue100;
  Color get blue => blue300;
  Color get blueBold => blue700;
  Color get orangeSubtle => orange100;
  Color get orange => orange300;
  Color get orangeBold => orange700;
  Color get brownSubtle => brown100;
  Color get brown => brown300;
  Color get brownBold => brown700;
  Color get greenSubtle => green200;
  Color get green => green300;
  Color get greenBold => green600;
  Color get yellowSubtle => yellow200;
  Color get yellow => yellow300;
  Color get yellowBold => yellow700;
}

class ButtonColors {
  const ButtonColors();

  Color get primary => const Color(0xFF708446);
  Color get primaryDark => const Color(0xFF5F6F39);
  Color get secondary => Colors.white;
  Color get loader => Colors.yellow;

  // Overlay colors
  Color get primaryOverlay => const Color(0xFF5F6F39);
  Color get secondaryOverlay => const Color(0xFFF5F5F5);
}
