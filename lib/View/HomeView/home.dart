import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newslitter/Model/ArticlesModel/articles_mode.dart';
import 'package:newslitter/Utils/Components/app_loading.dart';
import 'package:newslitter/View/DestailsView/details.dart';
import 'package:newslitter/ViewModel/articlesViewModel.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScren extends StatefulWidget {
  const HomeScren({Key? key}) : super(key: key);

  @override
  _HomeScrenState createState() => _HomeScrenState();
}

class _HomeScrenState extends State<HomeScren> {
  @override
  Widget build(BuildContext context) {
    ArticlesListView _listView = context.watch<ArticlesListView>();
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: AppLocalizations.of(context)!.news,
                  style: const TextStyle(
                      color: Colors.orange,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: AppLocalizations.of(context)!.litter,
                      style: const TextStyle(color: Colors.white),
                    )
                  ])),
        ),
        body: Column(
          children: [
            _ui(_listView),
          ],
        ));
  }

  _ui(ArticlesListView articlesListView) {
    if (articlesListView.loading) {
      return const AppLoading();
    }
    if (articlesListView.arterror != null) {
      //for any error
      return Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(child: Text(AppLocalizations.of(context)!.error)),
      );
    }
    return Expanded(
        child: ListView.separated(
      itemCount: articlesListView.articlesList.length,
      itemBuilder: (context, index) {
        //for get data from provider
        ArticlesModel data = articlesListView.articlesList[index];
        return GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailsScreen(
                        title: data.title,
                        image: data.urlToImage,
                        description: data.description,
                      ))),
          child: Card(
            elevation: 2,
            child: Container(
              padding: const EdgeInsets.all(6.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //row-1 for show image from model
                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: CachedNetworkImage(
                      imageUrl: '${data.urlToImage}',
                      imageBuilder: (context, imageProvider) => Container(
                        width: 80.0,
                        height: 110.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.fill),
                        ),
                      ),
                      placeholder: (context, url) => Container(
                        height: 110,
                        width: 80,
                        decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      errorWidget: (context, url, error) => Container(
                        height: 110,
                        width: 80,
                        decoration: const BoxDecoration(
                          color: Colors.deepPurple,
                          shape: BoxShape.circle,
                        ),
                        child: Container(
                          color: Colors.deepPurple.withOpacity(0.4),
                        ),
                      ),
                    ),
                  ),
                  //row-12 for show colum two string title and published date from model
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(top: 2, right: 4, left: 4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          data.title!,
                          style: GoogleFonts.notoSerif(
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          '${AppLocalizations.of(context)!.newsdate}: ${data.publishedAt!.substring(0, 10)}',
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailsScreen(
                                        title: data.title,
                                        image: data.urlToImage,
                                        description: data.description,
                                      ))),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: const BoxDecoration(
                                color: Colors.deepPurple,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(8),
                                    bottomRight: Radius.circular(8),
                                    topLeft: Radius.circular(2),
                                    topRight: Radius.circular(2))),
                            child: Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: Center(
                                  child: Text(
                                      AppLocalizations.of(context)!.seedetails,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold))),
                            ),
                          ),
                        )
                      ],
                    ),
                  ))
                ],
              ),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => const Divider(),
    ));
  }
}
