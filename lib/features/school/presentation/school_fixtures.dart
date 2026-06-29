import 'package:core/core.dart';

import 'package:keenpockets/features/school/presentation/view_models/school_view.dart';

/// PRESENTATION-ONLY sample owner dashboard (designs `school_dashboard_owner` /
/// `_tablet`). Swap for real data when the school rails are enabled.

/// Celebratory Mr. K shown on the owner card.
const kSchoolMascotUrl =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuD3nkYegKblK0R-0Bj1rPqq6EePNSbWU2X9i9q7OOU_acp5WtIMQQ2qKZRY0cGRtb3NpicbsrzvDQ-FwG3c6nscgqo-G903Er0jIbfknmNhKXqDHI4meztAPCCvfzZ6DlQHrzOaqEwvCPo0UOqIojV6K2HGYBbjNY3zirzJuMC9be1f6TqDqXA1j6hZtn1_qeTc_rd4ncXjD_vPNKcAApk5MRVklWQCNIVemEx-rNYd7sNX4kGvP8mmD5nuCAb6la4WPrGn-rPBQ0w';

/// Graduate-bird mascot on the tablet hero card (gestures at the dashboard).
const kSchoolHeroMascotUrl =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuCILLrdcJcmmNH4d4WsxSPDveoG1jE9jUKG0VwHZkiVXDdqQ_o8mFYENJyjDTfZcp-xTy_r_ukCFi5meONgr2yGFX3pFMPOwgzZyy2Y6CCHdZ8eNdyDuqKhagCnJHBwdw5C4VzP6wvyViOEz3lGO2otSS3SZ-J_4mB3m8RrDL925PPFtUuhVZuu09CrgR27y9wm0Ce9-wxCMl_asRQWK7xjczSOHmGwP6tde-ISzq_Z0NqPeIjDcB2z-AztnRbHvsvWkggMDXpKFhY';

/// School-owner admin avatar shown in the tablet app bar.
const kSchoolAdminAvatarUrl =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuD5lGVhYvsNAGXBfZx_SNzk5GxIl0itkdI2zcTlxcYfvD1WX7MSQP7hfZCov2M2svrUffXhYlvTXMDQsTx3sxJdOyzZU6BAlveV9ZqI8m_WDX3hJhMeueuWztBeVIY1cn9FME2VMa5JIwfI9_cisDZq6CWWThZjS4H4e_Os3Ng7St9hlKVOKBiQ_DdBlZOaPkOh0k1CV3fkkUV_THUsTeOFno-th2P-_ne4YxH7oylhbOoRDYY2mmbyqQeImo2N2Shs6CRzLAMFWIM';

/// Banner image behind the "Integrated School View" card (tablet dashboard).
const kSchoolBannerUrl =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuDK6yIK6lLL88LuSx3ZabETncK58QX5_YtnHVW-uJTEExkI9hDm4scuzix1KclLn8EtmJoRE_IbOYPymYWLXM7UIk9QZL5WQetbGS4krSjNZPrPL-Zxxuj-JvbCaNcbUJBsbaJQsJjuNIqyteQe6b32-M_UmH1V09SAaEPK-ITe9hLua2JTNmHY5JQHlt9Q5uSqHmmbAQhwls1tjmyVAr-U1CXmxyocrvLgI8XOKTQ0OTZc_4iYQ-R8YXqGJ2RNQK0bmgTsHr3k3io';

final kSchool = SchoolView(
  name: 'Bright Future Academy',
  classCount: 9,
  studentCount: 214,
  feesCollected: Money.naira(6350000),
  unpaidFees: Money.naira(1200000),
  overallPercent: 0.64,
  terms: [
    SchoolTermView(
      label: 'Term 1 Collection',
      collected: Money.naira(4250000),
      expected: Money.naira(5000000),
      percent: 0.85,
      accent: SchoolAccent.primary,
    ),
    SchoolTermView(
      label: 'Term 2 Collection',
      collected: Money.naira(2100000),
      expected: Money.naira(5000000),
      percent: 0.42,
      accent: SchoolAccent.secondary,
    ),
  ],
  // `fraction` = the bar's overall height (design track heights h-32…h-56 over a
  // h-64 chart); each bar renders a solid fill with a small faint cap on top.
  trend: const [
    SchoolTrendBar(
      label: 'Term 1',
      fraction: 0.5,
      accent: SchoolAccent.primary,
    ),
    SchoolTrendBar(
      label: 'Term 2',
      fraction: 0.625,
      accent: SchoolAccent.primary,
    ),
    SchoolTrendBar(
      label: 'Term 3',
      fraction: 0.75,
      accent: SchoolAccent.primary,
    ),
    SchoolTrendBar(
      label: 'Summer',
      fraction: 0.375,
      accent: SchoolAccent.primaryDark,
    ),
    SchoolTrendBar(
      label: 'Next Term',
      fraction: 0.875,
      accent: SchoolAccent.secondary,
    ),
  ],
);
