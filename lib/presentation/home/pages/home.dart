import 'package:flutter/material.dart';
import 'package:projects/common/helpers/is_dark_mode.dart';
import 'package:projects/common/widgets/appbar/app_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:projects/common/widgets/appbar/home_app_bar.dart';
import 'package:projects/core/configs/assets/app_images.dart';
import 'package:projects/core/configs/assets/app_vectors.dart';
import 'package:projects/core/configs/theme/app_colors.dart';
import 'package:projects/presentation/auth/pages/signin.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: HomeAppbar(
          leadingIcon: IconButton(
            onPressed: () {},
            icon: Container(
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                  color: context.isDarkMode
                      ? Colors.white.withOpacity(0.03)
                      : Colors.black.withOpacity(0.04),
                  shape: BoxShape.circle),
              child: SvgPicture.asset(AppVectors.searchIcon),
            ),
          ),
          title: SvgPicture.asset(
            AppVectors.logo,
            height: 40,
            width: 40,
          ),
          action: IconButton(
            onPressed: () {},
            icon: SizedBox(
              height: 18,
              width: 18,
              child: SvgPicture.asset(AppVectors.actionIcon),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [_homeArtistCard(), _tabs()],
          ),
        ));
  }

  Widget _homeArtistCard() {
    return Center(
      child: SizedBox(
        height: 188,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SvgPicture.asset(AppVectors.homeTopCard, width: 400),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                  padding: EdgeInsets.only(right: 60),
                  child: Image.asset(AppImages.homeArtist)),
            )
          ],
        ),
      ),
    );
  }

  Widget _tabs() {
    var radius = Radius.circular(10);

    return TabBar(
      controller: _tabController,
      isScrollable: true,
      labelColor: context.isDarkMode ? Colors.white : Colors.black,
      dividerColor: Colors.transparent,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(width: 4.0, color: AppColors.primary),
        insets: EdgeInsets.symmetric(horizontal: 12),
        borderRadius: BorderRadius.only(bottomLeft: radius, bottomRight: radius)
      ),
      tabs: const [
        Text(
          'News',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
        ),
        Text(
          'Videos',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
        ),
        Text(
          'Artists',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
        ),
        Text(
          'Podcasts',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
        ),
      ],
    );
  }
}