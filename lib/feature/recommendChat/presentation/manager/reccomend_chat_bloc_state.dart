abstract class ReccomendChatBlocState {}

class Initrecommendstate extends ReccomendChatBlocState {}

class Loading extends ReccomendChatBlocState {}

class SuccessRoadmapstate extends ReccomendChatBlocState {
  final int Roadmapindex;

  SuccessRoadmapstate({required this.Roadmapindex});
}

class Failuer extends ReccomendChatBlocState {}

class clearstate extends ReccomendChatBlocState {}

class scrollstate extends ReccomendChatBlocState {}
