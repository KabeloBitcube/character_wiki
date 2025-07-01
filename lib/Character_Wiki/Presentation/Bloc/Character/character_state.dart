// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'character_bloc.dart';

abstract class CharacterState extends Equatable {
  const CharacterState();
  
  @override
  List<Object?> get props => [];
}

class CharacterInitial extends CharacterState {}

class CharacterLoading extends CharacterState {}

class CharacterLoaded extends CharacterState {
  final List<Character> characters;

  const CharacterLoaded({
    required this.characters,
  });

  @override
  List<Object?> get props => [characters];
}

class CharacterError extends CharacterState {
  final String message;

  const CharacterError(this.message);

  @override
  List<Object?> get props => [message];
}