import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/core/widgets/common_widgets.dart';
import 'package:project/features/mahasiswa/presentation/providers/mahasiswa_provider.dart';
import 'package:project/features/mahasiswa/presentation/widgets/mahasiswa_widget.dart';

class MahasiswaPage extends ConsumerWidget {
  const MahasiswaPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mahasiswaState = ref.watch(mahasiswaNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Mahasiswa'),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              ref.invalidate(mahasiswaNotifierProvider);
            },
            icon: const Icon(Icons.refresh_rounded),
            tooltip: 'Refresh',
          ),
        ],
      ),
      body: mahasiswaState.when(
        loading: () => const LoadingWidget(),

        error: (error, stack) => CustomErrorWidget(
          message: 'Gagal Memuat data Mahasiswa: ${error.toString()}',
          onRetry: () {
            ref.read(mahasiswaNotifierProvider.notifier).refresh();
          },
        ),

        data: (mahasiswaList) {
          return MahasiswaListView(
            mahasiswaList: mahasiswaList,
            onRefresh: () {
              ref.invalidate(mahasiswaNotifierProvider);
            },
            useModernCard: true,
          );
        },
      ),
    );
  }
}