import 'package:flutter/material.dart';
import 'package:project/core/constants/app_constant.dart';
import 'package:project/features/profile/data/models/profile_model.dart';

class ModernProfileCard extends StatefulWidget {
  final ProfileModel profile;
  final VoidCallback? onTap;
  final List<Color>? gradientColors;

  const ModernProfileCard({
    Key? key,
    required this.profile,
    this.onTap,
    this.gradientColors,
  }) : super(key: key);

  @override
  State<ModernProfileCard> createState() => _ModernStatCardState();
}

class _ModernStatCardState extends State<ModernProfileCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.97,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }
  
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final gradientColors = widget.gradientColors ?? [
      Theme.of(context).primaryColor,
      Theme.of(context).primaryColor.withOpacity(0.7),
    ];

    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.white, gradientColors[0].withOpacity(0.05)],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: gradientColors[0].withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: gradientColors),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: gradientColors[0].withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  widget.profile.nama.substring(0, 1).toUpperCase(),
                  style: const TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

            Text(
              widget.profile.nama,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),

            Text(
              widget.profile.email,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 16),

            const Divider(),

            const SizedBox(height: 16),

            /// DATA PROFILE
            _buildInfoRow(Icons.badge_outlined, "NIM: ${widget.profile.nim}"),
            const SizedBox(height: 12),

            _buildInfoRow(Icons.school_outlined, widget.profile.jurusan),
            const SizedBox(height: 12),

            _buildInfoRow(Icons.star_outline, "IPK: ${widget.profile.ipk}"),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Colors.grey[600]),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class ProfileListView extends StatelessWidget {
  final List<ProfileModel> profileList;
  final VoidCallback? onRefresh;
  final bool useModernCard;

  const ProfileListView({
    Key? key,
    required this.profileList,
    this.onRefresh,
    this.useModernCard = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (profileList.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.people_outline,
              size: 80,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              'Belum ada data',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 24),
            if (onRefresh != null)
              ElevatedButton.icon(
                onPressed: onRefresh,
                icon: const Icon(Icons.refresh),
                label: const Text('Muat Ulang'),
              ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () async {
        onRefresh?.call();
      },
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: profileList.length,
        itemBuilder: (context, index) {
          final profile = profileList[index];
          if (useModernCard) {
            return ModernProfileCard(
              profile: profile,
              onTap: () {},
            );
          } else {
            return _buildSimpleCard(profile);
          }
        },
      ),
    );
  }

  Widget _buildSimpleCard(ProfileModel profile) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(profile.nama.substring(0, 1).toUpperCase()),
        ),
        title: Text(profile.nama),
        subtitle: Text(profile.email),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}