import 'package:keenpockets/features/gamification/presentation/view_models/leaderboard_view.dart';

/// PRESENTATION-ONLY sample leaderboard (designs `leaderboard_rankings` /
/// `_tablet`). Swap for a real ranking feed when the backend exists.

const _sarah =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuBEOpt9blCTaW76PV2yuBGftJHoEyMQqYS8QIpH77sgbZmbRgxcO_DoseTDYGtj-UPCp9SsNs38pfUuIHYOktr0qjArPAbXbIvowGm4Wr-kV7L8-OrSfzVSz1pENxIPGHCbkCsieEALf-t2dEG44Vb8t6Om3W5OZOtyOB0Cgq_CbDWrJlY-3gH4ekcHG2-WNcySSOyrsazZmMSFmpyo7i-eWLEWY0F4WBrSwXtRptbOILPWx1FOtwW3jg0E8pGUhBeeQ24Fw0hjMmU';
const _jordan =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuBGejb969VEbjr_SNJG1p25pvEM2Yi-0B2knEgC78IubII-pVB50OV6C0hPx3IIhD9CyRQFIb7BRUDGe0eN1MiTiuWfZQOr-JRcdOchwBM-M4kC2o2C8XLynbGsk-6_N5ZJaK3liF2GcuLfEy8PCLr6XnKEbdoaIWvz3w1VtO7zpKyZvlQ6--khxKgRJy_UWL7zw7q78nZ65XbQzFMffKZqHRC0SflqQONKE-Hj-MDCuJu9cnqRxViECXTNULpmF3MB6iYCr4j1PKU';
const _mike =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuC_fYx4q2ggqmqWzJQfUIctzI_VAGuYHbs5whWhTl-1OllkBlPn-S2-timwYtkD2tF7OJTire3cIYmH7JopKHJ6sn0iwuuunFKETV4hmIzdRLbgmR5mSkAshjW1Nihw64DG_wBp7HSoTtXhfqM_MKFdnryytNujZKHVnRb9uggnXDTM67_21Qd1OIS2jgG3QwR-oFm6gTnaCvwsVkrvfT3Jj2v3P92bmXNXV_SaCnBb1Aw1TiCBrtJikgs9cjai1COz0plzxtjNrBI';
const _casey =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuBzOLR5K9PqbsmtnLv7EfftPKP0HhZckVoAMmypS_FalYPXa_ElrfKbbMXwAeCt_PHVg-dhKpTAmBgv6eBXWU6JTx8zu9VYJhjXjnQSaIGTnLl5XJH0kEZeVN_D4c_9EKiGnGDIEuZZ6c_tiDk1Zyp9DIUu7WQ4lGzHqFgehLaAJFBtXQvctjd9YOMWkTcj1IBJ2Xo3ak2Jc82arnX69bXd5eiteJc5gmXiOw76F3iHnH0pZzxVJhU3WtYs9ky2AQ4vNjaJ9GdD9ls';
const _sam =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuCWMFK_AMxVsCuFrcwLuMrLpyi__efajFJjs-5kYA34MQ2m50apFww0a6H72eNacnNpmXpVA2WewQ4zepby8CGX4IarbUw3SdEyhQ7sWPnH5-swVep1EQlH1BeITiFMZWXJT-GKAiQfWODdaA_YDTl3KxD1xueW7ckUpmdRdU8adlmWF62XdS1pcASGclACDS9-HddanLsRpIR9p_bmcmv-QrPSv83qTJ9ruKXPhp2hpPQFg4thEKl8voas5KDcbkYfGrv-1FMEPwk';
const _riley =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuBITKCaMWcqyQKw-KTZPCvLER2fDRXApWYIJQNXyWpDuefzwTL0m_n3JvuJBpCPJCmj5wDoRSTp7ZcpcFqVtwBy075eJoMIGaBZi5HCdKb46FTES2Ac865thmlfsdoCdMRl-8jOjWVALH3EoZwrCU7KiAuue_DBbkRmbac4Kq2HRsItHw1unz4GfHT4Smtf9gkREiuQ8F5izirOKK5P4djOruU9qkCa9pm13btQexqeS4Zm8NVYaCzLmwUlUY6eEiVjJijoaBX0NtA';
const _alex =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuAnfIAr8SilWOHpfPWyvVcp9GR44D-_Gz05JD9O7v7ieY6MdUvVd83UsI2lniBL5HDxS5hzd8SjSN6fGENpWq517gPUsIjaDApmWJ6BCTbofVrYzGmP1fjRoK-05qaQBM0sPxYg2X5HeOdjzJYoCx-duIIm4EMIxNmkFgxfTezSMjVpFJRIPwmrUw8BtjAnlBxG9is5PSLV00kP-fMsMrNWF3BuWFm6w6W7q9zmo_yOSPHXGtvz-Y0vIO4cEiaQZtRxkqqCvkWXiv0';

const kLeaderboardPodium = <PodiumEntry>[
  PodiumEntry(rank: 1, name: 'Sarah', points: 62, avatarUrl: _sarah),
  PodiumEntry(rank: 2, name: 'Jordan', points: 48, avatarUrl: _jordan),
  PodiumEntry(rank: 3, name: 'Mike', points: 31, avatarUrl: _mike),
];

const kLeaderboardRows = <LeaderboardEntry>[
  LeaderboardEntry(
    rank: 4,
    name: 'Casey',
    points: 28,
    avatarUrl: _casey,
    trend: LeaderboardTrend.up,
  ),
  LeaderboardEntry(
    rank: 5,
    name: 'Sam',
    points: 25,
    avatarUrl: _sam,
    trend: LeaderboardTrend.flat,
  ),
  LeaderboardEntry(
    rank: 6,
    name: 'Riley',
    points: 22,
    avatarUrl: _riley,
    trend: LeaderboardTrend.up,
  ),
  LeaderboardEntry(
    rank: 7,
    name: 'Alex',
    points: 19,
    avatarUrl: _alex,
    trend: LeaderboardTrend.down,
  ),
];

const kLeaderboardUserAvatar =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuDJh4-YMYiCdeDy43AaHl934Duh4pQJjVd0j8_FKYP0xN1yQs6TPkfKI7lfe2bhDtV3o3sjxGhzqC6z49k0haL-EYwy3d8iv1jeOkK0gJbzApDgnEQrWzaZLP7tleWyYPM5CGiTJTXwt8fDJbqtKybpETX_C2BNr9yWqXvZtFHs6UeqXAcPYUA3HEPilO8vtKNH5MyI5EVs1kn4fK_G1INlJgRvZwYI1dQV-rrXVlyUGNtYRrl-4EcxFwpQuauil6M2zmlZYFjiPuw';

const kLeaderboardStanding = LeaderboardStanding(
  rank: 42,
  contributions: 7,
  avatarUrl: kLeaderboardUserAvatar,
  percentile: 'Top 15% this week!',
  pointsEarned: 1240,
  totalContributions: 12,
);
