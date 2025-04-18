import 'package:graduation_project/feature/RecommendationSystem/data/models/JobRecommendation.dart';

abstract class Recommendationsystemstate {}

class Init extends Recommendationsystemstate {}

class recommendLoading extends Recommendationsystemstate {}

class recommendFailuer extends Recommendationsystemstate {}

class recommendSuccess extends Recommendationsystemstate {
  List<JobRecommendation> jops;
  recommendSuccess({required this.jops});
}
