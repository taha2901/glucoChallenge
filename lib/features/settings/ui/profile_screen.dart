import 'package:challenge/core/helpers/extentions.dart';
import 'package:challenge/core/helpers/shared_pref_helper.dart';
import 'package:challenge/core/helpers/spacing.dart';
import 'package:challenge/core/networking/dio_factory.dart';
import 'package:challenge/core/routings/routers.dart';
import 'package:challenge/core/theming/colors.dart';
import 'package:challenge/features/settings/logic/profile_cubit.dart';
import 'package:challenge/features/settings/logic/profile_state.dart';
import 'package:challenge/features/settings/ui/widgets/card_user_data.dart';
import 'package:challenge/features/settings/ui/widgets/profile_user_data_shimmer_laoding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Iconsax.arrow_right),
              color: Colors.blue,
            ),
            backgroundColor: Colors.transparent,
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    verticalSpace(16.0),
                    state is ProfileLoading
                        ? const ShimmerCardOfUserData()
                        : const CardOfUserData(),
                    verticalSpace(16.0),
                    _buildListTile(
                      onPressed: () {
                        context.pushNamed(Routers.myMedicalRecord);
                      },
                      leading: const Icon(
                        Iconsax.document,
                        color: Colors.blue,
                      ),
                      context,
                      "سحلاتي الطبيه",
                      // Routers.changePassword,
                    ),
                    _buildListTile(
                      leading: const Icon(
                        Iconsax.element_plus,
                        color: Colors.blue,
                      ),
                      context,
                      "اضافه اشخاص للمتابعه",
                      // Routers.changePassword,
                    ),
                    _buildListTile(
                      onPressed: () => context.pushNamed(Routers.favourite),
                      leading: const Icon(
                        Icons.favorite_outline_outlined,
                        color: Colors.blue,
                      ),
                      context,
                      "المفضله",
                      // Routers.changePassword,
                    ),
                    _buildListTile(
                      leading: const Icon(
                        Iconsax.user,
                        color: Colors.blue,
                      ),
                      context,
                      "تعديل الملف الشخصى",
                      onPressed: () {
                        context.pushNamed(Routers.updateProfile);
                      },
                    ),
                    verticalSpace(16.0),
                    _buildLogoutTile(context),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildListTile(BuildContext context, String title,
      {String? route, VoidCallback? onPressed, Widget? leading}) {
    return Card(
      color: ColorsManager.kPrimaryLightColor,
      child: ListTile(
        leading: leading,
        title: Text(title),
        onTap: () {
          if (route != null) {
            context.pushNamed(route);
          }
        },
        trailing: IconButton(
          onPressed: onPressed,
          icon: const Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }

  Widget _buildLogoutTile(BuildContext context) {
    return Card(
      color: Colors.red,
      child: ListTile(
        leading: const Icon(Icons.logout, color: Colors.white),
        title: const Text(
          "Logout",
          style: TextStyle(color: Colors.white),
        ),
        onTap: () async {
          await SharedPrefHelper.clearAllData();
          await SharedPrefHelper.clearAllSecuredData();

          DioFactory.setTokenIntoHeaderAfterLogin(null.toString());

          Navigator.pushNamedAndRemoveUntil(
              context, Routers.login, (route) => false);
        },
      ),
    );
  }
}
