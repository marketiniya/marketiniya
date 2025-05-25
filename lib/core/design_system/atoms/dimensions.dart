import 'package:flutter/material.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart' as s;


///
/// This is the global dimension class
///
/// which includes manipulation of the sides
/// [left], [right], [top], [bottom]
/// [x], [horizontal] - left & right, [y], [vertical] - top & bottom
/// [all] - left, right, top & bottom
class _Dimension {
  const _Dimension({
    required this.left,
    required this.top,
    required this.right,
    required this.bottom,
    required this.x,
    required this.y,
    required this.all,
    required this.vertical,
    required this.horizontal,
  });

  final _DimensionSide left;
  final _DimensionSide top;
  final _DimensionSide right;
  final _DimensionSide bottom;
  final _DimensionSide x;
  final _DimensionSide y;
  final _DimensionSide all;
  final _DimensionSide vertical;
  final _DimensionSide horizontal;

  static const standard = _Dimension(
    left: _DimensionSide.left,
    top: _DimensionSide.top,
    right: _DimensionSide.right,
    bottom: _DimensionSide.bottom,
    x: _DimensionSide.horizontal,
    y: _DimensionSide.vertical,
    all: _DimensionSide.all,
    vertical: _DimensionSide.vertical,
    horizontal: _DimensionSide.horizontal,
  );
}

class _DimensionSide {
  const _DimensionSide({
    required this.none,
    required this.nano,
    required this.micro,
    required this.xxs,
    required this.xxsPlus,
    required this.xs,
    required this.sm,
    required this.md,
    required this.lg,
    required this.xl,
    required this.xxl,
  });

  final EdgeInsets none;
  final EdgeInsets nano;
  final EdgeInsets micro;
  final EdgeInsets xxs;
  final EdgeInsets xxsPlus;
  final EdgeInsets xs;
  final EdgeInsets sm;
  final EdgeInsets md;
  final EdgeInsets lg;
  final EdgeInsets xl;
  final EdgeInsets xxl;

  static const all = _DimensionSide(
    none: EdgeInsets.zero,
    nano: EdgeInsets.all(s.nano),
    micro: EdgeInsets.all(s.micro),
    xxs: EdgeInsets.all(s.xxs),
    xxsPlus: EdgeInsets.all(s.xxsPlus),
    xs: EdgeInsets.all(s.xs),
    sm: EdgeInsets.all(s.sm),
    md: EdgeInsets.all(s.md),
    lg: EdgeInsets.all(s.lg),
    xl: EdgeInsets.all(s.xl),
    xxl: EdgeInsets.all(s.xxl),
  );

  static const vertical = _DimensionSide(
    none: EdgeInsets.zero,
    nano: EdgeInsets.symmetric(vertical: s.nano),
    micro: EdgeInsets.symmetric(vertical: s.micro),
    xxs: EdgeInsets.symmetric(vertical: s.xxs),
    xxsPlus: EdgeInsets.symmetric(vertical: s.xxsPlus),
    xs: EdgeInsets.symmetric(vertical: s.xs),
    sm: EdgeInsets.symmetric(vertical: s.sm),
    md: EdgeInsets.symmetric(vertical: s.md),
    lg: EdgeInsets.symmetric(vertical: s.lg),
    xl: EdgeInsets.symmetric(vertical: s.xl),
    xxl: EdgeInsets.symmetric(vertical: s.xxl),
  );

  static const horizontal = _DimensionSide(
    none: EdgeInsets.zero,
    nano: EdgeInsets.symmetric(horizontal: s.nano),
    micro: EdgeInsets.symmetric(horizontal: s.micro),
    xxs: EdgeInsets.symmetric(horizontal: s.xxs),
    xxsPlus: EdgeInsets.symmetric(horizontal: s.xxsPlus),
    xs: EdgeInsets.symmetric(horizontal: s.xs),
    sm: EdgeInsets.symmetric(horizontal: s.sm),
    md: EdgeInsets.symmetric(horizontal: s.md),
    lg: EdgeInsets.symmetric(horizontal: s.lg),
    xl: EdgeInsets.symmetric(horizontal: s.xl),
    xxl: EdgeInsets.symmetric(horizontal: s.xxl),
  );

  static const left = _DimensionSide(
    none: EdgeInsets.zero,
    nano: EdgeInsets.only(left: s.nano),
    micro: EdgeInsets.only(left: s.micro),
    xxs: EdgeInsets.only(left: s.xxs),
    xxsPlus: EdgeInsets.only(left: s.xxsPlus),
    xs: EdgeInsets.only(left: s.xs),
    sm: EdgeInsets.only(left: s.sm),
    md: EdgeInsets.only(left: s.md),
    lg: EdgeInsets.only(left: s.lg),
    xl: EdgeInsets.only(left: s.xl),
    xxl: EdgeInsets.only(left: s.xxl),
  );

  static const top = _DimensionSide(
    none: EdgeInsets.zero,
    nano: EdgeInsets.only(top: s.nano),
    micro: EdgeInsets.only(top: s.micro),
    xxs: EdgeInsets.only(top: s.xxs),
    xxsPlus: EdgeInsets.only(top: s.xxsPlus),
    xs: EdgeInsets.only(top: s.xs),
    sm: EdgeInsets.only(top: s.sm),
    md: EdgeInsets.only(top: s.md),
    lg: EdgeInsets.only(top: s.lg),
    xl: EdgeInsets.only(top: s.xl),
    xxl: EdgeInsets.only(top: s.xxl),
  );

  static const right = _DimensionSide(
    none: EdgeInsets.zero,
    nano: EdgeInsets.only(right: s.nano),
    micro: EdgeInsets.only(right: s.micro),
    xxs: EdgeInsets.only(right: s.xxs),
    xxsPlus: EdgeInsets.only(right: s.xxsPlus),
    xs: EdgeInsets.only(right: s.xs),
    sm: EdgeInsets.only(right: s.sm),
    md: EdgeInsets.only(right: s.md),
    lg: EdgeInsets.only(right: s.lg),
    xl: EdgeInsets.only(right: s.xl),
    xxl: EdgeInsets.only(right: s.xxl),
  );

  static const bottom = _DimensionSide(
    none: EdgeInsets.zero,
    nano: EdgeInsets.only(bottom: s.nano),
    micro: EdgeInsets.only(bottom: s.micro),
    xxs: EdgeInsets.only(bottom: s.xxs),
    xxsPlus: EdgeInsets.only(bottom: s.xxsPlus),
    xs: EdgeInsets.only(bottom: s.xs),
    sm: EdgeInsets.only(bottom: s.sm),
    md: EdgeInsets.only(bottom: s.md),
    lg: EdgeInsets.only(bottom: s.lg),
    xl: EdgeInsets.only(bottom: s.xl),
    xxl: EdgeInsets.only(bottom: s.xxl),
  );
}

const dimen = _Dimension.standard;
