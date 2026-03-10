import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../main.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final scaffoldBg = isDark ? const Color(0xFF121212) : const Color(0xFFF5F5F7);
    final cardBg = isDark ? const Color(0xFF1E1E1E) : Colors.white;
    final textColor = isDark ? Colors.white : const Color(0xFF1D1D1F);
    final subtitleColor = isDark ? Colors.grey.shade400 : Colors.grey.shade500;

    return Scaffold(
      backgroundColor: scaffoldBg,
      appBar: AppBar(
        backgroundColor: cardBg,
        surfaceTintColor: cardBg,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 18),
          color: textColor,
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'My Account',
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w800,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // ─── Profile Card ──────────────────────────
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: AppTheme.instagramGradient,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.gradientMid2.withOpacity(0.3),
                    blurRadius: 16,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Profile Image (actual photo)
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 3),
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/danieldavid.jpg',
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Daniel David Lupase',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      letterSpacing: -0.3,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'daniel.lupase@email.com',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.85),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'BSIT - 3rd Year | Gadget Enthusiast',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Member since 2024',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Stats row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _ProfileStat(label: 'Orders', value: '12'),
                      Container(
                          width: 1,
                          height: 30,
                          color: Colors.white.withOpacity(0.3)),
                      _ProfileStat(label: 'Wishlist', value: '5'),
                      Container(
                          width: 1,
                          height: 30,
                          color: Colors.white.withOpacity(0.3)),
                      _ProfileStat(label: 'Reviews', value: '8'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // ─── Personal Info Section ─────────────────
            _SectionHeader(title: 'Personal Information', textColor: textColor),
            const SizedBox(height: 8),
            _SettingsCard(
              cardBg: cardBg,
              children: [
                _InfoTile(
                  icon: Icons.person_outline_rounded,
                  title: 'Full Name',
                  value: 'Daniel David Lupase',
                  textColor: textColor,
                  subtitleColor: subtitleColor,
                ),
                Divider(height: 1, indent: 56, color: isDark ? Colors.white12 : null),
                _InfoTile(
                  icon: Icons.email_outlined,
                  title: 'Email',
                  value: 'daniel.lupase@email.com',
                  textColor: textColor,
                  subtitleColor: subtitleColor,
                ),
                Divider(height: 1, indent: 56, color: isDark ? Colors.white12 : null),
                _InfoTile(
                  icon: Icons.phone_outlined,
                  title: 'Phone',
                  value: '+63 912 345 6789',
                  textColor: textColor,
                  subtitleColor: subtitleColor,
                ),
                Divider(height: 1, indent: 56, color: isDark ? Colors.white12 : null),
                _InfoTile(
                  icon: Icons.cake_outlined,
                  title: 'Birthday',
                  value: 'January 15, 2003',
                  textColor: textColor,
                  subtitleColor: subtitleColor,
                ),
                Divider(height: 1, indent: 56, color: isDark ? Colors.white12 : null),
                _InfoTile(
                  icon: Icons.location_on_outlined,
                  title: 'Address',
                  value: 'Cagayan de Oro City, Philippines',
                  textColor: textColor,
                  subtitleColor: subtitleColor,
                ),
              ],
            ),
            const SizedBox(height: 24),

            // ─── Account Section ───────────────────────
            _SectionHeader(title: 'Account', textColor: textColor),
            const SizedBox(height: 8),
            _SettingsCard(
              cardBg: cardBg,
              children: [
                _SettingsTile(
                  icon: Icons.person_outline_rounded,
                  title: 'Edit Profile',
                  subtitle: 'Update your personal information',
                  textColor: textColor,
                  subtitleColor: subtitleColor,
                  onTap: () {},
                ),
                Divider(height: 1, indent: 56, color: isDark ? Colors.white12 : null),
                _SettingsTile(
                  icon: Icons.location_on_outlined,
                  title: 'Shipping Addresses',
                  subtitle: '2 addresses saved',
                  textColor: textColor,
                  subtitleColor: subtitleColor,
                  onTap: () {},
                ),
                Divider(height: 1, indent: 56, color: isDark ? Colors.white12 : null),
                _SettingsTile(
                  icon: Icons.credit_card_outlined,
                  title: 'Payment Methods',
                  subtitle: 'Visa ending in 4242',
                  textColor: textColor,
                  subtitleColor: subtitleColor,
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 24),

            // ─── Shopping Section ──────────────────────
            _SectionHeader(title: 'Shopping', textColor: textColor),
            const SizedBox(height: 8),
            _SettingsCard(
              cardBg: cardBg,
              children: [
                _SettingsTile(
                  icon: Icons.receipt_long_outlined,
                  title: 'Order History',
                  subtitle: 'View past orders',
                  textColor: textColor,
                  subtitleColor: subtitleColor,
                  onTap: () {},
                ),
                Divider(height: 1, indent: 56, color: isDark ? Colors.white12 : null),
                _SettingsTile(
                  icon: Icons.favorite_border_rounded,
                  title: 'Wishlist',
                  subtitle: '5 items saved',
                  textColor: textColor,
                  subtitleColor: subtitleColor,
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 24),

            // ─── Settings Section ──────────────────────
            _SectionHeader(title: 'Settings', textColor: textColor),
            const SizedBox(height: 8),
            _SettingsCard(
              cardBg: cardBg,
              children: [
                _SettingsTile(
                  icon: Icons.notifications_outlined,
                  title: 'Notifications',
                  subtitle: 'Manage notification preferences',
                  textColor: textColor,
                  subtitleColor: subtitleColor,
                  onTap: () {},
                  trailing: Switch(
                    value: true,
                    onChanged: (_) {},
                    activeColor: AppTheme.gradientMid2,
                  ),
                ),
                Divider(height: 1, indent: 56, color: isDark ? Colors.white12 : null),
                _SettingsTile(
                  icon: Icons.dark_mode_outlined,
                  title: 'Dark Mode',
                  subtitle: isDark ? 'Dark theme active' : 'Light theme active',
                  textColor: textColor,
                  subtitleColor: subtitleColor,
                  onTap: () {},
                  trailing: Switch(
                    value: themeProvider.isDarkMode,
                    onChanged: (val) {
                      themeProvider.toggleTheme(val);
                    },
                    activeColor: AppTheme.gradientMid2,
                  ),
                ),
                Divider(height: 1, indent: 56, color: isDark ? Colors.white12 : null),
                _SettingsTile(
                  icon: Icons.language_outlined,
                  title: 'Language',
                  subtitle: 'English',
                  textColor: textColor,
                  subtitleColor: subtitleColor,
                  onTap: () {},
                ),
                Divider(height: 1, indent: 56, color: isDark ? Colors.white12 : null),
                _SettingsTile(
                  icon: Icons.shield_outlined,
                  title: 'Privacy & Security',
                  subtitle: 'Manage your data',
                  textColor: textColor,
                  subtitleColor: subtitleColor,
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 24),

            // ─── Support Section ───────────────────────
            _SectionHeader(title: 'Support', textColor: textColor),
            const SizedBox(height: 8),
            _SettingsCard(
              cardBg: cardBg,
              children: [
                _SettingsTile(
                  icon: Icons.help_outline_rounded,
                  title: 'Help Center',
                  subtitle: 'FAQ and support',
                  textColor: textColor,
                  subtitleColor: subtitleColor,
                  onTap: () {},
                ),
                Divider(height: 1, indent: 56, color: isDark ? Colors.white12 : null),
                _SettingsTile(
                  icon: Icons.info_outline_rounded,
                  title: 'About',
                  subtitle: 'Lupase Tech Store v1.0.0',
                  textColor: textColor,
                  subtitleColor: subtitleColor,
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Log Out Button
            SizedBox(
              width: double.infinity,
              height: 52,
              child: OutlinedButton.icon(
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                icon: const Icon(Icons.logout_rounded, size: 20),
                label: const Text(
                  'Log Out',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                ),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.red.shade400,
                  side: BorderSide(color: Colors.red.shade300, width: 1.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

// ─── Helper Widgets ──────────────────────────────────────────────────────────

class _ProfileStat extends StatelessWidget {
  final String label;
  final String value;
  const _ProfileStat({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.white.withOpacity(0.8),
          ),
        ),
      ],
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final Color textColor;
  const _SectionHeader({required this.title, required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w800,
          color: textColor,
          letterSpacing: -0.3,
        ),
      ),
    );
  }
}

class _SettingsCard extends StatelessWidget {
  final List<Widget> children;
  final Color cardBg;
  const _SettingsCard({required this.children, required this.cardBg});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(children: children),
    );
  }
}

class _InfoTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final Color textColor;
  final Color subtitleColor;

  const _InfoTile({
    required this.icon,
    required this.title,
    required this.value,
    required this.textColor,
    required this.subtitleColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white.withOpacity(0.08)
              : const Color(0xFFF5F5F7),
          borderRadius: BorderRadius.circular(10),
        ),
        child: ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (bounds) =>
              AppTheme.instagramGradient.createShader(bounds),
          child: Icon(icon, size: 22),
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: subtitleColor,
        ),
      ),
      subtitle: Text(
        value,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final Widget? trailing;
  final Color textColor;
  final Color subtitleColor;

  const _SettingsTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    required this.textColor,
    required this.subtitleColor,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white.withOpacity(0.08)
              : const Color(0xFFF5F5F7),
          borderRadius: BorderRadius.circular(10),
        ),
        child: ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (bounds) =>
              AppTheme.instagramGradient.createShader(bounds),
          child: Icon(icon, size: 22),
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(fontSize: 12, color: subtitleColor),
      ),
      trailing: trailing ??
          Icon(Icons.chevron_right_rounded,
              color: Colors.grey.shade400, size: 22),
      onTap: onTap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    );
  }
}
