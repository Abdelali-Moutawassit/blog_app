import 'package:blog_app/core/connection/network_info.dart';
import 'package:blog_app/core/databases/api/dio_consumer.dart';
import 'package:blog_app/features/PostTest/data/datasources/remote_datasource.dart';
import 'package:blog_app/features/PostTest/data/repositories/post_repository_impl.dart';
import 'package:blog_app/features/PostTest/domain/usecases/add_reaction.dart';
import 'package:blog_app/features/PostTest/presentation/cubit/reaction_cubit.dart';
import 'package:blog_app/features/PostTest/presentation/screens/post_design_widget.dart';
import 'package:blog_app/features/PostTest/presentation/cubit/post_cubit.dart';
import 'package:blog_app/features/PostTest/presentation/screens/create_post_card.dart';
import 'package:blog_app/features/Post/presentation/widgets/build_reels_section.dart';
import 'package:blog_app/features/Post/presentation/widgets/user_avatars.dart';
import 'package:blog_app/features/PostTest/presentation/widgets/styled_icon_button.dart';
import 'package:blog_app/features/Profile/presentation/screens/profile_screen.dart';
import 'package:blog_app/pagesFake/notification_page.dart';
import 'package:blog_app/utils/annimations.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:blog_app/features/Music/presentation/screens/music_screen.dart';

class HomeDesign extends StatelessWidget {
  final List<String> stories = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBZjmRd6fUkEG7W_2s8gqD8y6W8qqPiAur-g&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBZjmRd6fUkEG7W_2s8gqD8y6W8qqPiAur-g&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBZjmRd6fUkEG7W_2s8gqD8y6W8qqPiAur-g&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBZjmRd6fUkEG7W_2s8gqD8y6W8qqPiAur-g&s',
  ];

  final List<String> storyNames = ['Fernanda', 'James', 'Estefania', 'Fan'];

  HomeDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostCubit()..eitherFailureOrPosts(),
      child: BlocBuilder<PostCubit, PostState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Color(0xFFF9F9F9),
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfileScreen(),
                        ),
                      );
                    },
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://media.istockphoto.com/id/527343577/photo/looking-for-inspiration.jpg?s=612x612&w=0&k=20&c=ck3lswRHkRpvxurShBPaRj5dvieSo1N0ZPqXA4XdOnk=',
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "James Adams",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "@james_adams",
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.search, color: Colors.black),
                  onPressed: () {},
                ),
                styledIconButton(
                  iconAsset: 'assets/images/mus.png',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MusicScreen(),
                      ),
                    );
                  },
                  count: 5,
                ),
                styledIconButton(
                  iconAsset: 'assets/images/not.png',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NotificationPage(),
                      ),
                    );
                  },
                  count: 3,
                ),
              ],
            ),
            body: Builder(
              builder: (context) {
                if (state is PostLoading) {
                  return Center(
                    child: SizedBox(
                      height: 60,
                      width: 60,
                      child: loadAnnimation(),
                    ),
                  );
                } else if (state is PostFailure) {
                  return Center(
                    child: noInternetAnnimation(),
                  );
                } else if (state is PostLoaded) {
                  final posts = (state).posts;
                  return ListView(
                    padding: EdgeInsets.all(16),
                    children: [
                      UserAvatars(),
                      SizedBox(height: 5),
                      CreatePostCard(
                        profileImageUrl:
                            'https://media.istockphoto.com/id/527343577/photo/looking-for-inspiration.jpg?s=612x612&w=0&k=20&c=ck3lswRHkRpvxurShBPaRj5dvieSo1N0ZPqXA4XdOnk=',
                      ),
                      SizedBox(height: 20),
                      buildReelsSection(),
                      SizedBox(height: 20),
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: posts.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: BlocProvider(
                              create:
                                  (context) => ReactionCubit(
                                    addReactionUseCase:
                                        AddReactionToPostUseCase(
                                          PostRepositoryImpl(
                                            networkInfo: NetworkInfoImpl(
                                              InternetConnectionChecker
                                                  .instance,
                                            ),
                                            remoteDatasource: RemoteDatasource(
                                              api: DioConsumer(dio: Dio()),
                                            ),
                                          ),
                                        ),
                                  ),
                              child: postWidget(posts[index], context),
                            ),
                          );
                        },
                      ),
                    ],
                  );
                } else {
                  return Center(child: Text("Unknown state"));
                }
              },
            ),
          );
        },
      ),
    );
  }
}
