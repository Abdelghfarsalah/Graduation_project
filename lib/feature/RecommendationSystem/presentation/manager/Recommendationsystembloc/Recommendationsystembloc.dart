import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/feature/RecommendationSystem/data/datasources/recommendDatasources.dart';
import 'package:graduation_project/feature/RecommendationSystem/presentation/manager/Recommendationsystembloc/RecommendationsystemState.dart';
import 'package:graduation_project/feature/RecommendationSystem/presentation/manager/Recommendationsystembloc/Recommendationsystemevent.dart';

class Recommendationsystembloc
    extends Bloc<RecommendationsystemEvent, Recommendationsystemstate> {
  Recommendationsystembloc() : super(Init()) {
    on<recommendEvent>(_recommend);
  }
  Recommenddatasources recommenddatasources = Recommenddatasources(dio: Dio());
  Map<String, dynamic> rates = {
    'Computer Architecture': 'Excellent',
    'Leadership Experience': 'Excellent',
    'Cyber Security': 'Excellent',
    'Networking': 'Excellent',
    'Software Development': 'Excellent',
    'Programming Skills': 'Excellent',
    'Project Management': 'Excellent',
    'Forensics Fundamentals': 'Excellent',
    'Technical Communication': 'Excellent',
    'AI_ML': 'Excellent',
    'Software Engineering': 'Excellent',
    'Business Analysis': 'Excellent',
    'Database Fundamentals': 'Excellent',
    'Communication Skills': 'Excellent',
    'Data Science': 'Excellent',
    'Troubleshooting Skills': 'Excellent',
    'Graphics Designing': 'Excellent',
    "top_n": 3
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

  Future<void> _recommend(
      recommendEvent event, Emitter<Recommendationsystemstate> emit) async {
    try {
      emit(recommendLoading());

      Map<String, dynamic> requestData = {
        "Database_Fundamentals": event.data['Database Fundamentals'],
        "Computer_Architecture": event.data['Computer Architecture'],
        "Leadership_Experience": event.data['Leadership Experience'],
        "Cyber_Security": event.data['Cyber Security'],
        "Networking": event.data['Networking'],
        "Software_Development": event.data['Software Development'],
        "Programming_Skills": event.data['Programming Skills'],
        "Project_Management": event.data['Project Management'],
        "Computer_Forensics_Fundamentals": event.data['Forensics Fundamentals'],
        "Technical_Communication": event.data['Technical Communication'],
        "AI_ML": event.data['AI_ML'],
        "Software_Engineering": event.data['Software Engineering'],
        "Business_Analysis": event.data['Business Analysis'],
        "Communication_Skills": event.data['Communication Skills'],
        "Data_Science": event.data['Data Science'],
        "Troubleshooting_Skills": event.data['Troubleshooting Skills'],
        "Graphics_Designing": event.data['Graphics Designing'],
        "top_n": 3,
      };

      var response = await recommenddatasources.recommend(requestData);
      response.fold((l) {}, (r) {
        emit(recommendSuccess(jops: r));
      });
    } catch (e, stacktrace) {
      print("Error: $e");
      print("Stacktrace: $stacktrace");
      emit(recommendFailuer());
    }
  }

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
