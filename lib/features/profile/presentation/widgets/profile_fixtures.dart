import 'package:flutter/material.dart';

// PRESENTATION-ONLY placeholder data for the my-profile screen
// (design `my_profile`). Portrait URLs come straight from the mockups.

typedef ProfileAchievement = ({String label, IconData icon});
typedef ProfileReview = ({
  String author,
  String timeAgo,
  String body,
  String avatarUrl,
});

const kProfileReviewCount = 42;

const kProfileAvatarUrl =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuCpp7TqNGmaqb11kaJueJicmy_9bD5Pa3KBGgKTx4oOedqgWK0p4HJ7TahXwf-CAQ6Cl24o2N7Aa1rwJE6WcaC-KrWvS-v_vZ61n--NqwRq1kO-48wUWPCxUAhjUC25ahBwJ-dV3ajd5-cMiXiycG3DjHywXDpCY4yQxPJVcuzadx6_RyOSdFI_2K9hXizkNTrkKhqNLDhHSSbMCH5WS8pSUTrKoz94H4eQle3KWDkMWnQa2Y2gJSDAMNW2NGm6Qr9jSfYbV84OOSo';

const kProfileAchievements = <ProfileAchievement>[
  (label: 'Reliable Payer', icon: Icons.handshake_rounded),
  (label: 'Top Organizer', icon: Icons.groups_rounded),
  (label: 'Recruiter', icon: Icons.celebration_rounded),
];

const kProfileReviews = <ProfileReview>[
  (
    author: 'Alice Miller',
    timeAgo: '2d ago',
    body:
        'Johnathan was an absolute pleasure to save with. Always on time with contributions!',
    avatarUrl:
        'https://lh3.googleusercontent.com/aida-public/AB6AXuC9agDWCTlZsAr-OzzVkPfc4ICC1SCOxPW923LlUi_5aaA9G9Bhj0F4Q1BFkmpWpU_Vu4zFh8RzkmXyh9CuW5a4le5Rfl4imJ4WYdFV9Hf_iqjZDwvjjyf4dlUTmzoZzkosrjx1eu3uhh1jBL7mdhSvjBM3doVbZLh0hI3dEhrlSgEtpLVhG4D5tEh2iA2LNKUy9c0UlJ-n1ARawzNpL6VDMFi-IFXrAgHSLbplThJc4voAjvpAA0NReQYnqtrDuYfY4QcwAsjFUjU',
  ),
  (
    author: 'Robert Blake',
    timeAgo: '1w ago',
    body: 'Reliable and responsive communicator during the collective cycle.',
    avatarUrl:
        'https://lh3.googleusercontent.com/aida-public/AB6AXuCbiGNJv0cdjzZ-iNCzNu2cwSjKajTpTlQ2bsKwdVEN6g2MnAG4onHN6g2kZtyjTe61LZSu2C7kMl7ikf5asb2YWqut8-m9q7l8pvQtk0FBGNDlVgNzG8RfAUu4S4xa9_YGViB-GXzdTAZRf1Ny23nKibmaloDydq1iZM-5sMTVf64iM2E0bqRLwl3KHg-yFICsSy48jeFZcHcyxzyDl1b4kShmC14BHM_R_SNFWfMhaY6dpP7MgEScl96S7dR70oJWEjLreuu1f7M',
  ),
];
