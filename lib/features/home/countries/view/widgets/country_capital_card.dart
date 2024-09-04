import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';

class CountryCapitalCard extends StatelessWidget {
  final List<CountryCapital> data;

  const CountryCapitalCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: SizedBox(
        height: context.heightPercentage(65), // Fixed height for the card
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.widthPercentage(2),
                vertical: context.heightPercentage(3),
              ), // Adjust padding as needed(8.0),
              child: InputDecorator(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: context.heightPercentage(2),
                  ),
/*                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),*/
                  filled: true,
                  fillColor: const Color(0xffF9F9F9),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(flex: 1, child: SizedBox()),
                    Text(
                      'Country',
                      style: context.textTheme.headlineMedium,
                    ),
                    context.wSBox(7),
                    const Expanded(flex: 3, child: SizedBox()),
                    Text(
                      'Capital',
                      style: context.textTheme.headlineMedium,
                    ),
                    const Expanded(flex: 1, child: SizedBox()),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(flex: 1, child: SizedBox()),
                          Expanded(
                            flex: 2,
                            child: Text(
                              data[index].country,
                              style: context.textTheme.headlineMedium,
                            ),
                          ),
                          const Expanded(flex: 3, child: SizedBox()),
                          Expanded(
                            flex: 2,
                            child: Text(
                              data[index].capital,
                              style: context.textTheme.headlineMedium,
                            ),
                          ),
                          const Expanded(flex: 1, child: SizedBox()),
                        ],
                      ),
                      context.hSBox(Const.scrnPer1),
                      const Divider(
                        color: Color(0xffF2F2F2),
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CountryCapital {
  final String country;
  final String capital;

  CountryCapital(this.country, this.capital);
}
