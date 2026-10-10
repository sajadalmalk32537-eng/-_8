
import 'package:flutter/material.dart';

void main() {
  runApp(const TumaneenaApp());
}

const Color bg = Color(0xFF0B0D0D);
const Color panel = Color(0xFF171B19);
const Color gold = Color(0xFFD9B66D);
const Color teal = Color(0xFF54C8B0);
const Color muted = Color(0xFF9DA7A1);

class TumaneenaApp extends StatelessWidget {
  const TumaneenaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'طمأنينة',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: bg,
        colorScheme: const ColorScheme.dark(
          primary: gold,
          secondary: teal,
          surface: panel,
        ),
        fontFamily: 'Arial',
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int page = 0;

  final pages = const [
    HomePage(),
    TasbeehPage(),
    LibraryPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(child: pages[page]),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            color: Color(0xFF111513),
            border: Border(
              top: BorderSide(color: Color(0xFF29302B)),
            ),
          ),
          child: NavigationBar(
            backgroundColor: const Color(0xFF111513),
            indicatorColor: gold.withOpacity(0.15),
            selectedIndex: page,
            onDestinationSelected: (i) {
              setState(() => page = i);
            },
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home_outlined),
                selectedIcon: Icon(Icons.home, color: gold),
                label: 'الرئيسية',
              ),
              NavigationDestination(
                icon: Icon(Icons.circle_outlined),
                selectedIcon: Icon(Icons.circle, color: gold),
                label: 'المسبحة',
              ),
              NavigationDestination(
                icon: Icon(Icons.menu_book_outlined),
                selectedIcon: Icon(Icons.menu_book, color: gold),
                label: 'المكتبة',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void openSection(BuildContext context, String title, String description) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => SectionPage(
          title: title,
          description: description,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 28),
      children: [
        Row(
          children: [
            Container(
              width: 49,
              height: 49,
              decoration: BoxDecoration(
                color: gold.withOpacity(0.12),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: gold.withOpacity(0.4)),
              ),
              child: const Icon(
                Icons.nightlight_round,
                color: gold,
                size: 29,
              ),
            ),
            const SizedBox(width: 12),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'طُمَأْنِينَة',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: gold,
                      letterSpacing: 1,
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    'مساحةٌ يطمئنّ بها القلب',
                    style: TextStyle(color: muted, fontSize: 12),
                  ),
                ],
              ),
            ),
            const Icon(Icons.notifications_none, color: muted, size: 27),
          ],
        ),

        const SizedBox(height: 27),

        Container(
          padding: const EdgeInsets.all(23),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(27),
            gradient: const LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFF293B34),
                Color(0xFF17231F),
                Color(0xFF151916),
              ],
            ),
            border: Border.all(color: gold.withOpacity(0.30)),
          ),
          child: Stack(
            children: [
              Positioned(
                left: -5,
                top: 2,
                child: Icon(
                  Icons.auto_awesome,
                  color: gold.withOpacity(0.18),
                  size: 90,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.auto_awesome, color: gold, size: 18),
                      SizedBox(width: 8),
                      Text(
                        'وَرْدُ اليوم',
                        style: TextStyle(color: gold, fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(height: 22),
                  const Text(
                    'أَلَا بِذِكْرِ اللَّهِ\nتَطْمَئِنُّ الْقُلُوبُ',
                    style: TextStyle(
                      fontSize: 27,
                      height: 1.8,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'سورة الرعد، الآية ٢٨',
                    style: TextStyle(color: muted, fontSize: 12),
                  ),
                  const SizedBox(height: 22),
                  OutlinedButton.icon(
                    onPressed: () => openSection(
                      context,
                      'ورد اليوم',
                      'ابدأ يومك بذكر الله، واجعل لقلبك وقتاً للسكينة والتأمل.',
                    ),
                    icon: const Icon(Icons.arrow_back, size: 17),
                    label: const Text('ابدأ وردك'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: gold,
                      side: BorderSide(color: gold.withOpacity(0.7)),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 19,
                        vertical: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: 25),

        const Row(
          children: [
            Text(
              'أوقات الروح',
              style: TextStyle(
                color: Colors.white,
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            Icon(Icons.spa_outlined, color: teal, size: 21),
          ],
        ),
        const SizedBox(height: 13),

        Container(
          padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 12),
          decoration: BoxDecoration(
            color: panel,
            borderRadius: BorderRadius.circular(21),
            border: Border.all(color: Colors.white.withOpacity(0.06)),
          ),
          child: const Row(
            children: [
              Expanded(
                child: PrayerTime(
                  icon: Icons.wb_twilight,
                  name: 'الفجر',
                  time: '—:—',
                ),
              ),
              Expanded(
                child: PrayerTime(
                  icon: Icons.wb_sunny_outlined,
                  name: 'الظهر',
                  time: '—:—',
                ),
              ),
              Expanded(
                child: PrayerTime(
                  icon: Icons.sunny,
                  name: 'العصر',
                  time: '—:—',
                ),
              ),
              Expanded(
                child: PrayerTime(
                  icon: Icons.nights_stay_outlined,
                  name: 'المغرب',
                  time: '—:—',
                ),
              ),
              Expanded(
                child: PrayerTime(
                  icon: Icons.dark_mode_outlined,
                  name: 'العشاء',
                  time: '—:—',
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 27),

        const Text(
          'اقترب مما يطمئن قلبك',
          style: TextStyle(
            color: Colors.white,
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 15),

        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 13,
          crossAxisSpacing: 13,
          childAspectRatio: 1.16,
          children: [
            FeatureCard(
              icon: Icons.menu_book_rounded,
              title: 'القرآن الكريم',
              subtitle: 'تلاوة وتدبّر',
              color: gold,
              onTap: () => openSection(
                context,
                'القرآن الكريم',
                'قسم القرآن الكريم: ستُضاف إليه السور والتلاوة والتفسير من مصادر موثوقة.',
              ),
            ),
            FeatureCard(
              icon: Icons.volunteer_activism_outlined,
              title: 'الأدعية والزيارات',
              subtitle: 'مناجاة وذكر',
              color: teal,
              onTap: () => openSection(
                context,
                'الأدعية والزيارات',
                'مساحة للأدعية والمناجاة والزيارات مع ذكر مصادر النصوص.',
              ),
            ),
            FeatureCard(
              icon: Icons.auto_awesome,
              title: 'أهل البيت (ع)',
              subtitle: 'السيرة والفضائل',
              color: gold,
              onTap: () => openSection(
                context,
                'أهل البيت (ع)',
                'سيرة أهل البيت عليهم السلام وأقوالهم مع توثيق المصادر.',
              ),
            ),
            FeatureCard(
              icon: Icons.nightlight_outlined,
              title: 'صلاة الليل',
              subtitle: 'خطوات وأعمال',
              color: teal,
              onTap: () => openSection(
                context,
                'صلاة الليل',
                'شرح مبسّط لكيفية صلاة الليل وأعمالها، مع مراعاة الأحكام الفقهية الموثوقة.',
              ),
            ),
            FeatureCard(
              icon: Icons.menu_book_outlined,
              title: 'المسائل الفقهية',
              subtitle: 'تعلّم واسأل',
              color: teal,
              onTap: () => openSection(
                context,
                'المسائل الفقهية',
                'ستُضاف مسائل وأجوبة موثقة وفق المصادر الفقهية المعتمدة.',
              ),
            ),
            FeatureCard(
              icon: Icons.favorite_border,
              title: 'كلمات للقلب',
              subtitle: 'حكمة وتأمّل',
              color: gold,
              onTap: () => openSection(
                context,
                'كلمات للقلب',
                'حِكم وتأملات عن الصبر والتوكل والرحمة وقيمة الإنسان.',
              ),
            ),
          ],
        ),

        const SizedBox(height: 24),
        Center(
          child: Text(
            'اللهم اجعل هذا العمل خالصاً لوجهك الكريم',
            style: TextStyle(
              color: muted.withOpacity(0.8),
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

class PrayerTime extends StatelessWidget {
  final IconData icon;
  final String name;
  final String time;

  const PrayerTime({
    super.key,
    required this.icon,
    required this.name,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: gold, size: 21),
        const SizedBox(height: 9),
        Text(
          name,
          style: const TextStyle(color: muted, fontSize: 11),
        ),
        const SizedBox(height: 6),
        Text(
          time,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

class FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;

  const FeatureCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(22),
      child: Container(
        padding: const EdgeInsets.all(17),
        decoration: BoxDecoration(
          color: panel,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: color.withOpacity(0.16)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 43,
              height: 43,
              decoration: BoxDecoration(
                color: color.withOpacity(0.12),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(icon, color: color, size: 24),
            ),
            const SizedBox(height: 13),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              subtitle,
              style: const TextStyle(color: muted, fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }
}

class TasbeehPage extends StatefulWidget {
  const TasbeehPage({super.key});

  @override
  State<TasbeehPage> createState() => _TasbeehPageState();
}

class _TasbeehPageState extends State<TasbeehPage> {
  int count = 0;
  int stage = 0;

  final List<String> phrases = [
    'الله أكبر',
    'الحمد لله',
    'سبحان الله',
  ];

  final List<int> targets = [34, 33, 33];

  void increment() {
    setState(() {
      if (count < targets[stage]) {
        count++;
      }

      if (count == targets[stage]) {
        if (stage < 2) {
          stage++;
          count = 0;
        } else {
          count = targets[stage];
        }
      }
    });
  }

  void reset() {
    setState(() {
      count = 0;
      stage = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final progress = count / targets[stage];

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const SizedBox(height: 20),
          const Icon(Icons.spa_outlined, color: gold, size: 35),
          const SizedBox(height: 10),
          const Text(
            'المسبحة الإلكترونية',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 7),
          const Text(
            'تسبيح فاطمة الزهراء (ع)',
            style: TextStyle(color: muted, fontSize: 14),
          ),
          const Spacer(),
          Text(
            phrases[stage],
            style: const TextStyle(
              color: gold,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 25),
          GestureDetector(
            onTap: increment,
            child: Container(
              width: 235,
              height: 235,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF30453B),
                    Color(0xFF17211C),
                    Color(0xFF101412),
                  ],
                ),
                border: Border.all(
                  color: gold.withOpacity(0.75),
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: gold.withOpacity(0.08),
                    blurRadius: 35,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$count',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 66,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Text(
                    'من ${targets[stage]}',
                    style: const TextStyle(color: muted, fontSize: 14),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'اضغط للتسبيح',
                    style: TextStyle(color: gold, fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 28),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 6,
              backgroundColor: Colors.white12,
              valueColor: const AlwaysStoppedAnimation(gold),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'المرحلة ${stage + 1} من 3',
            style: const TextStyle(color: muted, fontSize: 13),
          ),
          const Spacer(),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: reset,
                  icon: const Icon(Icons.refresh),
                  label: const Text('إعادة'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: muted,
                    side: const BorderSide(color: Colors.white24),
                    padding: const EdgeInsets.all(15),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: increment,
                  icon: const Icon(Icons.add),
                  label: const Text('سبّح'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: gold,
                    foregroundColor: bg,
                    padding: const EdgeInsets.all(15),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(22),
      children: [
        const SizedBox(height: 12),
        const Text(
          'مكتبة طمأنينة',
          style: TextStyle(
            color: gold,
            fontSize: 27,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'زادٌ للروح، ونورٌ للطريق',
          style: TextStyle(color: muted, fontSize: 14),
        ),
        const SizedBox(height: 26),
        const LibraryTile(
          icon: Icons.menu_book,
          title: 'القرآن الكريم',
          subtitle: 'السور والتلاوة والتفسير',
        ),
        const LibraryTile(
          icon: Icons.favorite_outline,
          title: 'الأدعية والمناجاة',
          subtitle: 'نصوص مرتبة مع المصادر',
        ),
        const LibraryTile(
          icon: Icons.account_balance_outlined,
          title: 'سيرة أهل البيت (ع)',
          subtitle: 'محطات من حياتهم وتعاليمهم',
        ),
        const LibraryTile(
          icon: Icons.nightlight_round,
          title: 'صلاة الليل',
          subtitle: 'الطريقة والأعمال المستحبة',
        ),
        const LibraryTile(
          icon: Icons.question_answer_outlined,
          title: 'المسائل الفقهية',
          subtitle: 'أسئلة وأجوبة من مصادر موثوقة',
        ),
        const SizedBox(height: 20),
        const Text(
          'هذه الأقسام واجهات أولية؛ محتوى الكتب والمصادر يحتاج إلى إضافته والتحقق منه.',
          style: TextStyle(color: muted, fontSize: 12, height: 1.7),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class LibraryTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const LibraryTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: panel,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withOpacity(0.06)),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 17,
          vertical: 8,
        ),
        leading: Container(
          width: 46,
          height: 46,
          decoration: BoxDecoration(
            color: gold.withOpacity(0.12),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Icon(icon, color: gold),
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(
            subtitle,
            style: const TextStyle(color: muted, fontSize: 12),
          ),
        ),
        trailing: const Icon(
          Icons.arrow_back_ios_new,
          color: muted,
          size: 16,
        ),
      ),
    );
  }
}

class SectionPage extends StatelessWidget {
  final String title;
  final String description;

  const SectionPage({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: bg,
          foregroundColor: gold,
          title: Text(title),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(28),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.auto_awesome,
                  color: gold,
                  size: 58,
                ),
                const SizedBox(height: 22),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: gold,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: muted,
                    fontSize: 15,
                    height: 1.9,
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'قريباً بإذن الله',
                  style: TextStyle(color: teal, fontSize: 14),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
