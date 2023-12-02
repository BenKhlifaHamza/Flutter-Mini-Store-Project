import 'package:flutter/material.dart';
import 'package:mini_e_commerce/models/product_model.dart';
import 'package:mini_e_commerce/views/widgets/home/icon_widget.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import '../../../core/colors.dart';

class ItemWidget extends StatelessWidget {
  final ItemModel item;
  const ItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.itemColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 30,
            padding: const EdgeInsets.all(2.0),
            alignment: Alignment.center,
            child: Text(
              item.title!,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis),
            ),
          ),
          Expanded(
            child: FancyShimmerImage(
                imageUrl: item.images![0],
                boxFit: BoxFit.cover,
                errorWidget: Image.network(
                    'https://t3.ftcdn.net/jpg/04/62/93/66/360_F_462936689_BpEEcxfgMuYPfTaIAOC1tCDurmsno7Sp.jpg')),
          ),
          Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3),
              child: Row(
                children: [
                  Text(
                    "\$${item.price!}",
                    style: TextStyle(
                        fontSize: 15,
                        color: AppColors.goldColor,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis),
                  ),
                  const Spacer(),
                  iconWidget(
                      icon: Icons.add_shopping_cart_outlined,
                      rPadding: 1,
                      size: 20),
                  iconWidget(
                      icon: Icons.favorite_outline_outlined,
                      rPadding: 1,
                      size: 20)
                ],
              ))
        ],
      ),
    );
  }
}
/**
 * 
 */