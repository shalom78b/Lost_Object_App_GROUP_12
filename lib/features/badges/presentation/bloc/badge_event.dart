part of 'badge_bloc.dart';

@freezed
class BadgeEvent with _$BadgeEvent {
  const factory BadgeEvent.badgeCreated() = _BadgeCreated;
  const factory BadgeEvent.newsRead() = _NewsRead;
  const factory BadgeEvent.receivedClaimRead() = _ReceivedClaimRead;
  const factory BadgeEvent.newNews() = _NewNews;
  const factory BadgeEvent.newReceivedClaim() = _NewReceivedClaim;
  const factory BadgeEvent.sentClaimUpdate() = _SentClaimUpdate;
  const factory BadgeEvent.sentClaimRead() = _SentClaimRead;
  const factory BadgeEvent.chatUpdate(bool hasUnreadChats) = _ChatUpdate;
  const factory BadgeEvent.restoreInitial() = _RestoreInitial;
}