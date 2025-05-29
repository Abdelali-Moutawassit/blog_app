import 'package:blog_app/core/connection/network_info.dart';
import 'package:blog_app/core/databases/api/dio_consumer.dart';
import 'package:blog_app/features/Music/presentation/screens/music_screen.dart';
import 'package:blog_app/features/PostTest/data/datasources/remote_datasource.dart';
import 'package:blog_app/features/PostTest/data/repositories/post_repository_impl.dart';
import 'package:blog_app/features/PostTest/domain/usecases/add_comment.dart';
import 'package:blog_app/features/PostTest/presentation/cubit/add_comment_cubit.dart';
import 'package:blog_app/features/PostTest/presentation/cubit/add_comment_state.dart';
import 'package:blog_app/features/PostTest/presentation/widgets/build_post_card_nv.dart';
import 'package:blog_app/features/PostTest/domain/entities/post_entity.dart';
import 'package:blog_app/features/PostTest/presentation/widgets/styled_icon_button.dart';
import 'package:blog_app/features/Profile/presentation/screens/profile_screen.dart';
import 'package:blog_app/pagesFake/notification_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class PostDetailScreen extends StatelessWidget {
  final PostEntity post;
  const PostDetailScreen({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    final TextEditingController commentController = TextEditingController();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => AddCommentCubit(
          addCommentUseCase: AddCommentToPostUseCase(
            PostRepositoryImpl(
              networkInfo: NetworkInfoImpl(InternetConnectionChecker.instance),
              remoteDatasource: RemoteDatasource(api: DioConsumer(dio: Dio())),
            ),
          ),
        ),
        child: Builder(builder: (context) {
          final commentCubit = context.read<AddCommentCubit>();

          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const ProfileScreen()),
                      );
                    },
                    child: const CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://media.istockphoto.com/id/527343577/photo/looking-for-inspiration.jpg?s=612x612&w=0&k=20&c=ck3lswRHkRpvxurShBPaRj5dvieSo1N0ZPqXA4XdOnk=',
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Column(
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
                  icon: const Icon(Icons.search, color: Colors.black),
                  onPressed: () {},
                ),
                styledIconButton(
                  iconAsset: 'assets/images/mus.png',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const MusicScreen()),
                    );
                  },
                  count: 5,
                ),
                styledIconButton(
                  iconAsset: 'assets/images/not.png',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => NotificationPage()),
                    );
                  },
                  count: 3,
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: buildPostCard(
                userName: post.userName,
                userImageUrl: post.profileImageUrl,
                postImageUrl: post.imageUrl,
                postDate: post.createdAt,
                comments: post.comments,
              ),
            ),
            bottomNavigationBar: SafeArea(
              child: BlocConsumer<AddCommentCubit, AddCommentState>(
                listener: (context, state) {
                  if (state is AddCommentSuccess) {
                    commentController.clear();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Commentaire ajouté !")),
                    );
                  } else if (state is AddCommentFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.message)),
                    );
                  }
                },
                builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 16,
                          backgroundImage: NetworkImage(
                            'https://randomuser.me/api/portraits/men/70.jpg',
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            controller: commentController,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 12,
                              ),
                              hintText: 'Ajouter un commentaire...',
                              filled: true,
                              fillColor: Colors.grey[100],
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        state is AddCommentLoading
                            ? const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(strokeWidth: 2),
                                ),
                              )
                            : IconButton(
                                icon: const Icon(Icons.send, size: 20),
                                onPressed: () {
                                  final comment = commentController.text.trim();
                                  if (comment.isNotEmpty) {
                                    commentCubit.addAddComment(
                                      postId: post.id,
                                      userId: 1, // remplacer par l'ID réel de l'utilisateur connecté
                                      content: comment,
                                    );
                                  }
                                },
                              ),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        }),
      ),
    );
  }
}
