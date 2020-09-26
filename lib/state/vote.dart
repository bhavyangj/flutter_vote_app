import "package:flutter/material.dart";
import "package:flutter_vote_app/models/vote.dart";
import 'package:flutter_vote_app/services/services.dart';

class VoteState with ChangeNotifier {
  List<Vote> _voteList;
  Vote _activeVote;
  String _selectedOptionInActiveVote;

  void loadVoteList(BuildContext context) async {
    // _voteList =  getVoteList();
    getVoteListFromFirestore(context);
  }

  void clearState() {
    _voteList = null;
    _activeVote = null;
    _selectedOptionInActiveVote = null;
  }

  List<Vote> get voteList => _voteList;
  set voteList(newValue) {
    _voteList = newValue;
    notifyListeners();
  }

  Vote get activeVote => _activeVote;
  String get selectedOptionInActiveVote => _selectedOptionInActiveVote;

  set activeVote(newValue) {
    _activeVote = newValue;
    notifyListeners();
  }

  set selectedOptionInActiveVote(String newValue) {
    _selectedOptionInActiveVote = newValue;
    notifyListeners();
  }
}