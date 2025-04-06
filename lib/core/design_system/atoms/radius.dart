import 'package:flutter/material.dart';

const _extraSmall = 4.0;
const _small = 8.0;
const _medium = 12.0;
const _large = 16.0;
const _extraLarge = 20.0;
const _round = 256.0;

class _Radius {
  const _Radius({
    required this.all,
    required this.top,
    required this.bottom,
    required this.right,
    required this.left,
  });

  final _RadiusSide all;
  final _RadiusSide top;
  final _RadiusSide bottom;
  final _RadiusSide right;
  final _RadiusSide left;

  static const standard = _Radius(
    all: _RadiusSide.all,
    top: _RadiusSide.top,
    bottom: _RadiusSide.bottom,
    right: _RadiusSide.right,
    left: _RadiusSide.left,
  );
}

class _RadiusSide {
  const _RadiusSide({
    required this.none,
    required this.xs,
    required this.small,
    required this.medium,
    required this.large,
    required this.xl,
    required this.round,
  });

  final BorderRadius none;
  final BorderRadius xs;
  final BorderRadius small;
  final BorderRadius medium;
  final BorderRadius large;
  final BorderRadius xl;
  final BorderRadius round;

  static const all = _RadiusSide(
    none: BorderRadius.zero,
    xs: BorderRadius.all(Radius.circular(_extraSmall)),
    small: BorderRadius.all(Radius.circular(_small)),
    medium: BorderRadius.all(Radius.circular(_medium)),
    large: BorderRadius.all(Radius.circular(_large)),
    xl: BorderRadius.all(Radius.circular(_extraLarge)),
    round: BorderRadius.all(Radius.circular(_round)),
  );

  static const top = _RadiusSide(
    none: BorderRadius.zero,
    xs: BorderRadius.vertical(top: Radius.circular(_extraSmall)),
    small: BorderRadius.vertical(top: Radius.circular(_small)),
    medium: BorderRadius.vertical(top: Radius.circular(_medium)),
    large: BorderRadius.vertical(top: Radius.circular(_large)),
    xl: BorderRadius.vertical(top: Radius.circular(_extraLarge)),
    round: BorderRadius.vertical(top: Radius.circular(_round)),
  );

  static const bottom = _RadiusSide(
    none: BorderRadius.zero,
    xs: BorderRadius.vertical(bottom: Radius.circular(_extraSmall)),
    small: BorderRadius.vertical(bottom: Radius.circular(_small)),
    medium: BorderRadius.vertical(bottom: Radius.circular(_medium)),
    large: BorderRadius.vertical(bottom: Radius.circular(_large)),
    xl: BorderRadius.vertical(bottom: Radius.circular(_extraLarge)),
    round: BorderRadius.vertical(bottom: Radius.circular(_round)),
  );

  static const left = _RadiusSide(
    none: BorderRadius.zero,
    xs: BorderRadius.horizontal(left: Radius.circular(_extraSmall)),
    small: BorderRadius.horizontal(left: Radius.circular(_small)),
    medium: BorderRadius.horizontal(left: Radius.circular(_medium)),
    large: BorderRadius.horizontal(left: Radius.circular(_large)),
    xl: BorderRadius.horizontal(left: Radius.circular(_extraLarge)),
    round: BorderRadius.horizontal(left: Radius.circular(_round)),
  );

  static const right = _RadiusSide(
    none: BorderRadius.zero,
    xs: BorderRadius.horizontal(right: Radius.circular(_extraSmall)),
    small: BorderRadius.horizontal(right: Radius.circular(_small)),
    medium: BorderRadius.horizontal(right: Radius.circular(_medium)),
    large: BorderRadius.horizontal(right: Radius.circular(_large)),
    xl: BorderRadius.horizontal(right: Radius.circular(_extraLarge)),
    round: BorderRadius.horizontal(right: Radius.circular(_round)),
  );
}

const radius = _Radius.standard;
