import 'package:flutter/material.dart';
import 'package:graduation_project/feature/RecommendationSystem/presentation/widgets/InterestWidget.dart';

class Pagetowcontent extends StatelessWidget {
  const Pagetowcontent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Interestwidget(
          text: "Design the CTA",
        ),
        Interestwidget(
          text: "Database Administrator",
        ),
        Interestwidget(
          text: "Hardware Engineer",
        ),
        Interestwidget(
          text: "Application Support Engineer",
        ),
        Interestwidget(
          text: "Cyber Security Specialist",
        ),
        Interestwidget(
          text: "Networking Engineer",
        ),
        Interestwidget(
          text: "Software Developer",
        ),
        Interestwidget(
          text: "API Specialist",
        ),
        Interestwidget(
          text: "Project Manager",
        ),
        Interestwidget(
          text: "Graphics Designer",
        ),
        Interestwidget(
          text: "Helpdesk Engineer",
        ),
        Interestwidget(
          text: "Data Scientist",
        ),
        Interestwidget(
          text: "Customer Service Executive",
        ),
        Interestwidget(
          text: "Business Analyst",
        ),
        Interestwidget(
          text: "Software tester",
        ),
        Interestwidget(
          text: "AI ML Specialist",
        ),
        Interestwidget(
          text: "Technical Writer",
        ),
        Interestwidget(
          text: "Information Security Specialist",
        ),
      ],
    );
  }
}
