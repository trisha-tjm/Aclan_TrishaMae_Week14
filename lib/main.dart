import 'package:flutter/material.dart';

void main() {
  runApp(const Week14App());
}

class Week14App extends StatelessWidget {
  const Week14App({super.key});

  static const Color royalBlue = Color(0xFF2938E5);
  static const Color searchGray = Color(0xFFEAECEF);
  static const Color cardGray = Color(0xFFF1F3F6);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Week 14 Static UI',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: royalBlue,
          primary: royalBlue,
          onPrimary: Colors.white,
          surface: Colors.white,
          onSurface: const Color(0xFF14171F),
        ),
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
          titleMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Color(0xFF14171F),
          ),
          bodyMedium: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            color: Color(0xFF14171F),
          ),
        ),
      ),
      // para sa screen 2 MoreDealsScreen().
      home: const HomePageScreen(),
    );
  }
}

// ====================
// SCREEN 1: HOME PAGE
// ====================
class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryBlue = Theme.of(context).colorScheme.primary;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        titleSpacing: 16,
        title: Row(
          children: [
            const Icon(Icons.menu, size: 24),
            const SizedBox(width: 10),
            Expanded(
              child: Container(
                height: 38,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Week14App.searchGray,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.search, size: 18, color: Colors.black54),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Search Bar',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 13, color: Colors.black54),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // purposeful stack: welcome
              SizedBox(
                height: 118,
                width: double.infinity,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF0E7490),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    const Positioned(
                      left: 14,
                      right: 14,
                      top: 16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'WELCOME AGAIN!!',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Discover amazing deals just for you....',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),
              Text(
                'Browse by Space',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 10),
              // Row 1 of 2x2 Category Grid
              const Row(
                children: [
                  Expanded(child: _SpaceTile('FOOD', Color(0xFFB45309))),
                  SizedBox(width: 12),
                  Expanded(child: _SpaceTile('PACKAGE', Color(0xFF6D28D9))),
                ],
              ),
              const SizedBox(height: 12),
              // Row 2 of 2x2 Category Grid
              Row(
                children: [
                  const Expanded(
                    child: _SpaceTile('TRAVEL', Color(0xFF047857)),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      height: 88,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color(0xFFD9DCE2),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        'MORE...',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              _CategoryFilterRow(activeColor: primaryBlue),
              const SizedBox(height: 12),
              Container(
                height: 68,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFF1D4ED8),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const _StaticBottomNav(),
    );
  }
}

// =================
// SCREEN 2: MORE
// =================
class MoreDealsScreen extends StatelessWidget {
  const MoreDealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryBlue = Theme.of(context).colorScheme.primary;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.chevron_left, size: 28),
        centerTitle: true,
        title: Text('More', style: Theme.of(context).textTheme.titleMedium),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _CategoryFilterRow(activeColor: primaryBlue),
              const SizedBox(height: 14),
              Container(
                height: 44,
                padding: const EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                  color: primaryBlue,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Show buying option',
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Icon(Icons.chevron_right, color: Colors.white),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(child: _BookDealCard(primaryBlue)),
                  const SizedBox(width: 12),
                  Expanded(child: _BookDealCard(primaryBlue)),
                ],
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  Expanded(child: _BookDealCard(primaryBlue)),
                  const SizedBox(width: 12),
                  Expanded(child: _BookDealCard(primaryBlue)),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const _StaticBottomNav(),
    );
  }
}

// ==========================
// SHARED STATELESS WIDGETS
// ==========================
class _SpaceTile extends StatelessWidget {
  const _SpaceTile(this.label, this.color);

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 88,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          Positioned(
            left: 8,
            right: 8,
            bottom: 8,
            child: Text(
              label,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 12,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BookDealCard extends StatelessWidget {
  const _BookDealCard(this.primaryBlue);

  final Color primaryBlue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Week14App.cardGray,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Container(
            height: 82,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFF0284C7),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            height: 28,
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: primaryBlue,
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Text(
              'BOOK',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CategoryFilterRow extends StatelessWidget {
  const _CategoryFilterRow({required this.activeColor});

  final Color activeColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: activeColor,
            borderRadius: BorderRadius.circular(4),
          ),
          child: const Text(
            'All',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const Text('Food'),
        const Text('Travel'),
        const Text('Package'),
      ],
    );
  }
}

class _StaticBottomNav extends StatelessWidget {
  const _StaticBottomNav();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 28),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Color(0xFFE0E3E8))),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.home_outlined),
          Icon(Icons.search),
          Icon(Icons.settings_outlined),
        ],
      ),
    );
  }
}
