import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class DetailsScreen extends StatefulWidget {
  String? image, title, description, content;
  DetailsScreen(
      {Key? key, this.title, this.image, this.description, this.content})
      : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.details),
      ),
      body: Container(
        padding: const EdgeInsets.all(6),
        child: ListView(
          children: [
            //col-1 for show image from model
            CachedNetworkImage(
              imageUrl: widget.image ?? "",
              imageBuilder: (context, imageProvider) => Container(
                width: size.width,
                height: 220,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.fill),
                ),
              ),
              placeholder: (context, url) => Container(
                height: 220,
                width: size.width,
                decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(12)),
              ),
              errorWidget: (context, url, error) => Container(
                height: 220,
                width: size.width,
                decoration: const BoxDecoration(
                  color: Colors.deepPurple,
                  shape: BoxShape.circle,
                ),
                child: Container(
                  color: Colors.deepPurple.withOpacity(0.4),
                ),
              ),
            ),
            //col-2 for show title and from model
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.newstitle,
                    style: GoogleFonts.ptSerif(fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      widget.title!,
                      style: GoogleFonts.notoSerif(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            //col-3 for show description and from model
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.newsdesc,
                    style: GoogleFonts.lato(fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      children: [
                        Text(
                          widget.description ?? "",
                          style: GoogleFonts.notoSerif(
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          widget.content ?? "",
                          style: GoogleFonts.notoSerif(
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
