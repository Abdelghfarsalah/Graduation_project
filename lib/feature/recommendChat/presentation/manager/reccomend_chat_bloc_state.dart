abstract class ReccomendChatBlocState {}

class Initrecommendstate extends ReccomendChatBlocState {}

class Loading extends ReccomendChatBlocState {}

class SuccessRoadmapstate extends ReccomendChatBlocState {
  final int Roadmapindex;

  SuccessRoadmapstate({required this.Roadmapindex});
}

class Failuer extends ReccomendChatBlocState {
  final String message;
  final String userMessage;

  Failuer({required this.message, required this.userMessage});
}

class clearstate extends ReccomendChatBlocState {}

class scrollstate extends ReccomendChatBlocState {}

class ErorrState extends ReccomendChatBlocState {}
