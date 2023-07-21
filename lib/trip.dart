import 'package:flutter/material.dart';

enum Season { Winter, Spring, Summer, Autumn }

enum TripType {
  Exploration,
  Recovery,
  Activities,
  Therapy,
}

class Trip {
  final id;
  final List<String> categories;
  final title;
  final imageUrl;
  final List<String> activities;
  final List<String> program;
  final duration;
  final Season season;
  final TripType triptype;
  final isInSummer;
  final isInWinter;
  final isForFamilies;

  const Trip(
    this.id,
    this.categories,
    this.title,
    this.triptype,
    this.season,
    this.imageUrl,
    this.duration,
    this.activities,
    this.program,
    this.isInSummer,
    this.isForFamilies,
    this.isInWinter,
  );
}
