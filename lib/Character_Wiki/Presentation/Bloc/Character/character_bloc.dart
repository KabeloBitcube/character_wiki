// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:character_wiki/Character_Wiki/Domain/Character/Entities/character.dart';
import 'package:character_wiki/Character_Wiki/Domain/Character/UseCase/get_characters.dart';
import 'package:equatable/equatable.dart';
part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final GetCharacters getCharacters;

  CharacterBloc(this.getCharacters) : super(CharacterInitial()) {
    on<FetchCharacters>((event, emit) async {
      emit(CharacterLoading());
      try {
        final characters = await getCharacters();
        emit(CharacterLoaded(characters: characters));
      } catch (e) {
        emit(CharacterError(e.toString()));
      }
    });

    on<SearchCharacters>((event, emit) async {
      emit(CharacterLoading());
      try {
        final characters = await getCharacters();
        final filtered = characters
            .where(
              (searchQuery) => searchQuery.name.toLowerCase().contains(
                event.searchQuery.toLowerCase(),
              ),
            )
            .toList();

        emit(CharacterLoaded(characters: filtered));
      } catch (e) {
        emit(CharacterError(e.toString()));
      }
    });

    on<FilterCharacters>((event, emit) async {
      emit(CharacterLoading());
      try {
        final characters = await getCharacters();
        final filtered = characters.where((filter) {
          final statusFilter = event.status == null || filter.status == event.status;
          final speciesFilter = event.species == null || filter.species == event.species;
          final genderFilter = event.gender == null || filter.gender == event.gender;

          return statusFilter && speciesFilter && genderFilter;
        }).toList();

        emit(CharacterLoaded(characters: filtered));
      } catch (e) {
        emit(CharacterError(e.toString()));
      }
    });
  }
}
