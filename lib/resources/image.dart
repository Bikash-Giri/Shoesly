import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoesly/resources/dimens.dart';
import 'package:shoesly/resources/theme_bloc.dart';
import 'package:vector_graphics/vector_graphics.dart' show AssetBytesLoader;

enum _ImageSourceType { asset, network }

class ShoeslyImage extends StatelessWidget {
  final String? source;
  final double? height;
  final double? width;
  final int? memCacheWidth;
  final int? memCacheHeight;
  final Color? color;
  final BoxFit fit;
  final bool inheritIconTheme;
  final Widget? placeholder;
  final bool showBorderAroundPlaceholder;

  final _ImageSourceType _sourceType;

  const ShoeslyImage.network({
    super.key,
    required String? url,
    this.height,
    this.width,
    this.color,
    this.inheritIconTheme = false,
    this.fit = BoxFit.contain,
    this.placeholder,
    this.memCacheWidth,
    this.memCacheHeight,
    this.showBorderAroundPlaceholder = false,
  })  : source = url,
        _sourceType = _ImageSourceType.network;

  const ShoeslyImage.asset({
    super.key,
    required String asset,
    this.height,
    this.width,
    this.color,
    this.inheritIconTheme = false,
    this.fit = BoxFit.contain,
    this.showBorderAroundPlaceholder = false,
  })  : source = asset,
        _sourceType = _ImageSourceType.asset,
        memCacheHeight = null,
        memCacheWidth = null,
        placeholder = null;

  @override
  Widget build(BuildContext context) {
    final emptyImage = Container(
      color: context.color.success.shade100,
      width: width,
      height: height,
    );

    final _color = inheritIconTheme ? IconTheme.of(context).color : color;
    final isSvg = source?.contains('.svg') ?? false;

    switch (_sourceType) {
      case _ImageSourceType.asset:
        return Image.asset('assets/$source',
            height: height,
            width: width,
            package: 'khalti_resources',
            color: _color,
            fit: fit);
      case _ImageSourceType.network:
        // final isRunningTest = Platform.environment.containsKey('FLUTTER_TEST');
        final errorWidget = placeholder ?? _errorWidget(context);
        // if (isRunningTest) return emptyImage;
        // if (source.isNull) return errorWidget;

        if (isSvg) {
          return _CachedSvgNetworkImage(
            imageUrl: source!,
            height: height,
            width: width,
            fit: fit,
            color: _color,
            placeholder: errorWidget,
          );
        }

        return CachedNetworkImage(
          imageUrl: source!,
          height: height,
          width: width,
          color: _color,
          fit: fit,
          memCacheWidth: memCacheWidth ?? 1024,
          memCacheHeight: memCacheHeight,
          placeholder: (context, _) => Center(
            child: SizedBox(
              width: d_iconSmallM,
              height: d_iconSmallM,
              child: CircularProgressIndicator(
                color: context.color.primary.shade600,
                backgroundColor: context.color.primary.shade200,
                strokeWidth: 2,
              ),
            ),
          ),
          errorWidget: (context, _, __) => errorWidget,
        );
    }
  }

  Widget _errorWidget(BuildContext context) {
    final child = SvgPicture(
      const AssetBytesLoader(
        'assets/a_noImagePlaceholder',
        packageName: 'khalti_resources',
      ),
      height: height,
      width: width,
    );

    if (showBorderAroundPlaceholder) {
      return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: context.theme.scaffoldBackgroundColor,
          border: Border.all(color: context.color.primary.shade20),
          borderRadius: BorderRadius.circular(32),
        ),
        child: child,
      );
    }

    return child;
  }
}

class _CachedSvgNetworkImage extends StatefulWidget {
  const _CachedSvgNetworkImage({
    required this.imageUrl,
    required this.placeholder,
    this.height,
    this.width,
    this.fit = BoxFit.contain,
    this.color,
  });

  final String imageUrl;
  final double? height;
  final double? width;
  final Widget placeholder;
  final BoxFit fit;
  final Color? color;

  @override
  State<_CachedSvgNetworkImage> createState() => _CachedSvgNetworkImageState();
}

class _CachedSvgNetworkImageState extends State<_CachedSvgNetworkImage> {
  late final String _cacheKey;
  late final DefaultCacheManager _cacheManager;

  @override
  void initState() {
    super.initState();
    _cacheManager = DefaultCacheManager();
    _cacheKey = widget.imageUrl;
  }

  Future<String> _loadAndCacheImage() async {
    final fileInfo = await _cacheManager.getFileFromMemory(_cacheKey);
    var file = fileInfo?.file;

    // `getSingleFile()` is responsible to get the file and cache it at the same time.
    return (file ??=
            await _cacheManager.getSingleFile(widget.imageUrl, key: _cacheKey))
        .readAsString();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _loadAndCacheImage(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return widget.placeholder;
        return SvgPicture.string(
          snapshot.data!,
          fit: widget.fit,
          width: widget.width,
          height: widget.height,
          colorFilter: widget.color == null
              ? null
              : ColorFilter.mode(widget.color!, BlendMode.srcIn),
          placeholderBuilder: (_) => widget.placeholder,
        );
      },
    );
  }
}

class KhaltiAssetImage extends AssetImage {
  const KhaltiAssetImage(String assetName)
      : super('assets/$assetName', package: 'khalti_resources');
}
