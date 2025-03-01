part of 'answer_question_bloc.dart';

@freezed
class AnswerQuestionEvent with _$AnswerQuestionEvent {
  const factory AnswerQuestionEvent.contentCreated(int itemId) = _ContentCreated;
  const factory AnswerQuestionEvent.answerFieldChanged(String answer) = _AnswerFieldChanged;
  const factory AnswerQuestionEvent.claimCreated() = _ClaimCreated;
  const factory AnswerQuestionEvent.createChatRoom(int id, String username) = _CreateChatRoom;
}