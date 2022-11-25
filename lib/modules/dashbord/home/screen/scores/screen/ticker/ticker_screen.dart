import 'package:football/utils/app_colors.dart';
import 'package:football/utils/assets_path.dart';
import 'package:football/utils/size_utils.dart';
import 'package:football/widgets/app_text.dart';
import 'package:flutter/material.dart';

class TickerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: SizeUtils.horizontalBlockSize * 0,
      ),
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return tickerBox(
              playerImage: AssetsPath.footBallCard,
              teamImage: AssetsPath.evenOffSide,
              playerName: "Mehtab Singh",
              scoreOne: 90,
              scoreTwo: 8,
              title:
                  "Sadio Mane could face several months on the sidelines after undergoing the surgery that ended his slim hopes of playing for Senegal at the World Cup");
        },
      ),
    );
  }

  Widget tickerBox({
    String? title,
    String? playerImage,
    String? teamImage,
    String? playerName,
    int? scoreOne,
    int? scoreTwo,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: SizeUtils.horizontalBlockSize * 2,
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            SizeUtils.horizontalBlockSize * 2,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeUtils.horizontalBlockSize * 3,
            vertical: SizeUtils.horizontalBlockSize * 2,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: SizeUtils.horizontalBlockSize * 2,
                  horizontal: SizeUtils.horizontalBlockSize * 1,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: SizeUtils.horizontalBlockSize * 1,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.grey.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(
                            SizeUtils.horizontalBlockSize * 2,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: SizeUtils.horizontalBlockSize * 1,
                            horizontal: SizeUtils.horizontalBlockSize * 2,
                          ),
                          child: AppText(
                            text: "${scoreOne} + ${scoreTwo}",
                            fontSize: SizeUtils.fSize_14(),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeUtils.horizontalBlockSize * 2,
                    ),
                    AppText(
                      text: "$title",
                      fontSize: SizeUtils.fSize_14(),
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: SizeUtils.horizontalBlockSize * 2,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: SizeUtils.horizontalBlockSize * 3,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(
                          SizeUtils.horizontalBlockSize * 5,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: SizeUtils.horizontalBlockSize * 2,
                          vertical: SizeUtils.horizontalBlockSize * 2,
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 11.0,
                              backgroundImage: AssetImage("$playerImage"),
                              backgroundColor: Colors.transparent,
                            ),
                            SizedBox(
                              width: SizeUtils.horizontalBlockSize * 2,
                            ),
                            CircleAvatar(
                              radius: 8.0,
                              backgroundImage: AssetImage("$teamImage"),
                              backgroundColor: Colors.transparent,
                            ),
                            SizedBox(
                              width: SizeUtils.horizontalBlockSize * 2,
                            ),
                            SizedBox(
                              width: SizeUtils.horizontalBlockSize * 30,
                              child: AppText(
                                text: "$playerName",
                                fontSize: SizeUtils.fSize_13(),
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
