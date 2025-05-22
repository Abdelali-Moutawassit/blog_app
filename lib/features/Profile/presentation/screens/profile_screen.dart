import 'package:blog_app/features/Profile/presentation/cubit/profile_cubit.dart';
import 'package:blog_app/features/Profile/presentation/widgets/followers_profile.dart';
import 'package:blog_app/features/Profile/presentation/widgets/images_profile.dart';
import 'package:blog_app/features/Profile/presentation/widgets/info_profile.dart';
import 'package:blog_app/features/Profile/presentation/widgets/navigation_profile.dart';
import 'package:blog_app/features/Profile/presentation/widgets/videos_profile.dart';
import 'package:flutter/material.dart';
import 'package:blog_app/features/Profile/presentation/widgets/couverture_profile_widget.dart';
import 'package:blog_app/features/Profile/presentation/widgets/info_utilisateur_widget.dart';
import 'package:blog_app/features/Profile/presentation/widgets/list_posts_profile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int selectedIndex = 0;

  final List<String> tabs = ['Posts', 'Images', 'Videos', 'Followers', 'Info'];

  Widget getSelectedWidget() {
    switch (selectedIndex) {
      case 0:
        return listPostsProfile();
      case 1:
        return imagesProfile();
      case 2:
        return videosProfile();
      case 3:
        return followersProfile();
      case 4:
        return infoProfile(
          name: 'Yasmine B.',
          imageUrl: 'https://randomuser.me/api/portraits/women/12.jpg',
          bio: 'Passionnée par la photographie et les voyages.',
          isFollowing: true,
          onFollowPressed: () {},
          onMessagePressed: () {},
        );
      default:
        return listPostsProfile();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) => ProfileCubit()..eitherFailureOrProfile(),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ProfileFailure) {
            return Center(child: Text('Erreur: ${state.failureMessage}'));
          } else if (state is ProfileLoaded) {
            return Scaffold(
              body: CustomScrollView(
                slivers: [
                  couvertureProfileWidget(context, screenHeight, screenWidth),
                  SliverToBoxAdapter(
                    child: SizedBox(height: screenWidth * 0.01),
                  ),
                  infoUtilisateurWidget(
                    screenWidth,
                    username: state.profileEntity.username,
                  ),
                  navigationProfile(
                    selectedIndex: selectedIndex,
                    onTabSelected: (index) {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: getSelectedWidget(),
                    ),
                  ),
                ],
              ),
            );
          }

          // ce
          return Scaffold(body: Center(child: Text('État inconnu')));
        },
      ),
    );
  }
}
