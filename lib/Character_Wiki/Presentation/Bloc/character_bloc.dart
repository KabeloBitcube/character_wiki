// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:character_wiki/Character_Wiki/Domain/character.dart';
import 'package:character_wiki/Character_Wiki/Domain/get_characters.dart';
import 'package:equatable/equatable.dart';
part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final GetCharacters getCharacters;

  CharacterBloc(this.getCharacters) : super(CharacterInitial()) {
    on<FetchCharacters>((event, emit) async {
      emit(CharacterLoading());
      try {
        final characters = await getCharacters(
          name: event.name,
          status: event.status,
          species: event.species,
          gender: event.gender
        );
        emit(CharacterLoaded(characters: characters));
      } catch (e) {
        emit(CharacterError(e.toString()));
      }
    });
  }
}
