class JobRecommendation {
  final String job;

  JobRecommendation({required this.job});

  factory JobRecommendation.fromJson(Map<String, dynamic> json) {
    return JobRecommendation(
      job: json['job'],
    );
  }
}
