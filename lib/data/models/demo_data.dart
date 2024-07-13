import 'package:reddit_task/core/resources/app_assets.dart';
import 'package:reddit_task/data/models/data%20models/app_comment.dart';
import 'package:reddit_task/data/models/data%20models/video.dart';

class DemoData {
  static Video theVideo = Video(
    url: AppAssets.theVideo,
    publisherName: "Ahmed Magdy",
    title: "Very very very big machin",
    imageUrl:
        "https://scontent.fcai19-8.fna.fbcdn.net/v/t39.30808-1/367483493_2229963223877696_4114371885708192652_n.jpg?stp=dst-jpg_s480x480&_nc_cat=107&ccb=1-7&_nc_sid=50d2ac&_nc_eui2=AeHKKRz26SXv9fgl0D5mvcTWb2m4YDPCxzlvabhgM8LHORPSI5TLWja9I4uYQ2Lkc6R6XbqQeJXGr8wyo2vm5elf&_nc_ohc=ieu9Cb6D0qAQ7kNvgHzeMpK&_nc_ht=scontent.fcai19-8.fna&oh=00_AYA5aecxXjQj6KzTOlcVmmipTb0ooUJds-Sy_vqJ8ueo-w&oe=66973B29",
    comments: [
      AppComment(
        image:
            "https://scontent.fcai19-8.fna.fbcdn.net/v/t39.30808-1/367483493_2229963223877696_4114371885708192652_n.jpg?stp=dst-jpg_s480x480&_nc_cat=107&ccb=1-7&_nc_sid=50d2ac&_nc_eui2=AeHKKRz26SXv9fgl0D5mvcTWb2m4YDPCxzlvabhgM8LHORPSI5TLWja9I4uYQ2Lkc6R6XbqQeJXGr8wyo2vm5elf&_nc_ohc=ieu9Cb6D0qAQ7kNvgHzeMpK&_nc_ht=scontent.fcai19-8.fna&oh=00_AYA5aecxXjQj6KzTOlcVmmipTb0ooUJds-Sy_vqJ8ueo-w&oe=66973B29",
        publisherName: "Ahmed Magdy",
        content:
            "Wow So Cute , i love you , iam asdkl sjadk asdlkansd aslkdn asjld las dlasd",
        replies: [
          AppComment(
            image:
                "https://scontent.fcai19-8.fna.fbcdn.net/v/t39.30808-1/367483493_2229963223877696_4114371885708192652_n.jpg?stp=dst-jpg_s480x480&_nc_cat=107&ccb=1-7&_nc_sid=50d2ac&_nc_eui2=AeHKKRz26SXv9fgl0D5mvcTWb2m4YDPCxzlvabhgM8LHORPSI5TLWja9I4uYQ2Lkc6R6XbqQeJXGr8wyo2vm5elf&_nc_ohc=ieu9Cb6D0qAQ7kNvgHzeMpK&_nc_ht=scontent.fcai19-8.fna&oh=00_AYA5aecxXjQj6KzTOlcVmmipTb0ooUJds-Sy_vqJ8ueo-w&oe=66973B29",
            publisherName: "Ahmed Magdy",
            content:
                "Lump-sum payments can describe a bulk payment to acquire a group of items, such as a company paying one sum for the inventory of another business. Lottery winners will also",
            replies: [],
            isRepliesShowen: false,
            liksNumber: 32,
            disLiksNumber: 7,
            interactive: 0,
            createdAt: DateTime.now().subtract(
              const Duration(days: 50),
            ),
          )
        ],
        isRepliesShowen: false,
        liksNumber: 32,
        disLiksNumber: 7,
        interactive: 0,
        createdAt: DateTime.now().subtract(
          const Duration(days: 50),
        ),
      ),
      AppComment(
        image:
            "https://scontent.fcai19-8.fna.fbcdn.net/v/t39.30808-1/367483493_2229963223877696_4114371885708192652_n.jpg?stp=dst-jpg_s480x480&_nc_cat=107&ccb=1-7&_nc_sid=50d2ac&_nc_eui2=AeHKKRz26SXv9fgl0D5mvcTWb2m4YDPCxzlvabhgM8LHORPSI5TLWja9I4uYQ2Lkc6R6XbqQeJXGr8wyo2vm5elf&_nc_ohc=ieu9Cb6D0qAQ7kNvgHzeMpK&_nc_ht=scontent.fcai19-8.fna&oh=00_AYA5aecxXjQj6KzTOlcVmmipTb0ooUJds-Sy_vqJ8ueo-w&oe=66973B29",
        publisherName: "Ahmed Magdy",
        content: "Wow So Cute .. :)",
        replies: [
          AppComment(
            image:
                "https://scontent.fcai19-8.fna.fbcdn.net/v/t39.30808-1/367483493_2229963223877696_4114371885708192652_n.jpg?stp=dst-jpg_s480x480&_nc_cat=107&ccb=1-7&_nc_sid=50d2ac&_nc_eui2=AeHKKRz26SXv9fgl0D5mvcTWb2m4YDPCxzlvabhgM8LHORPSI5TLWja9I4uYQ2Lkc6R6XbqQeJXGr8wyo2vm5elf&_nc_ohc=ieu9Cb6D0qAQ7kNvgHzeMpK&_nc_ht=scontent.fcai19-8.fna&oh=00_AYA5aecxXjQj6KzTOlcVmmipTb0ooUJds-Sy_vqJ8ueo-w&oe=66973B29",
            publisherName: "Ahmed Magdy",
            content: "Wow So Cute .. :)",
            replies: [
              AppComment(
                image:
                    "https://scontent.fcai19-8.fna.fbcdn.net/v/t39.30808-1/367483493_2229963223877696_4114371885708192652_n.jpg?stp=dst-jpg_s480x480&_nc_cat=107&ccb=1-7&_nc_sid=50d2ac&_nc_eui2=AeHKKRz26SXv9fgl0D5mvcTWb2m4YDPCxzlvabhgM8LHORPSI5TLWja9I4uYQ2Lkc6R6XbqQeJXGr8wyo2vm5elf&_nc_ohc=ieu9Cb6D0qAQ7kNvgHzeMpK&_nc_ht=scontent.fcai19-8.fna&oh=00_AYA5aecxXjQj6KzTOlcVmmipTb0ooUJds-Sy_vqJ8ueo-w&oe=66973B29",
                publisherName: "Ahmed Magdy",
                content:
                    "Lump-sum payments can describe a bulk payment to acquire a group of items, such as a company paying one sum for the inventory of another business. Lottery winners will also",
                replies: [],
                isRepliesShowen: false,
                liksNumber: 32,
                disLiksNumber: 7,
                interactive: 0,
                createdAt: DateTime.now().subtract(
                  const Duration(days: 50),
                ),
              )
            ],
            isRepliesShowen: false,
            liksNumber: 32,
            disLiksNumber: 7,
            interactive: 0,
            createdAt: DateTime.now().subtract(
              const Duration(days: 50),
            ),
          )
        ],
        isRepliesShowen: false,
        liksNumber: 32,
        disLiksNumber: 7,
        interactive: 0,
        createdAt: DateTime.now().subtract(
          const Duration(days: 50),
        ),
      ),
      AppComment(
        image:
            "https://scontent.fcai19-8.fna.fbcdn.net/v/t39.30808-1/367483493_2229963223877696_4114371885708192652_n.jpg?stp=dst-jpg_s480x480&_nc_cat=107&ccb=1-7&_nc_sid=50d2ac&_nc_eui2=AeHKKRz26SXv9fgl0D5mvcTWb2m4YDPCxzlvabhgM8LHORPSI5TLWja9I4uYQ2Lkc6R6XbqQeJXGr8wyo2vm5elf&_nc_ohc=ieu9Cb6D0qAQ7kNvgHzeMpK&_nc_ht=scontent.fcai19-8.fna&oh=00_AYA5aecxXjQj6KzTOlcVmmipTb0ooUJds-Sy_vqJ8ueo-w&oe=66973B29",
        publisherName: "Ahmed Magdy",
        content:
            "Wow So Cute , i love you , iam asdkl sjadk asdlkansd aslkdn asjld las dlasd",
        replies: [
          AppComment(
            image:
                "https://scontent.fcai19-8.fna.fbcdn.net/v/t39.30808-1/367483493_2229963223877696_4114371885708192652_n.jpg?stp=dst-jpg_s480x480&_nc_cat=107&ccb=1-7&_nc_sid=50d2ac&_nc_eui2=AeHKKRz26SXv9fgl0D5mvcTWb2m4YDPCxzlvabhgM8LHORPSI5TLWja9I4uYQ2Lkc6R6XbqQeJXGr8wyo2vm5elf&_nc_ohc=ieu9Cb6D0qAQ7kNvgHzeMpK&_nc_ht=scontent.fcai19-8.fna&oh=00_AYA5aecxXjQj6KzTOlcVmmipTb0ooUJds-Sy_vqJ8ueo-w&oe=66973B29",
            publisherName: "Ahmed Magdy",
            content:
                "Lump-sum payments can describe a bulk payment to acquire a group of items, such as a company paying one sum for the inventory of another business. Lottery winners will also",
            replies: [],
            isRepliesShowen: false,
            liksNumber: 32,
            disLiksNumber: 7,
            interactive: 0,
            createdAt: DateTime.now().subtract(
              const Duration(days: 50),
            ),
          ),
          AppComment(
            image:
                "https://scontent.fcai19-8.fna.fbcdn.net/v/t39.30808-1/367483493_2229963223877696_4114371885708192652_n.jpg?stp=dst-jpg_s480x480&_nc_cat=107&ccb=1-7&_nc_sid=50d2ac&_nc_eui2=AeHKKRz26SXv9fgl0D5mvcTWb2m4YDPCxzlvabhgM8LHORPSI5TLWja9I4uYQ2Lkc6R6XbqQeJXGr8wyo2vm5elf&_nc_ohc=ieu9Cb6D0qAQ7kNvgHzeMpK&_nc_ht=scontent.fcai19-8.fna&oh=00_AYA5aecxXjQj6KzTOlcVmmipTb0ooUJds-Sy_vqJ8ueo-w&oe=66973B29",
            publisherName: "Ahmed Magdy",
            content:
                "Lump-sum payments can describe a bulk payment to acquire a group of items, such as a company paying one sum for the inventory of another business. Lottery winners will also",
            replies: [],
            isRepliesShowen: false,
            liksNumber: 32,
            disLiksNumber: 7,
            interactive: 0,
            createdAt: DateTime.now().subtract(
              const Duration(days: 50),
            ),
          )
        ],
        isRepliesShowen: false,
        liksNumber: 32,
        disLiksNumber: 7,
        interactive: 0,
        createdAt: DateTime.now().subtract(
          const Duration(days: 50),
        ),
      ),
      AppComment(
        image:
            "https://scontent.fcai19-8.fna.fbcdn.net/v/t39.30808-1/367483493_2229963223877696_4114371885708192652_n.jpg?stp=dst-jpg_s480x480&_nc_cat=107&ccb=1-7&_nc_sid=50d2ac&_nc_eui2=AeHKKRz26SXv9fgl0D5mvcTWb2m4YDPCxzlvabhgM8LHORPSI5TLWja9I4uYQ2Lkc6R6XbqQeJXGr8wyo2vm5elf&_nc_ohc=ieu9Cb6D0qAQ7kNvgHzeMpK&_nc_ht=scontent.fcai19-8.fna&oh=00_AYA5aecxXjQj6KzTOlcVmmipTb0ooUJds-Sy_vqJ8ueo-w&oe=66973B29",
        publisherName: "Ahmed Magdy",
        content:
            "Wow So Cute , i love you , iam asdkl sjadk asdlkansd aslkdn asjld las dlasd",
        replies: [
          AppComment(
            image:
                "https://scontent.fcai19-8.fna.fbcdn.net/v/t39.30808-1/367483493_2229963223877696_4114371885708192652_n.jpg?stp=dst-jpg_s480x480&_nc_cat=107&ccb=1-7&_nc_sid=50d2ac&_nc_eui2=AeHKKRz26SXv9fgl0D5mvcTWb2m4YDPCxzlvabhgM8LHORPSI5TLWja9I4uYQ2Lkc6R6XbqQeJXGr8wyo2vm5elf&_nc_ohc=ieu9Cb6D0qAQ7kNvgHzeMpK&_nc_ht=scontent.fcai19-8.fna&oh=00_AYA5aecxXjQj6KzTOlcVmmipTb0ooUJds-Sy_vqJ8ueo-w&oe=66973B29",
            publisherName: "Ahmed Magdy",
            content:
                "Lump-sum payments can describe a bulk payment to acquire a group of items, such as a company paying one sum for the inventory of another business. Lottery winners will also",
            replies: [],
            isRepliesShowen: false,
            liksNumber: 32,
            disLiksNumber: 7,
            interactive: 0,
            createdAt: DateTime.now().subtract(
              const Duration(days: 50),
            ),
          )
        ],
        isRepliesShowen: false,
        liksNumber: 32,
        disLiksNumber: 7,
        interactive: 0,
        createdAt: DateTime.now().subtract(
          const Duration(days: 50),
        ),
      ),
      AppComment(
        image:
            "https://scontent.fcai19-8.fna.fbcdn.net/v/t39.30808-1/367483493_2229963223877696_4114371885708192652_n.jpg?stp=dst-jpg_s480x480&_nc_cat=107&ccb=1-7&_nc_sid=50d2ac&_nc_eui2=AeHKKRz26SXv9fgl0D5mvcTWb2m4YDPCxzlvabhgM8LHORPSI5TLWja9I4uYQ2Lkc6R6XbqQeJXGr8wyo2vm5elf&_nc_ohc=ieu9Cb6D0qAQ7kNvgHzeMpK&_nc_ht=scontent.fcai19-8.fna&oh=00_AYA5aecxXjQj6KzTOlcVmmipTb0ooUJds-Sy_vqJ8ueo-w&oe=66973B29",
        publisherName: "Ahmed Magdy",
        content:
            "Wow So Cute , i love you , iam asdkl sjadk asdlkansd aslkdn asjld las dlasd",
        replies: [
          AppComment(
            image:
                "https://scontent.fcai19-8.fna.fbcdn.net/v/t39.30808-1/367483493_2229963223877696_4114371885708192652_n.jpg?stp=dst-jpg_s480x480&_nc_cat=107&ccb=1-7&_nc_sid=50d2ac&_nc_eui2=AeHKKRz26SXv9fgl0D5mvcTWb2m4YDPCxzlvabhgM8LHORPSI5TLWja9I4uYQ2Lkc6R6XbqQeJXGr8wyo2vm5elf&_nc_ohc=ieu9Cb6D0qAQ7kNvgHzeMpK&_nc_ht=scontent.fcai19-8.fna&oh=00_AYA5aecxXjQj6KzTOlcVmmipTb0ooUJds-Sy_vqJ8ueo-w&oe=66973B29",
            publisherName: "Ahmed Magdy",
            content:
                "Lump-sum payments can describe a bulk payment to acquire a group of items, such as a company paying one sum for the inventory of another business. Lottery winners will also",
            replies: [],
            isRepliesShowen: false,
            liksNumber: 32,
            disLiksNumber: 7,
            interactive: 0,
            createdAt: DateTime.now().subtract(
              const Duration(days: 50),
            ),
          )
        ],
        isRepliesShowen: false,
        liksNumber: 32,
        disLiksNumber: 7,
        interactive: 0,
        createdAt: DateTime.now().subtract(
          const Duration(days: 50),
        ),
      ),
    ],
  );
}
