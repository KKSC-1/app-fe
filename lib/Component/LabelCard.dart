import 'package:flutter/material.dart';

class LabelCard extends StatelessWidget {
  final String? label;
  final String? img;
  final String name;
  final String text;

  const LabelCard(
      {this.label, this.img, required this.name, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 164, // 카드 너비
      height: 224, // 카드 높이
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        border: Border.all(
          color: const Color.fromRGBO(0, 0, 0, 0.1),
          width: 1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 164,
                color: const Color.fromRGBO(0, 0, 0, 0.05),
                child: img != null
                    ? Image.asset(
                  img!,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Text(
                        "No Image",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  },
                )
                    : const Center(
                  child: Text(
                    "No Image",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              if (label != null && label!.isNotEmpty)
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 4, horizontal: 8), // 텍스트 양쪽 간격
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(6),
                        bottomRight: Radius.circular(6),
                      ),
                      color: Color.fromRGBO(0, 0, 0, 0.5),
                    ),
                    child: Text(
                      label!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        height: 16 / 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                        fontSize: 12,
                        height: 16 / 12,
                        fontWeight: FontWeight.w400),
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    text,
                    style: const TextStyle(
                        fontSize: 16,
                        height: 24 / 16,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
