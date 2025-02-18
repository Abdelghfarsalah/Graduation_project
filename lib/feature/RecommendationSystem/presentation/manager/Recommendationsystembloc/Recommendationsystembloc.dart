import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/feature/RecommendationSystem/presentation/manager/Recommendationsystembloc/RecommendationsystemState.dart';
import 'package:graduation_project/feature/RecommendationSystem/presentation/manager/Recommendationsystembloc/Recommendationsystemevent.dart';

class Recommendationsystembloc
    extends Bloc<RecommendationsystemEvent, Recommendationsystemstate> {
  Recommendationsystembloc() : super(Init());
  Map<String, String> rates = {
    'Database Fundamental': 'Excellent',
    'Forensics Fundamental': 'Excellent',
    'Computer Architecture': 'Excellent',
    'Technical Communication': 'Excellent',
    'Distributed Computed Systems': 'Excellent',
    'AI Machine Learning': 'Excellent',
    'Cyber Security': 'Excellent',
    'Computer Networks': 'Excellent',
    'Software Engineering': 'Excellent',
    'Business Analysis': 'Excellent',
    'Software Development': 'Excellent',
    'Data Science': 'Excellent',
    'Programming Skills': 'Excellent',
  };

  Map<String, bool> Interest = {
    "Design the CTA": false,
    "Database Administrator": false,
    "Hardware Engineer": false,
    "Application Support Engineer": false,
    "Cyber Security Specialist": false,
    "Networking Engineer": false,
    "Software Developer": false,
    "API Specialist": false,
    "Project Manager": false,
    "Graphics Designer": false,
    "Helpdesk Engineer": false,
    "Data Scientist": false,
    "Customer Service Executive": false,
    "Business Analyst": false,
    "Software tester": false,
    "AI ML Specialist": false,
    "Technical Writer": false,
    "Information Security Specialist": false
  };

  void ChangeValuerate(String key, String value) {
    rates[key] = value;
  }

  void ChangeValueInterest(String key, bool value) {
    Interest[key] = value;
  }

  void printmap() {
    rates.forEach((key, value) {
      print('$key: $value');
    });
  }

  void printmapin() {
    Interest.forEach((key, value) {
      print('$key: $value');
    });
  }
}
