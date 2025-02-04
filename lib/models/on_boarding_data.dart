import 'package:evently_app/core/constants/app_assets.dart';

class OnBoardingData{
  String img;
  String title;
  String details;

  OnBoardingData({
    required this.img,
    required this.title,
    required this.details,
  });
}

List<OnBoardingData> onBoardingList=[
  OnBoardingData(
      img: AppAssets.onBoarding2,
      title: "Find Events That Inspire You",
      details:"Dive into a world of events crafted to fit your unique interests. Whether you're into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.",
  ),
  OnBoardingData(
      img: AppAssets.onBoarding3,
      title: "Effortless Event Planning",
      details: "Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.",
  ),
  OnBoardingData(
      img: AppAssets.onBoarding4 ,
      title: "Connect with Friends & Share Moments",
      details: "Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.",
  ),
];
