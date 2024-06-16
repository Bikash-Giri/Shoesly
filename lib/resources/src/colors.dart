part of 'theme.dart';

const int _rawPrimary = 0xFF101010;
const int _information = 0xFFEE2A7B;
const int _rawSecondary = 0xFFF27A47;
const int _rawError = 0xFFCF3636;
const int _rawSuccess = 0xFFADDB64;
const int _warning = 0xFF36B3B3;
const int _brand = 0xFF00B7D5;

// --------------- Primary Color-----------------

const ShoeslyColor _primaryColorLight = ShoeslyColor(
  'PrimaryLight',
  _rawPrimary,
  {
    0: Color(0xFFFFFFFF),
    100: Color(0xFFF3F3F3),
    200: Color(0xFFE7E7E7),
    300: Color(0xFFB7B7B7),
    400: Color(0xFF6F6F6F),
    500: Color(_rawPrimary),
    600: Color(0xFF0D0B0B),
    700: Color(0xFF0B0808),
    800: Color(0xFF090506),
    900: Color(0xFF070304),
  },
);

// --------------- Secondary Color-----------------

const ShoeslyColor _secondaryColorLight = ShoeslyColor(
  'SecondaryLight',
  _rawSecondary,
  {
    5: Color(0xFFFFFBF3),
    10: Color(0xFFFFF6E7),
    500: Color(_rawSecondary),
    600: Color(0xFFD05833),
    700: Color(0xFFAE3A23),
    800: Color(0xFF8C2216),
    900: Color(0xFF74100D),
  },
);

const ShoeslyColor _secondaryColorDark = ShoeslyColor(
  'SecondaryDark',
  _rawSecondary,
  {
    5: Color(0xFFFFFBF3),
    10: Color(0xFFFFF6E7),
    500: Color(_rawSecondary),
    600: Color(0xFFED990D),
  },
);

// --------------- Error Color-----------------

const ShoeslyColor _errorColorLight = ShoeslyColor(
  'ErrorLight',
  _rawError,
  {
    15: Color(0xFFCF3636),
    500: Color(_rawError),
  },
);

const ShoeslyColor _errorColorDark = ShoeslyColor(
  'ErrorDark',
  _rawError,
  {
    15: Color(0xFFCF3636),
    500: Color(_rawError),
  },
);

// --------------- Success Color-----------------

const ShoeslyColor _successColorLight = ShoeslyColor(
  'SuccessLight',
  _rawSuccess,
  {
    100: Color(0xFF9BEBBC),
    200: Color(0xFF9BEBBC),
    300: Color(0xFF9BEBBC),
    400: Color(0xFF7BD7AB),
    500: Color(_rawSuccess),
    600: Color(0xFF94C24B),
    700: Color(0xFF7AA831),
    800: Color(0xFF618F18),
  },
);

const ShoeslyColor _successColorDark = ShoeslyColor(
  'SuccessDark',
  _rawSuccess,
  {
    15: Color(0xFFADDB64),
    500: Color(_rawSuccess),
    600: Color(0xFF94C24B),
    700: Color(0xFF7AA831),
    800: Color(0xFF618F18),
  },
);

class ShoeslyColor extends MaterialColor {
  // Just for debugging purpose.
  final String tag;
  final int primary;

  const ShoeslyColor(this.tag, this.primary, Map<int, Color> swatch)
      : super(primary, swatch);

  Color get shade5 => _color(5);

  Color get shade10 => _color(10);

  Color get shade15 => _color(15);

  Color get shade20 => _color(20);

  Color get shade30 => _color(30);

  Color get shade40 => _color(40);

  @override
  Color get shade50 => _color(50);

  @override
  Color get shade100 => _color(100);

  @override
  Color get shade200 => _color(200);

  @override
  Color get shade300 => _color(300);

  @override
  Color get shade400 => _color(400);

  @override
  Color get shade600 => _color(600);

  @override
  Color get shade700 => _color(700);

  @override
  Color get shade800 => _color(800);

  @override
  Color get shade900 => _color(900);

  Color _color(int shade) {
    assert(this[shade] != null, 'Invalid shade:: $shade, on $tag');
    return this[shade] ?? this[500]!;
  }

  @override
  String toString() => '$tag::0x${value.toRadixString(16).padLeft(8, '0')}';
}

extension ForegroundColorExtension on Color {
  Color get foregroundColor {
    if (((red * 299 + green * 587 + blue * 114) / 1000) < 128.0) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }
}

/*

Opacity values in hex

0% — 00

1% — 03      2% — 05      3% — 08      4% — 0A      5% — 0D      6% — 0F      7% — 12      8% — 14      9% — 17      10% — 1A

11% — 1C     12% — 1F     13% — 21     14% — 24     15% — 26     16% — 29     17% — 2B     18% — 2E     19% — 30     20% — 33

21% — 36     22% — 38     23% — 3B     24% — 3D     25% — 40     26% — 42     27% — 45     28% — 47     29% — 4A     30% — 4D

31% — 4F     32% — 52     33% — 54     34% — 57     35% — 59     36% — 5C     37% — 5E     38% — 61     39% — 63     40% — 66

41% — 69     42% — 6B     43% — 6E     44% — 70     45% — 73     46% — 75     47% — 78     48% — 7A     49% — 7D     50% — 80

51% — 82     52% — 85     53% — 87     54% — 8A     55% — 8C     56% — 8F     57% — 91     58% — 94     59% — 96     60% — 99

61% — 9C     62% — 9E     63% — A1     64% — A3     65% — A6     66% — A8     67% — AB     68% — AD     69% — B0     70% — B3

71% — B5     72% — B8     73% — BA     74% — BD     75% — BF     76% — C2     77% — C4     78% — C7     79% — C9     80% — CC

81% — CF     82% — D1     83% — D4     84% — D6     85% — D9     86% — DB     87% — DE     88% — E0     89% — E3     90% — E6

91% — E8     92% — EB     93% — ED     94% — F0     95% — F2     96% — F5     97% — F7     98% — FA     99% — FC     100% — FF

*/
