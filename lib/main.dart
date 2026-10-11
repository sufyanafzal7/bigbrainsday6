import 'dart:ui' show ImageFilter, PointMode, PointerDeviceKind;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const PortfolioApp());

// ---------------------------------------------------------------------------
// Content
// ---------------------------------------------------------------------------

class Links {
  static const email = 'mailto:sufyanafzalmalik@gmail.com';
  static const linkedin = 'https://linkedin.com/in/sufyanafzal7';
  static const github = 'https://github.com/sufyanafzal7';
}

const navItems = ['Home', 'Projects', 'Experience', 'Skills', 'Contact'];

class LinkData {
  const LinkData(this.label, this.url, this.icon);
  final String label;
  final String url;
  final IconData icon;
}

class ProjectData {
  const ProjectData({
    required this.title,
    required this.subtitle,
    required this.tag,
    required this.icon,
    required this.colors,
    required this.points,
    required this.stack,
    required this.links,
  });
  final String title;
  final String subtitle;
  final String tag;
  final IconData icon;
  final List<Color> colors;
  final List<String> points;
  final List<String> stack;
  final List<LinkData> links;
}

class ExperienceData {
  const ExperienceData({
    required this.org,
    required this.role,
    required this.period,
    required this.place,
    required this.points,
    this.badge,
    this.link,
  });
  final String org;
  final String role;
  final String period;
  final String place;
  final List<String> points;
  final String? badge;
  final LinkData? link;
}

class SkillGroup {
  const SkillGroup(this.title, this.icon, this.items);
  final String title;
  final IconData icon;
  final List<String> items;
}

const projects = [
  ProjectData(
    title: 'ORAS',
    subtitle: 'Operative Recognition & Analysis System',
    tag: 'Computer vision',
    icon: Icons.biotech_rounded,
    colors: [Color(0xFF0D9488), Color(0xFF2563EB)],
    points: [
      'Cross-platform Flutter app for desktop, web, and mobile that analyzes surgical video.',
      'YOLOv8 detects surgical tools and a Temporal Convolutional Network recognizes surgical phases.',
      'Flask API deployed on Render, with a hybrid local and cloud processing pipeline.',
    ],
    stack: ['Flutter', 'Flask', 'YOLOv8', 'TCN', 'ONNX'],
    links: [
      LinkData('Repository', 'https://github.com/sufyanafzal7/oras', Icons.code_rounded),
      LinkData('Live app', 'https://oras-frontend.onrender.com/', Icons.north_east_rounded),
      LinkData(
        'Demo video',
        'https://www.dropbox.com/scl/fi/9rr6s9nsja2vneuqwzvco/ORAS.mp4?rlkey=pbe3v465h1ftt2005ejrsh1ty&st=hqcrogmx&dl=0',
        Icons.play_circle_outline_rounded,
      ),
    ],
  ),
  ProjectData(
    title: 'SLCA',
    subtitle: 'Sign Language Chatting App',
    tag: 'On-device AI',
    icon: Icons.sign_language_rounded,
    colors: [Color(0xFF7C3AED), Color(0xFF2563EB)],
    points: [
      'Bidirectional chat that translates between Pakistan Sign Language and text in real time.',
      'An 80-word LSTM recognizes signs from YOLOv8-Pose skeletal keypoints.',
      'Fingerspelling for 23 letters fits in a 14.9 KB TensorFlow Lite model. No cloud needed.',
    ],
    stack: ['Flutter', 'YOLOv8-Pose', 'LSTM', 'TensorFlow Lite', 'Firebase'],
    links: [
      LinkData('Repository', 'https://github.com/sufyanafzal7/Sign-Language-Chat-App', Icons.code_rounded),
      LinkData(
        'Latest release',
        'https://github.com/sufyanafzal7/Sign-Language-Chat-App/releases/tag/Latest',
        Icons.north_east_rounded,
      ),
      LinkData(
        'Demo video',
        'https://www.dropbox.com/scl/fi/msisv255o5z9hjifpj8ec/MAD-Final-Project.mp4?rlkey=nkcypjm7atjsm4q0ooxx28v3c&st=d671t0vt&dl=0',
        Icons.play_circle_outline_rounded,
      ),
    ],
  ),
  ProjectData(
    title: 'Wahab Dawakhana',
    subtitle: 'Patient Record Management App',
    tag: 'Offline first',
    icon: Icons.medication_rounded,
    colors: [Color(0xFF059669), Color(0xFF65A30D)],
    points: [
      'Runs on six platforms with fast offline access, using Hive for local storage.',
      'Dynamic custom fields, local search and filtering, and Google Drive backup.',
    ],
    stack: ['Flutter', 'Hive', 'Google Drive API'],
    links: [
      LinkData('Repository', 'https://github.com/sufyanafzal7/wahab_dawakhana', Icons.code_rounded),
      LinkData(
        'Latest release',
        'https://github.com/sufyanafzal7/wahab_dawakhana/releases/tag/Latest',
        Icons.north_east_rounded,
      ),
    ],
  ),
];

const experiences = [
  ExperienceData(
    org: 'Horquva LLC',
    role: 'Flutter Application Developer Intern, then Castor Team Lead',
    period: 'Jul 2026 - Sep 2026',
    place: 'Remote',
    badge: 'Shining Star of the Summer Internship',
    link: LinkData('View credential', 'https://lnkd.in/p/dwyRsEGF', Icons.north_east_rounded),
    points: [
      'Built responsive Flutter interfaces across mobile, web, and desktop in a shared monorepo, following Clean Architecture and BLoC standards.',
      'Promoted to lead Castor, an internal engineering governance platform, managing a nine-person team across nine platform sub-teams.',
      'Administered the central GitHub repository and set the company-wide branch strategy, resolving merge conflicts and test failures before a live demo.',
      'Rated Excellent overall in the internship evaluation, with Outstanding marks in Learning & Adaptability and Professionalism.',
    ],
  ),
  ExperienceData(
    org: 'SafeX Solutions',
    role: 'Flutter Application Developer Intern',
    period: 'Jun 2026 - Aug 2026',
    place: 'Remote',
    link: LinkData('View credential', 'https://lnkd.in/p/dAxGMnsn', Icons.north_east_rounded),
    points: [
      'Built four Flutter prototypes in weekly sprints: HR management, transportation, a marketplace, and industrial safety.',
      'Developed a driver-tracking screen for a student transport app with live map previews and native call support.',
      'Designed a freelance bidding system with sortable bid review and anti-spam safeguards, and delivered SafeX Guardian, a client-ready safety compliance app.',
    ],
  ),
];

const skillGroups = [
  SkillGroup('Mobile', Icons.phone_android_rounded, [
    'Flutter', 'Dart', 'Clean Architecture', 'BLoC', 'Firebase', 'Android SDK',
  ]),
  SkillGroup('AI and ML', Icons.psychology_outlined, [
    'TensorFlow Lite', 'PyTorch', 'YOLOv8', 'Computer Vision', 'Deep Learning', 'Machine Learning',
  ]),
  SkillGroup('Agentic AI', Icons.smart_toy_outlined, [
    'Claude API', 'Model Context Protocol', 'Agent Skills', 'SubAgents',
  ]),
  SkillGroup('Backend and data', Icons.dns_outlined, [
    'Flask', 'REST APIs', 'Firestore', 'Hive',
  ]),
  SkillGroup('DevOps', Icons.cloud_outlined, [
    'Docker', 'Kubernetes', 'Jenkins', 'Prometheus', 'Grafana', 'AWS EC2',
  ]),
  SkillGroup('Tools', Icons.build_outlined, [
    'Python', 'Git', 'GitHub',
  ]),
];

// ---------------------------------------------------------------------------
// Theme
// ---------------------------------------------------------------------------

@immutable
class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.bg,
    required this.surface,
    required this.surfaceAlt,
    required this.border,
    required this.text,
    required this.textMuted,
    required this.accent,
    required this.accentAlt,
    required this.onAccent,
  });

  final Color bg;
  final Color surface;
  final Color surfaceAlt;
  final Color border;
  final Color text;
  final Color textMuted;
  final Color accent;
  final Color accentAlt;
  final Color onAccent;

  static const dark = AppColors(
    bg: Color(0xFF0A0B10),
    surface: Color(0xFF12141B),
    surfaceAlt: Color(0xFF1A1D27),
    border: Color(0x1FFFFFFF),
    text: Color(0xFFF3F4F6),
    textMuted: Color(0xFF9AA3B2),
    accent: Color(0xFF5EEAD4),
    accentAlt: Color(0xFF7DA2FF),
    onAccent: Color(0xFF04120F),
  );

  static const light = AppColors(
    bg: Color(0xFFF5F6F8),
    surface: Color(0xFFFFFFFF),
    surfaceAlt: Color(0xFFEEF0F4),
    border: Color(0x1F0F172A),
    text: Color(0xFF0F172A),
    textMuted: Color(0xFF566074),
    accent: Color(0xFF0D9488),
    accentAlt: Color(0xFF2563EB),
    onAccent: Color(0xFFFFFFFF),
  );

  @override
  AppColors copyWith({
    Color? bg,
    Color? surface,
    Color? surfaceAlt,
    Color? border,
    Color? text,
    Color? textMuted,
    Color? accent,
    Color? accentAlt,
    Color? onAccent,
  }) {
    return AppColors(
      bg: bg ?? this.bg,
      surface: surface ?? this.surface,
      surfaceAlt: surfaceAlt ?? this.surfaceAlt,
      border: border ?? this.border,
      text: text ?? this.text,
      textMuted: textMuted ?? this.textMuted,
      accent: accent ?? this.accent,
      accentAlt: accentAlt ?? this.accentAlt,
      onAccent: onAccent ?? this.onAccent,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
      bg: Color.lerp(bg, other.bg, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      surfaceAlt: Color.lerp(surfaceAlt, other.surfaceAlt, t)!,
      border: Color.lerp(border, other.border, t)!,
      text: Color.lerp(text, other.text, t)!,
      textMuted: Color.lerp(textMuted, other.textMuted, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      accentAlt: Color.lerp(accentAlt, other.accentAlt, t)!,
      onAccent: Color.lerp(onAccent, other.onAccent, t)!,
    );
  }
}

enum ScreenSize { mobile, tablet, desktop }

extension ContextX on BuildContext {
  AppColors get c => Theme.of(this).extension<AppColors>()!;
  bool get isDark => Theme.of(this).brightness == Brightness.dark;

  ScreenSize get screen {
    final w = MediaQuery.sizeOf(this).width;
    if (w < 700) return ScreenSize.mobile;
    if (w < 1100) return ScreenSize.tablet;
    return ScreenSize.desktop;
  }

  bool get isMobile => screen == ScreenSize.mobile;

  double pick(double mobile, double tablet, double desktop) {
    switch (screen) {
      case ScreenSize.mobile:
        return mobile;
      case ScreenSize.tablet:
        return tablet;
      case ScreenSize.desktop:
        return desktop;
    }
  }
}

TextStyle display(
    BuildContext context,
    double size, {
      FontWeight weight = FontWeight.w700,
      Color? color,
      double height = 1.1,
    }) {
  return GoogleFonts.spaceGrotesk(
    fontSize: size,
    fontWeight: weight,
    color: color ?? context.c.text,
    height: height,
    letterSpacing: -size * 0.02,
  );
}

TextStyle body(
    BuildContext context,
    double size, {
      FontWeight weight = FontWeight.w400,
      Color? color,
      double height = 1.65,
    }) {
  return GoogleFonts.manrope(
    fontSize: size,
    fontWeight: weight,
    color: color ?? context.c.textMuted,
    height: height,
  );
}

ThemeData buildTheme(AppColors c, Brightness brightness) {
  final base = ThemeData(brightness: brightness, useMaterial3: true);
  return base.copyWith(
    scaffoldBackgroundColor: c.bg,
    colorScheme: ColorScheme.fromSeed(
      seedColor: c.accent,
      brightness: brightness,
    ).copyWith(surface: c.surface),
    textTheme: GoogleFonts.manropeTextTheme(base.textTheme)
        .apply(bodyColor: c.text, displayColor: c.text),
    extensions: [c],
    splashFactory: NoSplash.splashFactory,
    highlightColor: Colors.transparent,
  );
}

Future<void> openUrl(String url) async {
  try {
    final ok = await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    if (!ok) debugPrint('Could not open $url');
  } catch (e) {
    debugPrint('Could not open $url: $e');
  }
}

// ---------------------------------------------------------------------------
// App
// ---------------------------------------------------------------------------

final ValueNotifier<ThemeMode> themeMode = ValueNotifier(ThemeMode.dark);
final ValueNotifier<Size?> previewSize = ValueNotifier(null);

class _AppScrollBehavior extends MaterialScrollBehavior {
  const _AppScrollBehavior();

  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    PointerDeviceKind.trackpad,
    PointerDeviceKind.stylus,
  };
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeMode,
      builder: (context, mode, _) {
        return MaterialApp(
          title: 'Sufyan Afzal | AI Flutter Application Developer',
          debugShowCheckedModeBanner: false,
          themeMode: mode,
          theme: buildTheme(AppColors.light, Brightness.light),
          darkTheme: buildTheme(AppColors.dark, Brightness.dark),
          scrollBehavior: const _AppScrollBehavior(),
          home: const PortfolioPage(),
        );
      },
    );
  }
}

// ---------------------------------------------------------------------------
// Page
// ---------------------------------------------------------------------------

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final _scroll = ScrollController();
  final Map<String, GlobalKey> _keys = {for (final n in navItems) n: GlobalKey()};

  @override
  void dispose() {
    _scroll.dispose();
    super.dispose();
  }

  void _goTo(String id) {
    final ctx = _keys[id]?.currentContext;
    if (ctx == null) return;
    Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeInOutCubic,
      alignment: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<Size?>(
        valueListenable: previewSize,
        builder: (context, selectedSize, _) {
          final screenSize = MediaQuery.sizeOf(context);
          final previewWidth = selectedSize?.width ?? screenSize.width;

          return Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: selectedSize == null
                    ? const NeverScrollableScrollPhysics()
                    : const ClampingScrollPhysics(),
                child: _DeviceFrame(
                  size: selectedSize,
                  isPreview: selectedSize != null &&
                      MediaQuery.sizeOf(context).width >= 1100,
                  child: SizedBox(
                    width: previewWidth,
                    child: MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  size: Size(
                    previewWidth,
                    selectedSize?.height ?? screenSize.height,
                  ),
                ),
                child: ScrollScope(
                  controller: _scroll,
                  child: Stack(
                    children: [
                      const Positioned.fill(child: _Backdrop()),
                      SingleChildScrollView(
                        controller: _scroll,
                        child: Column(
                          children: [
                            KeyedSubtree(
                              key: _keys['Home'],
                              child: HeroSection(
                                onProjects: () => _goTo('Projects'),
                                onContact: () => _goTo('Contact'),
                              ),
                            ),
                            KeyedSubtree(
                              key: _keys['Projects'],
                              child: const ProjectsSection(),
                            ),
                            KeyedSubtree(
                              key: _keys['Experience'],
                              child: const ExperienceSection(),
                            ),
                            KeyedSubtree(
                              key: _keys['Skills'],
                              child: const SkillsSection(),
                            ),
                            const BackgroundSection(),
                            KeyedSubtree(
                              key: _keys['Contact'],
                              child: const ContactSection(),
                            ),
                            const Footer(),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: SafeArea(
                          child: NavBar(onNavigate: _goTo),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
              ),
              ),
          );
        },
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Scroll reveal
// ---------------------------------------------------------------------------

class ScrollScope extends InheritedWidget {
  const ScrollScope({super.key, required this.controller, required super.child});

  final ScrollController controller;

  static ScrollController? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ScrollScope>()?.controller;
  }

  @override
  bool updateShouldNotify(ScrollScope oldWidget) => controller != oldWidget.controller;
}

class Reveal extends StatefulWidget {
  const Reveal({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.offset = 28,
  });

  final Widget child;
  final Duration delay;
  final double offset;

  @override
  State<Reveal> createState() => _RevealState();
}

class _RevealState extends State<Reveal> with SingleTickerProviderStateMixin {
  late final AnimationController _ac = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 750),
  );
  ScrollController? _sc;
  bool _shown = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final sc = ScrollScope.of(context);
    if (sc != _sc) {
      _sc?.removeListener(_check);
      _sc = sc;
      _sc?.addListener(_check);
    }
    WidgetsBinding.instance.addPostFrameCallback((_) => _check());
  }

  void _check() {
    if (_shown || !mounted) return;
    final ro = context.findRenderObject();
    if (ro is! RenderBox || !ro.attached) return;
    final top = ro.localToGlobal(Offset.zero).dy;
    final height = MediaQuery.sizeOf(context).height;
    if (top < height * 0.92) {
      _shown = true;
      Future.delayed(widget.delay, () {
        if (mounted) _ac.forward();
      });
    }
  }

  @override
  void dispose() {
    _sc?.removeListener(_check);
    _ac.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MediaQuery.sizeOf(context); // rebuild on resize so hidden items get checked again
    if (!_shown) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _check());
    }
    return AnimatedBuilder(
      animation: _ac,
      child: widget.child,
      builder: (context, child) {
        final t = Curves.easeOutCubic.transform(_ac.value);
        return Opacity(
          opacity: t,
          child: Transform.translate(offset: Offset(0, (1 - t) * widget.offset), child: child),
        );
      },
    );
  }
}

// ---------------------------------------------------------------------------
// Small building blocks
// ---------------------------------------------------------------------------

class Hoverable extends StatefulWidget {
  const Hoverable({super.key, required this.builder, this.onTap});

  final Widget Function(BuildContext context, bool hovering) builder;
  final VoidCallback? onTap;

  @override
  State<Hoverable> createState() => _HoverableState();
}

class _HoverableState extends State<Hoverable> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final child = widget.builder(context, _hover);
    return MouseRegion(
      cursor: widget.onTap != null ? SystemMouseCursors.click : MouseCursor.defer,
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: widget.onTap == null
          ? child
          : GestureDetector(behavior: HitTestBehavior.opaque, onTap: widget.onTap, child: child),
    );
  }
}

class Glass extends StatelessWidget {
  const Glass({
    super.key,
    required this.child,
    this.radius = 22,
    this.padding = EdgeInsets.zero,
    this.blur = 18,
  });

  final Widget child;
  final double radius;
  final EdgeInsets padding;
  final double blur;

  @override
  Widget build(BuildContext context) {
    final c = context.c;
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            color: c.surface.withValues(alpha: context.isDark ? 0.62 : 0.8),
            borderRadius: BorderRadius.circular(radius),
            border: Border.all(color: c.border),
          ),
          child: child,
        ),
      ),
    );
  }
}

class GradientText extends StatelessWidget {
  const GradientText(this.text, {super.key, required this.style});

  final String text;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    final c = context.c;
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (rect) => LinearGradient(colors: [c.accent, c.accentAlt]).createShader(rect),
      child: Text(text, style: style.copyWith(color: Colors.white)),
    );
  }
}

class PillButton extends StatelessWidget {
  const PillButton({
    super.key,
    required this.label,
    required this.onTap,
    this.icon,
    this.filled = false,
    this.compact = false,
  });

  final String label;
  final VoidCallback onTap;
  final IconData? icon;
  final bool filled;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final c = context.c;
    final fg = filled ? c.onAccent : c.text;
    return Hoverable(
      onTap: onTap,
      builder: (context, hover) {
        return AnimatedScale(
          scale: hover ? 1.04 : 1,
          duration: const Duration(milliseconds: 180),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: compact ? 18 : 24, vertical: compact ? 10 : 14),
            decoration: BoxDecoration(
              gradient: filled ? LinearGradient(colors: [c.accent, c.accentAlt]) : null,
              color: filled ? null : (hover ? c.surfaceAlt : Colors.transparent),
              borderRadius: BorderRadius.circular(999),
              border: filled ? null : Border.all(color: c.border),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null) ...[
                  Icon(icon, size: 18, color: fg),
                  const SizedBox(width: 8),
                ],
                Text(
                  label,
                  style: body(context, compact ? 13.5 : 14.5, weight: FontWeight.w700, color: fg, height: 1.2),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class Tag extends StatelessWidget {
  const Tag(this.label, {super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    final c = context.c;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        color: c.accent.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: body(context, 12, weight: FontWeight.w700, color: c.accent, height: 1.2),
      ),
    );
  }
}

class StackChip extends StatelessWidget {
  const StackChip(this.label, {super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    final c = context.c;
    final screenWidth = MediaQuery.sizeOf(context).width;

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: screenWidth < 700
            ? screenWidth - 100
            : screenWidth < 1100
            ? screenWidth * 0.42
            : 420,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 7,
        ),
        decoration: BoxDecoration(
          color: c.surfaceAlt,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: c.border),
        ),
        child: Text(
          label,
          softWrap: true,
          style: body(
            context,
            12.5,
            weight: FontWeight.w600,
            color: c.text.withValues(alpha: 0.85),
            height: 1.3,
          ),
        ),
      ),
    );
  }
}

class BulletLine extends StatelessWidget {
  const BulletLine(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    final c = context.c;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Container(
            width: 5,
            height: 5,
            decoration: BoxDecoration(color: c.accent, shape: BoxShape.circle),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(child: Text(text, style: body(context, 14.5))),
      ],
    );
  }
}

class LinkButton extends StatelessWidget {
  const LinkButton(this.data, {super.key});

  final LinkData data;

  @override
  Widget build(BuildContext context) {
    final c = context.c;
    return Hoverable(
      onTap: () => openUrl(data.url),
      builder: (context, hover) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
          decoration: BoxDecoration(
            color: hover ? c.accent.withValues(alpha: 0.14) : Colors.transparent,
            borderRadius: BorderRadius.circular(999),
            border: Border.all(color: hover ? c.accent.withValues(alpha: 0.6) : c.border),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(data.icon, size: 16, color: hover ? c.accent : c.text),
              const SizedBox(width: 7),
              Text(
                data.label,
                style: body(context, 13, weight: FontWeight.w700, color: hover ? c.accent : c.text, height: 1.2),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ContentWrap extends StatelessWidget {
  const ContentWrap({super.key, required this.child, this.top, this.bottom});

  final Widget child;
  final double? top;
  final double? bottom;

  @override
  Widget build(BuildContext context) {
    final h = context.pick(20, 40, 64);
    final v = context.pick(56, 80, 100);
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1240),
        child: Padding(
          padding: EdgeInsets.fromLTRB(h, top ?? v, h, bottom ?? v),
          child: child,
        ),
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  const SectionHeader({super.key, required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final c = context.c;
    return Reveal(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44,
            height: 4,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [c.accent, c.accentAlt]),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(height: 18),
          Text(title, style: display(context, context.pick(34, 44, 52))),
          const SizedBox(height: 12),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 640),
            child: Text(subtitle, style: body(context, context.pick(15, 16.5, 17))),
          ),
        ],
      ),
    );
  }
}

class PulseDot extends StatefulWidget {
  const PulseDot({super.key});

  @override
  State<PulseDot> createState() => _PulseDotState();
}

class _PulseDotState extends State<PulseDot> with SingleTickerProviderStateMixin {
  late final AnimationController _ac = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1700),
  )..repeat();

  @override
  void dispose() {
    _ac.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const green = Color(0xFF34D399);
    return SizedBox(
      width: 22,
      height: 22,
      child: AnimatedBuilder(
        animation: _ac,
        builder: (context, _) {
          final t = _ac.value;
          return Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 8 + 14 * t,
                height: 8 + 14 * t,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: green.withValues(alpha: (1 - t) * 0.45),
                ),
              ),
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(shape: BoxShape.circle, color: green),
              ),
            ],
          );
        },
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Backdrop
// ---------------------------------------------------------------------------

class _Backdrop extends StatelessWidget {
  const _Backdrop();

  @override
  Widget build(BuildContext context) {
    final c = context.c;
    return RepaintBoundary(
      child: Stack(
        children: [
          Container(color: c.bg),
          Positioned(top: -220, left: -160, child: _Glow(color: c.accent, size: 640, alpha: 0.16)),
          Positioned(top: 280, right: -260, child: _Glow(color: c.accentAlt, size: 720, alpha: 0.12)),
          Positioned.fill(child: CustomPaint(painter: _DotGrid(c.text.withValues(alpha: 0.07)))),
        ],
      ),
    );
  }
}

class _Glow extends StatelessWidget {
  const _Glow({required this.color, required this.size, required this.alpha});

  final Color color;
  final double size;
  final double alpha;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [color.withValues(alpha: alpha), color.withValues(alpha: 0)],
        ),
      ),
    );
  }
}

class _DotGrid extends CustomPainter {
  _DotGrid(this.color);

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.6
      ..strokeCap = StrokeCap.round;
    final points = <Offset>[];
    for (double y = 14; y < size.height; y += 30) {
      for (double x = 14; x < size.width; x += 30) {
        points.add(Offset(x, y));
      }
    }
    canvas.drawPoints(PointMode.points, points, paint);
  }

  @override
  bool shouldRepaint(_DotGrid oldDelegate) => oldDelegate.color != color;
}

// ---------------------------------------------------------------------------
// Navigation
// ---------------------------------------------------------------------------

class NavBar extends StatelessWidget {
  const NavBar({super.key, required this.onNavigate});

  final void Function(String id) onNavigate;

  void _openMenu(BuildContext context) {
    final c = context.c;
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: c.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      builder: (sheetContext) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(color: c.border, borderRadius: BorderRadius.circular(4)),
                ),
                const SizedBox(height: 12),
                for (final n in navItems)
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(n, style: display(context, 22, weight: FontWeight.w600)),
                    trailing: Icon(Icons.north_east_rounded, size: 18, color: c.textMuted),
                    onTap: () {
                      Navigator.pop(sheetContext);
                      Future.delayed(const Duration(milliseconds: 250), () => onNavigate(n));
                    },
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final mobile = context.isMobile;
    final actualBrowserWidth = MediaQuery.sizeOf(context).width;
    final isDesktopBrowser = actualBrowserWidth >= 1100;
    final c = context.c;
    return Padding(
      padding: EdgeInsets.fromLTRB(mobile ? 12 : 24, 12, mobile ? 12 : 24, 0),
      child: Center(
        heightFactor: 1,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 960),
          child: Glass(
            radius: 999,
            padding: EdgeInsets.symmetric(horizontal: mobile ? 8 : 10, vertical: 8),
            child: Row(
              children: [
                _Logo(onTap: () => onNavigate('Home')),
                const Spacer(),
                if (!mobile) ...[
                  for (final n in navItems) _NavLink(label: n, onTap: () => onNavigate(n)),
                  const SizedBox(width: 8),
                ],
                if (isDesktopBrowser) ...[
                  const _DevicePreviewToggle(),
                  const SizedBox(width: 8),
                ],
                const _ThemeToggle(),
                const SizedBox(width: 8),
                if (mobile)
                  GestureDetector(
                    onTap: () => _openMenu(context),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Icon(Icons.menu_rounded, color: c.text),
                    ),
                  )
                else
                  PillButton(
                    label: 'Hire me',
                    compact: true,
                    filled: true,
                    onTap: () => openUrl(Links.email),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final c = context.c;
    return Hoverable(
      onTap: onTap,
      builder: (context, hover) {
        return AnimatedScale(
          scale: hover ? 1.08 : 1,
          duration: const Duration(milliseconds: 180),
          child: Container(
            width: 42,
            height: 42,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(colors: [c.accent, c.accentAlt]),
            ),
            child: Text(
              'SA',
              style: display(context, 15, weight: FontWeight.w800, color: c.onAccent, height: 1),
            ),
          ),
        );
      },
    );
  }
}

class _NavLink extends StatelessWidget {
  const _NavLink({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final c = context.c;
    return Hoverable(
      onTap: onTap,
      builder: (context, hover) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 160),
            style: body(
              context,
              14,
              weight: FontWeight.w600,
              color: hover ? c.text : c.textMuted,
              height: 1.2,
            ),
            child: Text(label),
          ),
        );
      },
    );
  }
}

class _ThemeToggle extends StatelessWidget {
  const _ThemeToggle();

  @override
  Widget build(BuildContext context) {
    final c = context.c;
    return Hoverable(
      onTap: () {
        themeMode.value = themeMode.value == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
      },
      builder: (context, hover) {
        return Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: hover ? c.surfaceAlt : Colors.transparent,
            border: Border.all(color: c.border),
          ),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            transitionBuilder: (child, anim) => RotationTransition(
              turns: Tween<double>(begin: 0.75, end: 1).animate(anim),
              child: FadeTransition(opacity: anim, child: child),
            ),
            child: Icon(
              context.isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
              key: ValueKey(context.isDark),
              size: 19,
              color: c.text,
            ),
          ),
        );
      },
    );
  }
}

class _DevicePreviewToggle extends StatelessWidget {
  const _DevicePreviewToggle();

  static const devices = <({
  String label,
  String value,
  Size? size,
  IconData icon,
  })>[
    (
    label: 'Desktop',
    value: 'desktop',
    size: Size(1440, 900),
    icon: Icons.desktop_windows_rounded,
    ),
    (
    label: 'Tablet',
    value: 'tablet',
    size: Size(768, 1024),
    icon: Icons.tablet_rounded,
    ),
    (
    label: 'Mobile',
    value: 'mobile',
    size: Size(390, 844),
    icon: Icons.smartphone_rounded,
    ),
    (
    label: 'Actual Viewport',
    value: 'actual',
    size: null,
    icon: Icons.fit_screen_rounded,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final c = context.c;

    return ValueListenableBuilder<Size?>(
      valueListenable: previewSize,
      builder: (context, selectedSize, _) {
        return PopupMenuButton<String>(
          tooltip: 'Preview viewport',
          color: c.surface,
          surfaceTintColor: Colors.transparent,
          elevation: 12,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
            side: BorderSide(color: c.border),
          ),
          onSelected: (value) {
            final device = devices.firstWhere(
                  (device) => device.value == value,
            );
            previewSize.value = device.size;
          },
          itemBuilder: (context) => [
            for (final device in devices)
              PopupMenuItem<String>(
                value: device.value,
                child: Row(
                  children: [
                    Icon(
                      device.icon,
                      size: 19,
                      color: selectedSize == device.size
                          ? c.accent
                          : c.textMuted,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        device.label,
                        style: body(
                          context,
                          13.5,
                          weight: FontWeight.w600,
                          color: selectedSize == device.size
                              ? c.accent
                              : c.text,
                        ),
                      ),
                    ),
                    if (selectedSize == device.size)
                      Icon(
                        Icons.check_rounded,
                        size: 17,
                        color: c.accent,
                      ),
                  ],
                ),
              ),
          ],
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: selectedSize != null
                  ? c.accent.withValues(alpha: 0.12)
                  : Colors.transparent,
              border: Border.all(
                color: selectedSize != null ? c.accent : c.border,
              ),
            ),
            child: Icon(
              Icons.devices_rounded,
              size: 19,
              color: selectedSize != null ? c.accent : c.text,
            ),
          ),
        );
      },
    );
  }
}

// ---------------------------------------------------------------------------
// Device preview frame
// ---------------------------------------------------------------------------

class _DeviceFrame extends StatelessWidget {
  const _DeviceFrame({
    required this.size,
    required this.isPreview,
    required this.child,
  });

  final Size? size;
  final bool isPreview;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (!isPreview) return child;

    final isMobile = size!.width <= 400;
    final isTablet = size!.width > 400 && size!.width < 1100;

    final radius = isMobile ? 42.0 : isTablet ? 30.0 : 18.0;
    final frameColor = const Color(0xFF252833);
    final padding = isMobile ? 10.0 : isTablet ? 12.0 : 8.0;

    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            margin: const EdgeInsets.all(28),
            padding: EdgeInsets.all(padding),
            decoration: BoxDecoration(
              color: frameColor,
              borderRadius: BorderRadius.circular(radius),
              border: Border.all(
                color: const Color(0xFF454A57),
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.35),
                  blurRadius: 45,
                  offset: const Offset(0, 22),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(radius - padding),
              child: Stack(
                children: [
                  child,
                  if (isMobile)
                    Positioned(
                      top: 7,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Container(
                          width: 75,
                          height: 18,
                          decoration: BoxDecoration(
                            color: frameColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          if (isMobile || isTablet)
            const Positioned(
              top: 28,
              right: -12,
              child: _DevicePreviewToggle(),
            ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Hero
// ---------------------------------------------------------------------------

class HeroSection extends StatelessWidget {
  const HeroSection({super.key, required this.onProjects, required this.onContact});

  final VoidCallback onProjects;
  final VoidCallback onContact;

  @override
  Widget build(BuildContext context) {
    final c = context.c;
    final screen = context.screen;
    final desktop = screen == ScreenSize.desktop;
    final nameSize = context.pick(46, 68, 78);

    final left = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (context.isMobile)
          const SizedBox(height: 32),
        Reveal(
          child: Glass(
            radius: 999,
            blur: 10,
            padding: const EdgeInsets.fromLTRB(12, 6, 18, 6),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const PulseDot(),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(
                    'Open to Part Time Job in Flutter and applied AI',
                    style: body(context, 13, weight: FontWeight.w600, color: c.text, height: 1.3),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: context.pick(24, 28, 32)),
        Reveal(
          delay: const Duration(milliseconds: 100),
          child: Text('Sufyan Afzal', style: display(context, nameSize, height: 1.02)),
        ),
        const SizedBox(height: 10),
        Reveal(
          delay: const Duration(milliseconds: 180),
          child: GradientText(
            'AI Flutter Application Developer',
            style: display(context, context.pick(24, 32, 36), height: 1.15),
          ),
        ),
        const SizedBox(height: 24),
        Reveal(
          delay: const Duration(milliseconds: 260),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 580),
            child: Text(
              'I build Flutter apps where the machine learning runs inside the product. '
                  'ORAS analyzes surgical video, and SLCA translates Pakistan Sign Language fully offline. '
                  'I study Artificial Intelligence at COMSATS University Islamabad and have led engineering teams at Horquva and SafeX Solutions.',
              style: body(context, context.pick(15.5, 17, 17.5), height: 1.7),
            ),
          ),
        ),
        const SizedBox(height: 32),
        Reveal(
          delay: const Duration(milliseconds: 340),
          child: Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              PillButton(label: 'View projects', icon: Icons.arrow_downward_rounded, filled: true, onTap: onProjects),
              PillButton(label: 'GitHub', icon: Icons.code_rounded, onTap: () => openUrl(Links.github)),
              PillButton(label: 'LinkedIn', icon: Icons.work_outline_rounded, onTap: () => openUrl(Links.linkedin)),
            ],
          ),
        ),
        const SizedBox(height: 40),
        Reveal(
          delay: const Duration(milliseconds: 420),
          child: Wrap(
            spacing: context.pick(28, 44, 48),
            runSpacing: 22,
            children: const [
              _Metric(value: '2', label: 'Internships completed'),
              _Metric(value: '9', label: 'Engineers led'),
              _Metric(value: '80', label: 'Signs recognized'),
              _Metric(value: '14.9 KB', label: 'On-device model'),
            ],
          ),
        ),
      ],
    );

    return ContentWrap(
      top: context.pick(120, 150, 160),
      bottom: context.pick(40, 60, 80),
      child: desktop
          ? Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(flex: 6, child: left),
          const SizedBox(width: 56),
          const Expanded(flex: 5, child: _HeroVisual()),
        ],
      )
          : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          left,
          const SizedBox(height: 48),
          const _HeroVisual(),
        ],
      ),
    );
  }
}

class _Metric extends StatelessWidget {
  const _Metric({required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        GradientText(value, style: display(context, context.pick(28, 34, 36), height: 1.1)),
        const SizedBox(height: 4),
        Text(label, style: body(context, 13, weight: FontWeight.w600, height: 1.3)),
      ],
    );
  }
}

class _HeroCardData {
  const _HeroCardData(this.icon, this.title, this.subtitle, this.tag, this.colors);

  final IconData icon;
  final String title;
  final String subtitle;
  final String tag;
  final List<Color> colors;
}

class _HeroVisual extends StatelessWidget {
  const _HeroVisual();

  static const _cards = [
    _HeroCardData(
      Icons.biotech_rounded,
      'ORAS',
      'Surgical video analysis with YOLOv8 and a temporal network',
      'Computer vision',
      [Color(0xFF0D9488), Color(0xFF2563EB)],
    ),
    _HeroCardData(
      Icons.sign_language_rounded,
      'SLCA',
      'Pakistan Sign Language chat, fully offline',
      '14.9 KB model',
      [Color(0xFF7C3AED), Color(0xFF2563EB)],
    ),
    _HeroCardData(
      Icons.groups_rounded,
      'Castor at Horquva',
      'Led a nine-person engineering team',
      'Shining Star award',
      [Color(0xFFF59E0B), Color(0xFFEF4444)],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final desktop = context.screen == ScreenSize.desktop;
    final indents = desktop ? [0.0, 44.0, 14.0] : [0.0, 0.0, 0.0];
    return Column(
      children: [
        for (var i = 0; i < _cards.length; i++)
          Padding(
            padding: EdgeInsets.only(bottom: i == _cards.length - 1 ? 0 : 18),
            child: Reveal(
              delay: Duration(milliseconds: 300 + i * 140),
              child: _FloatCard(data: _cards[i], phase: i, indent: indents[i]),
            ),
          ),
      ],
    );
  }
}

class _FloatCard extends StatefulWidget {
  const _FloatCard({required this.data, required this.phase, required this.indent});

  final _HeroCardData data;
  final int phase;
  final double indent;

  @override
  State<_FloatCard> createState() => _FloatCardState();
}

class _FloatCardState extends State<_FloatCard> with SingleTickerProviderStateMixin {
  late final AnimationController _ac = AnimationController(
    vsync: this,
    duration: Duration(milliseconds: 3600 + widget.phase * 600),
  )..repeat(reverse: true);

  @override
  void dispose() {
    _ac.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final d = widget.data;
    final c = context.c;
    return AnimatedBuilder(
      animation: _ac,
      builder: (context, child) {
        final t = Curves.easeInOut.transform(_ac.value);
        return Transform.translate(offset: Offset(0, (t - 0.5) * 16), child: child);
      },
      child: Padding(
        padding: EdgeInsets.only(left: widget.indent),
        child: Glass(
          radius: 24,
          padding: const EdgeInsets.all(20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: d.colors,
                  ),
                ),
                child: Icon(d.icon, color: Colors.white, size: 26),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(d.title, style: display(context, 19, height: 1.2)),
                    const SizedBox(height: 4),
                    Text(d.subtitle, style: body(context, 13.5, color: c.textMuted, height: 1.5)),
                    const SizedBox(height: 12),
                    Tag(d.tag),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Projects
// ---------------------------------------------------------------------------

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ContentWrap(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            title: 'Selected projects',
            subtitle: 'Flutter apps where the intelligence lives on the device, from surgical video to sign language.',
          ),
          const SizedBox(height: 44),
          LayoutBuilder(
            builder: (context, box) {
              final twoColumns = box.maxWidth >= 760;
              final cards = <Widget>[
                for (var i = 0; i < projects.length; i++)
                  Reveal(
                    delay: Duration(milliseconds: i * 120),
                    child: ProjectCard(data: projects[i], wide: twoColumns && i == 2),
                  ),
              ];
              if (!twoColumns) {
                return Column(
                  children: [
                    for (final card in cards) Padding(padding: const EdgeInsets.only(bottom: 22), child: card),
                  ],
                );
              }
              return Column(
                children: [
                  IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(child: cards[0]),
                        const SizedBox(width: 22),
                        Expanded(child: cards[1]),
                      ],
                    ),
                  ),
                  const SizedBox(height: 22),
                  cards[2],
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key, required this.data, this.wide = false});

  final ProjectData data;
  final bool wide;

  @override
  Widget build(BuildContext context) {
    final c = context.c;
    return Hoverable(
      builder: (context, hover) {
        final visual = _ProjectVisual(data: data, height: wide ? null : 150);
        final content = Padding(
          padding: EdgeInsets.all(context.pick(22, 26, 28)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Tag(data.tag),
              const SizedBox(height: 14),
              Text(data.title, style: display(context, 28, height: 1.1)),
              const SizedBox(height: 4),
              Text(
                data.subtitle,
                style: body(context, 14.5, weight: FontWeight.w700, color: c.accent, height: 1.4),
              ),
              const SizedBox(height: 18),
              for (final p in data.points)
                Padding(padding: const EdgeInsets.only(bottom: 9), child: BulletLine(p)),
              const SizedBox(height: 10),
              Wrap(spacing: 8, runSpacing: 8, children: [for (final s in data.stack) StackChip(s)]),
              const SizedBox(height: 22),
              Wrap(spacing: 10, runSpacing: 10, children: [for (final l in data.links) LinkButton(l)]),
            ],
          ),
        );

        return AnimatedContainer(
          duration: const Duration(milliseconds: 260),
          curve: Curves.easeOut,
          transform: Matrix4.translationValues(0, hover ? -6 : 0, 0),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: c.surface,
            borderRadius: BorderRadius.circular(28),
            border: Border.all(color: hover ? c.accent.withValues(alpha: 0.55) : c.border),
            boxShadow: [
              BoxShadow(
                color: (hover ? c.accent : Colors.black).withValues(alpha: hover ? 0.16 : 0.1),
                blurRadius: hover ? 44 : 26,
                offset: const Offset(0, 18),
              ),
            ],
          ),
          child: wide
              ? IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(width: 300, child: visual),
                Expanded(child: content),
              ],
            ),
          )
              : Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [visual, content],
          ),
        );
      },
    );
  }
}

class _ProjectVisual extends StatelessWidget {
  const _ProjectVisual({required this.data, required this.height});

  final ProjectData data;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: data.colors,
        ),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: -60,
            right: -40,
            child: Container(
              width: 190,
              height: 190,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.1),
              ),
            ),
          ),
          Positioned(
            bottom: -70,
            left: -30,
            child: Container(
              width: 170,
              height: 170,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black.withValues(alpha: 0.1),
              ),
            ),
          ),
          Center(
            child: Container(
              width: 78,
              height: 78,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.18),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Colors.white.withValues(alpha: 0.35)),
              ),
              child: Icon(data.icon, color: Colors.white, size: 40),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Experience
// ---------------------------------------------------------------------------

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});
@override Widget build(BuildContext context) {
  final c = context.c;
return ContentWrap(
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SectionHeader(
        title: 'Experience',
        subtitle: 'Two internships in one summer, building real products and leading a team.', ),
      const SizedBox(height: 44),
      for (var i = 0; i < experiences.length; i++)
        Reveal(
          delay: Duration(milliseconds: i * 120),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox( width: context.pick(26, 40, 44),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Container(
                      width: 14, height: 14,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient( colors: [c.accent, c.accentAlt], ),
                        boxShadow: [ BoxShadow( color: c.accent.withValues(alpha: 0.5),
                          blurRadius: 14,
                        ),
                        ],
                      ),
                    ),
                    if (i != experiences.length - 1)
                      Container( width: 2, height: 40,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        color: c.border,
                      ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: i == experiences.length - 1 ? 0 : 24, ),
                  child: _ExperienceCard(data: experiences[i]),
                ),
              ),
            ],
          ),
        ),
    ],
  ),
);
}
}

class _ExperienceCard extends StatelessWidget {
  const _ExperienceCard({required this.data});

  final ExperienceData data;

  @override
  Widget build(BuildContext context) {
    final c = context.c;
    final mobile = context.isMobile;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(context.pick(18, 28, 32)),
      decoration: BoxDecoration(
        color: c.surface,
        borderRadius: BorderRadius.circular(26),
        border: Border.all(color: c.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (mobile) ...[
            SizedBox(
              width: double.infinity,
              child: Text(
                data.org,
                softWrap: true,
                style: display(context, 22, height: 1.2),
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                StackChip('${data.period}  |  ${data.place}'),
              ],
            ),
          ] else ...[
            Wrap(
              spacing: 14,
              runSpacing: 10,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text(
                  data.org,
                  softWrap: true,
                  style: display(
                    context,
                    context.pick(24, 28, 30),
                  ),
                ),
                StackChip('${data.period}  |  ${data.place}'),
              ],
            ),
          ],
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: Text(
              data.role,
              softWrap: true,
              style: body(
                context,
                15.5,
                weight: FontWeight.w700,
                color: c.accent,
                height: 1.5,
              ),
            ),
          ),
          if (data.badge != null) ...[
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFF59E0B).withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: const Color(0xFFF59E0B)
                      .withValues(alpha: 0.35),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.workspace_premium_rounded,
                    size: 18,
                    color: Color(0xFFF59E0B),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      data.badge!,
                      softWrap: true,
                      style: body(
                        context,
                        13,
                        weight: FontWeight.w700,
                        color: c.text,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
          const SizedBox(height: 18),
          for (final p in data.points)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: BulletLine(p),
            ),
          if (data.link != null) ...[
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [LinkButton(data.link!)],
            ),
          ],
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Skills
// ---------------------------------------------------------------------------

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ContentWrap(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            title: 'Skills',
            subtitle: 'A mobile engineering base with machine learning, agentic AI, and deployment tooling on top.',
          ),
          const SizedBox(height: 44),
          LayoutBuilder(
            builder: (context, box) {
              const gap = 20.0;
              final cols = box.maxWidth >= 980 ? 3 : (box.maxWidth >= 620 ? 2 : 1);
              final itemWidth = (box.maxWidth - gap * (cols - 1)) / cols;
              return Wrap(
                spacing: gap,
                runSpacing: gap,
                children: [
                  for (var i = 0; i < skillGroups.length; i++)
                    SizedBox(
                      width: itemWidth,
                      child: Reveal(
                        delay: Duration(milliseconds: (i % cols) * 100),
                        child: _SkillCard(group: skillGroups[i]),
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _SkillCard extends StatelessWidget {
  const _SkillCard({required this.group});

  final SkillGroup group;

  @override
  Widget build(BuildContext context) {
    final c = context.c;
    return Hoverable(
      builder: (context, hover) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: c.surface,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: hover ? c.accent.withValues(alpha: 0.5) : c.border),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: c.accent.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: Icon(group.icon, size: 21, color: c.accent),
                  ),
                  const SizedBox(width: 12),
                  Text(group.title, style: display(context, 19, height: 1.2)),
                ],
              ),
              const SizedBox(height: 18),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [for (final s in group.items) StackChip(s)],
              ),
            ],
          ),
        );
      },
    );
  }
}

// ---------------------------------------------------------------------------
// Education and certifications
// ---------------------------------------------------------------------------

class BackgroundSection extends StatelessWidget {
  const BackgroundSection({super.key});

  @override
  Widget build(BuildContext context) {
    final c = context.c;

    final education = _InfoCard(
      icon: Icons.school_outlined,
      title: 'Education',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              'BS, Artificial Intelligence',
              softWrap: true,
              style: display(context, 22, height: 1.25),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: Text(
              'COMSATS University Islamabad  |  Expected 2027',
              softWrap: true,
              style: body(
                context,
                14.5,
                weight: FontWeight.w700,
                color: c.accent,
                height: 1.5,
              ),
            ),
          ),
          const SizedBox(height: 18),
          const Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              StackChip('Flutter Application Development'),
              StackChip('Machine Learning'),
              StackChip('Deep Learning'),
              StackChip('Computer Vision'),
              StackChip('NLP'),
              StackChip('Reinforcement Learning'),
            ],
          ),
        ],
      ),
    );

    final certs = _InfoCard(
      icon: Icons.verified_outlined,
      title: 'Certifications',
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BulletLine(
            'Anthropic Agentic AI series: Claude, Model Context Protocol, Agent Skills, SubAgents',
          ),
          SizedBox(height: 10),
          BulletLine('Machine Learning'),
          SizedBox(height: 10),
          BulletLine('Flutter App Development'),
        ],
      ),
    );

    return ContentWrap(
      top: context.pick(20, 30, 40),
      child: Reveal(
        child: LayoutBuilder(
          builder: (context, box) {
            final useColumns = box.maxWidth >= 820;

            if (!useColumns) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  education,
                  const SizedBox(height: 22),
                  certs,
                ],
              );
            }

            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: education),
                const SizedBox(width: 22),
                Expanded(child: certs),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({required this.icon, required this.title, required this.child});

  final IconData icon;
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final c = context.c;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(context.pick(22, 28, 30)),
      decoration: BoxDecoration(
        color: c.surface,
        borderRadius: BorderRadius.circular(26),
        border: Border.all(color: c.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: c.accent, size: 22),
              const SizedBox(width: 10),
              Text(
                title.toUpperCase(),
                style: body(context, 12.5, weight: FontWeight.w800, color: c.textMuted, height: 1.2)
                    .copyWith(letterSpacing: 1.4),
              ),
            ],
          ),
          const SizedBox(height: 20),
          child,
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Contact and footer
// ---------------------------------------------------------------------------

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final c = context.c;
    return ContentWrap(
      child: Reveal(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: context.pick(24, 48, 72),
            vertical: context.pick(44, 64, 84),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(36),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                c.accent.withValues(alpha: context.isDark ? 0.2 : 0.16),
                c.accentAlt.withValues(alpha: context.isDark ? 0.16 : 0.12),
              ],
            ),
            border: Border.all(color: c.accent.withValues(alpha: 0.35)),
          ),
          child: Column(
            children: [
              Text(
                "Let's build something intelligent.",
                textAlign: TextAlign.center,
                style: display(context, context.pick(32, 46, 58), height: 1.08),
              ),
              const SizedBox(height: 18),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 560),
                child: Text(
                  'I am looking for internships in Flutter development and applied AI. '
                      'If you have a team that ships mobile products with real machine learning inside, I would like to hear from you.',
                  textAlign: TextAlign.center,
                  style: body(context, context.pick(15, 16.5, 17), color: c.text.withValues(alpha: 0.75)),
                ),
              ),
              const SizedBox(height: 34),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 12,
                runSpacing: 12,
                children: [
                  PillButton(
                    label: 'sufyanafzalmalik@gmail.com',
                    icon: Icons.mail_outline_rounded,
                    filled: true,
                    onTap: () => openUrl(Links.email),
                  ),
                  PillButton(label: 'LinkedIn', icon: Icons.work_outline_rounded, onTap: () => openUrl(Links.linkedin)),
                  PillButton(label: 'GitHub', icon: Icons.code_rounded, onTap: () => openUrl(Links.github)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final c = context.c;
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 36),
      child: Column(
        children: [
          Divider(color: c.border, height: 40),
          Text(
            '2026 Sufyan Afzal. Designed and built with Flutter.',
            textAlign: TextAlign.center,
            style: body(context, 13, color: c.textMuted),
          ),
        ],
      ),
    );
  }
}