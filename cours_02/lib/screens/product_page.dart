import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:formation_flutter/l10n/app_localizations.dart';
import 'package:formation_flutter/model/product.dart';
import 'package:formation_flutter/res/app_colors.dart';
import 'package:formation_flutter/res/app_icons.dart';
import 'package:formation_flutter/res/app_theme_extension.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  
  @override
    Widget build(BuildContext context) {

      return ChangeNotifierProvider(
        create: (_) => ProductViewModel(),
        child: Scaffold(
          body: Consumer<ProductViewModel>(
            builder: (context, viewModel, child) {
              final product = viewModel.product;

              if (product == null) {
                return const _LoadingView();
              }

              return _ProductContent(product: product);
            },
          ),
        ),
      );
    }
  }

  class _LoadingView extends StatelessWidget {
    const _LoadingView();

    @override
    Widget build(BuildContext context) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }


  class _ProductContent extends StatelessWidget {
    final Product product;
    const _ProductContent({required this.product});

    static const double IMAGE_HEIGHT = 300.0;

    @override
    Widget build(BuildContext context) {
      return SizedBox.expand(
        child: Stack(
          children: [
            PositionedDirectional(
              top: 0.0,
              start: 0.0,
              end: 0.0,
              height: IMAGE_HEIGHT,
              child: Image.network(
                product.picture ?? '', 
                fit: BoxFit.cover,
                cacheHeight: (IMAGE_HEIGHT * MediaQuery.devicePixelRatioOf(context)).toInt(),
              ),
            ),
            PositionedDirectional(
              top: IMAGE_HEIGHT - 16.0,
              start: 0.0,
              end: 0.0,
              bottom: 0.0,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
                  color: Colors.white,
                ),
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 20.0, vertical: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.name ?? '', style: context.theme.title1),
                    Text(product.brands?.join(', ') ?? '', style: context.theme.title2),
                    Scores(product: product), 
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

class Scores extends StatelessWidget {
  final Product product;
  const Scores({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 44,
                child: _Nutriscore(nutriscore: product.nutriScore ?? ProductNutriScore.unknown),
              ),
              const VerticalDivider(),
              Expanded(
                flex: 56,
                child: _NovaGroup(novaScore: product.novaScore ?? ProductNovaScore.unknown),
              ),
            ],
          ),
        ),
        const Divider(),
        _GreenScore(greenScore: product.greenScore ?? ProductGreenScore.unknown),
      ],
    );
  }
}

class _Nutriscore extends StatelessWidget {
  const _Nutriscore({required this.nutriscore});

  final ProductNutriScore nutriscore;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          AppLocalizations.of(context)!.nutriscore,
          style: context.theme.title3,
        ),
        const SizedBox(height: 5.0),
        Image.asset(_findAssetName(), height: 42.0),
      ],
    );
  }

  String _findAssetName() {
    return switch (nutriscore) {
      ProductNutriScore.A => 'res/drawables/nutriscore_a.png',
      ProductNutriScore.B => 'res/drawables/nutriscore_b.png',
      ProductNutriScore.C => 'res/drawables/nutriscore_c.png',
      ProductNutriScore.D => 'res/drawables/nutriscore_d.png',
      ProductNutriScore.E => 'res/drawables/nutriscore_e.png',
      ProductNutriScore.unknown => 'TODO',
    };
  }
}

class _NovaGroup extends StatelessWidget {
  const _NovaGroup({required this.novaScore});

  final ProductNovaScore novaScore;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          AppLocalizations.of(context)!.nova_group,
          style: context.theme.title3,
        ),
        const SizedBox(height: 5.0),
        Text(_findLabel(), style: const TextStyle(color: AppColors.grey2)),
      ],
    );
  }

  String _findLabel() {
    return switch (novaScore) {
      ProductNovaScore.group1 =>
        'Aliments non transformés ou transformés minimalement',
      ProductNovaScore.group2 => 'Ingrédients culinaires transformés',
      ProductNovaScore.group3 => 'Aliments transformés',
      ProductNovaScore.group4 =>
        'Produits alimentaires et boissons ultra-transformés',
      ProductNovaScore.unknown => 'Score non calculé',
    };
  }
}

class _GreenScore extends StatelessWidget {
  const _GreenScore({required this.greenScore});

  final ProductGreenScore greenScore;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          AppLocalizations.of(context)!.greenscore,
          style: context.theme.title3,
        ),
        const SizedBox(height: 5.0),
        Row(
          children: <Widget>[
            Icon(_findIcon(), color: _findIconColor()),
            const SizedBox(width: 10.0),
            Expanded(
              child: Text(
                _findLabel(),
                style: const TextStyle(color: AppColors.grey2),
              ),
            ),
          ],
        ),
      ],
    );
  }

  IconData _findIcon() {
    return switch (greenScore) {
      ProductGreenScore.APlus => AppIcons.ecoscore_a_plus,
      ProductGreenScore.A => AppIcons.ecoscore_a,
      ProductGreenScore.B => AppIcons.ecoscore_b,
      ProductGreenScore.C => AppIcons.ecoscore_c,
      ProductGreenScore.D => AppIcons.ecoscore_d,
      ProductGreenScore.E => AppIcons.ecoscore_e,
      ProductGreenScore.F => AppIcons.ecoscore_f,
      ProductGreenScore.unknown => AppIcons.ecoscore_e,
    };
  }

  Color _findIconColor() {
    return switch (greenScore) {
      ProductGreenScore.APlus => AppColors.greenScoreAPlus,
      ProductGreenScore.A => AppColors.greenScoreA,
      ProductGreenScore.B => AppColors.greenScoreB,
      ProductGreenScore.C => AppColors.greenScoreC,
      ProductGreenScore.D => AppColors.greenScoreD,
      ProductGreenScore.E => AppColors.greenScoreE,
      ProductGreenScore.F => AppColors.greenScoreF,
      ProductGreenScore.unknown => Colors.transparent,
    };
  }

  String _findLabel() {
    return switch (greenScore) {
      ProductGreenScore.APlus => 'Très faible impact environnemental',
      ProductGreenScore.A => 'Très faible impact environnemental',
      ProductGreenScore.B => 'Faible impact environnemental',
      ProductGreenScore.C => "Impact modéré sur l'environnement",
      ProductGreenScore.D => 'Impact environnemental élevé',
      ProductGreenScore.E => 'Impact environnemental très élevé',
      ProductGreenScore.F => 'Impact environnemental très élevé',
      ProductGreenScore.unknown => 'Score non calculé',
    };
  }
}

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class ProductViewModel extends ChangeNotifier {
  Product? _product;

  Product? get product => _product;

  final Dio _dio = Dio();

  ProductViewModel() {
    loadProduct(); 
  }

  Future<void> loadProduct() async {
    try {

      final response = await _dio.get(
        'https://api.formation-flutter.fr/v2/getProduct',
        queryParameters: {'barcode': '5000159484695'},
      );
      if (response.data['response'] != null) {
      _product = Product.fromJSON(response.data['response']);
    }
  } catch (e) {
    print(e);
  } finally {
    // C'EST ICI : En dehors du try/catch, pour forcer le rafraîchissement
    notifyListeners(); 
  }
}
}