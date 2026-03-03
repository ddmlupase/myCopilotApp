import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../data/gadgets_data.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String _selectedCategory = 'All';

  List<String> get _categories {
    final cats = gadgetsList.map((g) => g.category).toSet().toList();
    cats.sort();
    return ['All', ...cats];
  }

  List<Gadget> get _filteredGadgets {
    if (_selectedCategory == 'All') return gadgetsList;
    return gadgetsList
        .where((g) => g.category == _selectedCategory)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    // Responsiveness: LayoutBuilder + MediaQuery
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth > 600;

          return CustomScrollView(
            slivers: [
              // Gradient AppBar
              SliverAppBar(
                expandedHeight: 130,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    decoration: const BoxDecoration(
                      gradient: AppTheme.instagramGradient,
                    ),
                    child: SafeArea(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(
                            '📱 Lupase',
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                              letterSpacing: 1.2,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Discover the latest tech',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.85),
                              fontSize: 13,
                            ),
                          ),
                          const SizedBox(height: 12),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // Category Filter Chips
              SliverToBoxAdapter(
                child: Container(
                  color: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: _categories.map((cat) {
                        final isSelected = cat == _selectedCategory;
                        return Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 4),
                          child: GestureDetector(
                            onTap: () =>
                                setState(() => _selectedCategory = cat),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 250),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 8),
                              decoration: BoxDecoration(
                                gradient: isSelected
                                    ? AppTheme.instagramGradient
                                    : null,
                                color: isSelected
                                    ? null
                                    : Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: isSelected
                                      ? Colors.transparent
                                      : Colors.grey.shade300,
                                ),
                              ),
                              child: Text(
                                cat,
                                style: TextStyle(
                                  color: isSelected
                                      ? Colors.white
                                      : Colors.grey.shade700,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),

              // Item Count
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                  child: Text(
                    '${_filteredGadgets.length} item${_filteredGadgets.length != 1 ? 's' : ''} found',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),

              // Gadget Cards — Grid on wide, single column on narrow
              SliverPadding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                sliver: isWide
                    ? SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                          (ctx, i) =>
                              _GadgetCard(gadget: _filteredGadgets[i]),
                          childCount: _filteredGadgets.length,
                        ),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.80,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                        ),
                      )
                    : SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (ctx, i) => Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: _GadgetCard(gadget: _filteredGadgets[i]),
                          ),
                          childCount: _filteredGadgets.length,
                        ),
                      ),
              ),

              const SliverToBoxAdapter(child: SizedBox(height: 24)),
            ],
          );
        },
      ),
    );
  }
}

// ─── Gadget Card Widget ──────────────────────────────────────────────────────
class _GadgetCard extends StatelessWidget {
  final Gadget gadget;
  const _GadgetCard({required this.gadget});

  // Alternates gradient style based on index hint
  LinearGradient get _badgeGradient {
    const warm = AppTheme.cardGradientWarm;
    const cool = AppTheme.cardGradient;
    final useWarm = gadget.id.hashCode.isEven;
    return useWarm ? warm : cool;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image with gradient badge overlay
          Stack(
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.network(
                  gadget.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    color: Colors.grey.shade200,
                    child: const Icon(Icons.image_not_supported_outlined,
                        size: 40, color: Colors.grey),
                  ),
                  loadingBuilder: (_, child, progress) {
                    if (progress == null) return child;
                    return Container(
                      color: Colors.grey.shade100,
                      child: const Center(
                          child: CircularProgressIndicator(strokeWidth: 2)),
                    );
                  },
                ),
              ),
              // Category badge
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    gradient: _badgeGradient,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    gadget.category,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Card content
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 12, 14, 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name
                Text(
                  gadget.name,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF1A1A2E),
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),

                // Brand chip
                Row(
                  children: [
                    const Icon(Icons.storefront_outlined,
                        size: 14, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(
                      gadget.brand,
                      style: const TextStyle(
                          fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                // Price with gradient text effect via ShaderMask
                ShaderMask(
                  blendMode: BlendMode.srcIn,
                  shaderCallback: (bounds) =>
                      AppTheme.instagramGradient.createShader(bounds),
                  child: Text(
                    '\$${gadget.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                    ),
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