import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_app/ui/main/challenge/viewmodel/challenge_detail_view_model.dart';
import 'package:project_app/ui/main/challenge/widgets/challenge_action_button.dart';
import 'package:project_app/ui/main/challenge/widgets/challenge_content.dart';

class ChallengeDetailPage extends ConsumerWidget {
  final challengeId;

  const ChallengeDetailPage({Key? key, required this.challengeId})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ChallengeDetailModel? challenge =
        ref.watch(challengeDetailProvider(challengeId));

    if (challenge == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text(challenge!.challengeDetailDTO.challengeName),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.memory(
                  base64Decode(challenge!.challengeDetailDTO.backgroundImg),
                  fit: BoxFit.cover),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: ChallengeContent(
                  name: challenge!.challengeDetailDTO.challengeName,
                  subtitle: challenge!.challengeDetailDTO.subtitle,
                  walking: challenge!.challengeDetailDTO.walking,
                  content: challenge!.challengeDetailDTO.content,
                ),
              ),
              ChallengeActionButton(
                status: challenge!.challengeDetailDTO.state,
                challengeId: challenge!.challengeDetailDTO.id,
              ),
            ],
          ),
        ),
      );
    }
  }
}
