import 'package:flutter/material.dart';
import '../data/gadgets_data.dart';
import '../theme/app_theme.dart';

class ItemDetailScreen extends StatefulWidget {
  final Gadget gadget;
  const ItemDetailScreen({super.key, required this.gadget});

  @override
  State<ItemDetailScreen> createState() => _ItemDetailScreenState();
}

class _ItemDetailScreenState extends State<ItemDetailScreen> {
  late int _selectedColorIndex;

  @override
  void initState() {
    super.initState();
    _selectedColorIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    final gadget = widget.gadget;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F7),
      body: isLandscape
          ? _buildLandscapeLayout(gadget)
          : _buildPortraitLayout(gadget),
    );
  }

  // ─── Portrait Layout ────────────────────────────────────────────────────────
  Widget _buildPortraitLayout(Gadget gadget) {
    return CustomScrollView(
      slivers: [
        _buildSliverAppBar(gadget, 320),
        SliverToBoxAdapter(child: _buildDetailsContent(gadget)),
      ],
    );
  }

  // ─── Landscape Layout ───────────────────────────────────────────────────────
  Widget _buildLandscapeLayout(Gadget gadget) {
    return Row(
      children: [
        // Left: image
        Expanded(
          flex: 4,
          child: Column(
            children: [
              SafeArea(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: IconButton(
                      icon: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.15),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.arrow_back_ios_new,
                            color: Color(0xFF1D1D1F), size: 18),
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Hero(
                    tag: 'gadget-${gadget.id}',
                    child: Image.network(
                      gadget.imageUrl,
                      fit: BoxFit.contain,
                      errorBuilder: (_, __, ___) => Icon(
                        Icons.image_not_supported_outlined,
                        size: 80,
                        color: Colors.grey.shade300,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // Right: details
        Expanded(
          flex: 6,
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(top: 8),
            child: _buildDetailsContent(gadget),
          ),
        ),
      ],
    );
  }

  // ─── Sliver App Bar ─────────────────────────────────────────────────────────
  Widget _buildSliverAppBar(Gadget gadget, double expandedHeight) {
    return SliverAppBar(
      expandedHeight: expandedHeight,
      pinned: true,
      leading: IconButton(
        icon: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.arrow_back_ios_new,
              color: Colors.white, size: 18),
        ),
        onPressed: () => Navigator.pop(context),
      ),

      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.grey.shade100, Colors.grey.shade50],
            ),
          ),
          child: Center(
            child: Hero(
              tag: 'gadget-${gadget.id}',
              child: Image.network(
                gadget.imageUrl,
                height: 220,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) => Icon(
                  Icons.image_not_supported_outlined,
                  size: 80,
                  color: Colors.grey.shade300,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ─── Details Content (all fields) ───────────────────────────────────────────
  Widget _buildDetailsContent(Gadget gadget) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      padding: const EdgeInsets.fromLTRB(24, 28, 24, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Brand + Category badges
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _GradientBadge(label: gadget.brand),
              _GradientBadge(
                  label: gadget.category,
                  gradient: AppTheme.cardGradientWarm),
            ],
          ),
          const SizedBox(height: 14),

          // ID
          Text(
            'ID: ${gadget.id}',
            style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade400,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),

          // Name
          Text(
            gadget.name,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w800,
              color: Color(0xFF1D1D1F),
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 8),

          // Price
          ShaderMask(
            blendMode: BlendMode.srcIn,
            shaderCallback: (bounds) =>
                AppTheme.instagramGradient.createShader(bounds),
            child: Text(
              '\$${gadget.price.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w900),
            ),
          ),
          const SizedBox(height: 6),

          // Image URL
          Row(
            children: [
              Icon(Icons.link_rounded, size: 14, color: Colors.grey.shade400),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  gadget.imageUrl,
                  style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey.shade400,
                      overflow: TextOverflow.ellipsis),
                  maxLines: 1,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Description
          const _SectionTitle(title: 'Description'),
          const SizedBox(height: 8),
          Text(
            gadget.description,
            style: TextStyle(
                fontSize: 15, color: Colors.grey.shade600, height: 1.6),
          ),
          const SizedBox(height: 28),

          // Available Colors
          _SectionTitle(
              title: 'Available Colors (${gadget.availableColors.length})'),
          const SizedBox(height: 12),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: List.generate(gadget.availableColors.length, (i) {
              final isSelected = i == _selectedColorIndex;
              return GestureDetector(
                onTap: () => setState(() => _selectedColorIndex = i),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: gadget.availableColors[i],
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isSelected
                              ? AppTheme.gradientMid2
                              : Colors.grey.shade300,
                          width: isSelected ? 3 : 1.5,
                        ),
                        boxShadow: isSelected
                            ? [
                                BoxShadow(
                                  color:
                                      AppTheme.gradientMid2.withOpacity(0.3),
                                  blurRadius: 8,
                                  spreadRadius: 1,
                                )
                              ]
                            : null,
                      ),
                      child: isSelected
                          ? Icon(Icons.check,
                              size: 18,
                              color: gadget.availableColors[i]
                                          .computeLuminance() >
                                      0.5
                                  ? Colors.black
                                  : Colors.white)
                          : null,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      gadget.colorNames[i],
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight:
                            isSelected ? FontWeight.w700 : FontWeight.w500,
                        color: isSelected
                            ? AppTheme.gradientMid2
                            : Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
          const SizedBox(height: 28),

          // Specifications
          const _SectionTitle(title: 'Specifications'),
          const SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: const Color(0xFFF5F5F7),
            ),
            clipBehavior: Clip.antiAlias,
            child: Column(
              children:
                  gadget.specs.entries.toList().asMap().entries.map((e) {
                final idx = e.key;
                final entry = e.value;
                return Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 14),
                  decoration: BoxDecoration(
                    color: idx.isEven
                        ? const Color(0xFFF5F5F7)
                        : const Color(0xFFEFEFF1),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 110,
                        child: Text(
                          entry.key,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          entry.value,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1D1D1F),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 28),

          // All Product Data summary
          const _SectionTitle(title: 'All Product Data'),
          const SizedBox(height: 12),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F7),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _DataRow(label: 'ID', value: gadget.id),
                _DataRow(label: 'Name', value: gadget.name),
                _DataRow(
                    label: 'Price',
                    value: '\$${gadget.price.toStringAsFixed(2)}'),
                _DataRow(label: 'Brand', value: gadget.brand),
                _DataRow(label: 'Category', value: gadget.category),
                _DataRow(label: 'Image URL', value: gadget.imageUrl),
                _DataRow(
                    label: 'Colors', value: gadget.colorNames.join(', ')),
                _DataRow(label: 'Description', value: gadget.description),
                ...gadget.specs.entries.map(
                    (e) => _DataRow(label: 'Spec: ${e.key}', value: e.value)),
              ],
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

// ─── Helper Widgets ──────────────────────────────────────────────────────────

class _GradientBadge extends StatelessWidget {
  final String label;
  final LinearGradient? gradient;
  const _GradientBadge({required this.label, this.gradient});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        gradient: gradient ?? AppTheme.instagramGradient,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(label,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w700)),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1D1D1F)));
  }
}

class _DataRow extends StatelessWidget {
  final String label;
  final String value;
  const _DataRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 90,
            child: Text(label,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade500)),
          ),
          Expanded(
            child: Text(value,
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1D1D1F))),
          ),
        ],
      ),
    );
  }
}
