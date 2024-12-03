import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raseeni/model/appStyle.dart';

import '../controller/auth_controller.dart';
import '../controller/image_pick_contoller.dart';
import '../controller/profile_controller.dart';
import 'doneCourses.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double width = size.width;
    final double height = size.height;

    final _profileController = Provider.of<ProfileController>(context);
    final _imageController = Provider.of<ProfileImageController>(context);
    final _authController = Provider.of<AuthController>(context);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            _buildTopBar(height, width),
            _buildProfileContent(context, _authController, _profileController,
                _imageController, width, height),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar(double height, double width) {
    return Container(
      width: double.infinity,
      height: height * 0.11,
      decoration: BoxDecoration(
        color: AppStyles.blueColor,
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset(AppStyles.logoWithoutBackground),
          ),
          Positioned(
            right: 16,
            top: 16,
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                AppStyles.notificationNone,
                color: AppStyles.whiteColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileContent(
      BuildContext context,
      AuthController _authController,
      ProfileController _profileController,
      ProfileImageController _imageController,
      double width,
      double height) {
    return Align(
      child: Container(
        height: height * 0.79,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppStyles.whiteColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35), topRight: Radius.circular(35)),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.03),
          child: Column(
            children: [
              SizedBox(height: height * 0.02),
              _buildProfilePicture(_imageController, width, _profileController),
              _buildProfileInfo(
                  context, _authController, _profileController, width),
              SizedBox(height: height * 0.02),
              _buildQuoteCard(width, height),
              SizedBox(height: height * 0.02),
              _buildActionButtons(context, width, height),
              SizedBox(height: height * 0.02),
              _buildSocialMediaLinks(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileInfo(BuildContext context, AuthController _authController,
      ProfileController _profileController, double width) {
    return Padding(
      padding: EdgeInsets.only(left: 25, top: 10),
      child: Row(
        children: [
          Icon(AppStyles.badge, size: 40, color: AppStyles.blueColor),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Ahlan,', style: AppStyles.bold20(AppStyles.blackColor)),
              SizedBox(
                width: width * 0.6,
                child: Text(
                  "${_profileController.firstName} ${_profileController.lastName}",
                  style: AppStyles.regular20(AppStyles.blackColor),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(right: width * .06),
            child: GestureDetector(
              onTap: () {
                _changeName(context, _authController, _profileController);
              },
              child: Icon(AppStyles.edit, color: AppStyles.blueColor),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildQuoteCard(double width, double height) {
    return Container(
      width: width * 0.9,
      decoration: BoxDecoration(
        color: AppStyles.blueColor,
        borderRadius: BorderRadius.circular(35),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: width * 0.05,
          top: height * 0.02,
          bottom: height * 0.02,
          right: width * 0.05,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text('‘‘', style: AppStyles.bold48(AppStyles.whiteColor)),
            ),
            SizedBox(
              width: width * 0.8,
              child: Text(
                'It takes courage to grow up and become who you really are.',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: AppStyles.medium20(AppStyles.whiteColor),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(',,', style: AppStyles.bold48(AppStyles.whiteColor)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons(
      BuildContext context, double width, double height) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildActionButton('Streak', '4', Icons.local_fire_department,
              AppStyles.orangeColor, width, height),
          SizedBox(width: width * 0.03),
          _buildActionButton('Done\nCourses', '1', AppStyles.done,
              AppStyles.greenColor, width, height, () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => DoneCourses()));
          }),
        ],
      ),
    );
  }

  Widget _buildActionButton(String label, String count, IconData icon,
      Color color, double width, double height,
      [VoidCallback? onTap]) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height * 0.1,
        width: width * 0.4,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(35),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(label, style: AppStyles.regular20(AppStyles.whiteColor)),
            Row(
              children: [
                Text(count, style: AppStyles.bold20(AppStyles.whiteColor)),
                Icon(icon, color: AppStyles.whiteColor),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialMediaLinks() {
    return Column(
      children: [
        SizedBox(height: 10),
        Text('Find Us On', style: AppStyles.regular16(AppStyles.blackColor)),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildSocialIcon('assets/images/social media/facebook.png'),
            _buildSocialIcon('assets/images/social media/instagram.png'),
            _buildSocialIcon('assets/images/social media/linkedin.png'),
            _buildSocialIcon('assets/images/social media/twitter.png'),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialIcon(String assetPath) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 40,
        height: 40,
        child: Image.asset(assetPath),
      ),
    );
  }

  void _changeName(
    BuildContext context,
    AuthController _authController,
    ProfileController _profileController,
  ) async {
    final firstNameController =
        TextEditingController(text: _profileController.firstName);
    final lastNameController =
        TextEditingController(text: _profileController.lastName);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Change Name'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: firstNameController,
                decoration: const InputDecoration(labelText: 'First Name'),
              ),
              TextField(
                controller: lastNameController,
                decoration: const InputDecoration(labelText: 'Last Name'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                final newFirstName = firstNameController.text.trim();
                final newLastName = lastNameController.text.trim();

                try {
                  await _authController.updateUserName(
                      _profileController, newFirstName, newLastName);
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Name updated successfully!')));
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Error updating name: $e')));
                }
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildProfilePicture(ProfileImageController _imageController,
      double width, ProfileController _profileController) {
    return Center(
      child: CircleAvatar(
        radius: width * 0.16,
        backgroundColor: AppStyles.indigoColor,
        child: CircleAvatar(
          radius: width * 0.15,
          backgroundColor: AppStyles.whiteColor,
          child: _imageController.profileImage == null
              ? IconButton(
                  onPressed: () async {
                    await _imageController.pickImage(_profileController);
                  },
                  icon: Icon(AppStyles.person,
                      color: AppStyles.indigoColor, size: width * 0.2),
                )
              : Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: FileImage(_profileController.profileImage!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child:
                          _buildEditIcon(_imageController, _profileController),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildEditIcon(ProfileImageController _imageController,
      ProfileController _profileController) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: const Color(0xff5063BF),
        borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(
        onPressed: () async {
          await _imageController.pickImage(_profileController);
        },
        icon: Icon(AppStyles.edit, color: AppStyles.whiteColor, size: 25),
      ),
    );
  }
}
