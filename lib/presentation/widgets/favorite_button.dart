import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget {
  final VoidCallback onStatusChanged;
  final bool isFavorite;
  final Color color;
  const FavoriteButton({
    Key? key,
    required this.isFavorite,
    required this.onStatusChanged,
    required this.color,
  }) : super(key: key);

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool? _isFavorite;

  @override
  void initState() {
    _isFavorite = widget.isFavorite;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          _isFavorite = !_isFavorite!;
        });
        widget.onStatusChanged();
      },
      icon: Icon(
        _isFavorite == true ? Icons.favorite : Icons.favorite_outline,
        color: widget.color,
      ),
    );
  }
}
