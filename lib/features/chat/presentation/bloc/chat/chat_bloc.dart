import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lost_and_found/features/chat/domain/usecases/get_room_messages_usecase.dart';
import 'package:lost_and_found/features/chat/domain/usecases/read_chat_usecase.dart';
import 'package:lost_and_found/features/chat/domain/usecases/send_message_usecase.dart';
import 'package:lost_and_found/features/item/domain/usecases/get_item_usecase.dart';

import '../../../../../core/data/secure_storage/secure_storage.dart';
import '../../../../item/domain/entities/item.dart';

part 'chat_bloc.freezed.dart';

part 'chat_event.dart';

part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final GetRoomMessagesUseCase _getRoomMessagesUseCase;
  final GetItemUseCase _getItemUseCase;
  final SendMessageUseCase _sendMessageUseCase;
  final ReadChatUseCase _readChatUseCase;

  final SecureStorage _storage;

  ChatBloc(
      {required GetRoomMessagesUseCase getRoomMessagesUseCase,
      required GetItemUseCase getItemUseCase,
      required SendMessageUseCase sendMessageUseCase,
      required ReadChatUseCase readChatUseCase,
      required SecureStorage storage})
      : _getRoomMessagesUseCase = getRoomMessagesUseCase,
        _getItemUseCase = getItemUseCase,
        _sendMessageUseCase = sendMessageUseCase,
        _readChatUseCase = readChatUseCase,
        _storage = storage,
        super(ChatState.initial()) {
    on<ChatEvent>(
      (event, emit) async {
        await event.when<FutureOr<void>>(
          chatContentCreated: (roomId, itemId) => _onInboxContentCreated(emit, roomId, itemId),
          messageSent: (message) => _onMessageSent(message),
          chatRead: () => _onChatRead(),
        );
      },
    );
  }

  Future<void> _onChatRead() async {
    final userId = (state.room!.metadata!["username1"] == state.currentUsername
        ? state.room!.metadata!["id1"]!
        : state.room!.metadata!["id2"]!) as int;

    await _readChatUseCase(ReadChatParams(currentId: userId, roomId: state.room!.id));
  }

  Future<void> _onMessageSent(PartialText message) async {
    final userId = (state.room!.metadata!["username1"] == state.currentUsername
        ? state.room!.metadata!["id1"]!
        : state.room!.metadata!["id2"]!) as int;

    final otherUserId = (state.room!.metadata!["username1"]! != state.currentUsername
        ? state.room!.metadata!["id1"]!
        : state.room!.metadata!["id2"]!) as int;

    await _sendMessageUseCase(SendMessageParams(
      message: message,
      roomId: state.room!.id,
      receiverId: otherUserId,
      itemId: state.item!.id,
      senderId: userId,
    ));
  }

  Future<void> _onInboxContentCreated(Emitter<ChatState> emit, roomId, itemId) async {
    emit(state.copyWith(isLoading: true));

    final messagesResponse = await _getRoomMessagesUseCase(GetRoomMessagesParams(roomId: roomId));
    final itemResponse = await _getItemUseCase(GetItemParams(id: itemId));
    final session = await _storage.getSessionInformation();

    Room? room;
    Stream<List<Message>> messages = const Stream.empty();

    messagesResponse.fold((_) {}, (pair) {
      room = pair.first;
      messages = pair.second;
    });

    emit(
      state.copyWith(
          isLoading: false,
          messages: messages,
          room: room,
          hasLoadingError: messagesResponse.isLeft() || itemResponse.isLeft(),
          token: session?.token ?? "",
          currentUsername: session?.username,
          item: itemResponse.fold((_) => null, (item) => item)),
    );
  }
}
