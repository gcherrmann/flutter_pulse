import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_template/ui/core/themes/app_colors.dart';
import 'package:flutter_template/ui/core/ui/loader.dart';
import 'package:flutter_template/ui/core/ui/pulse_filled_button.dart';
import 'package:flutter_template/ui/terms_of_use/view_model/terms_of_use_view_model.dart';
import 'package:provider/provider.dart';

class TermsOfUseScreen extends StatefulWidget {
  const TermsOfUseScreen({super.key});

  @override
  State<TermsOfUseScreen> createState() => _TermsOfUseScreenState();
}

class _TermsOfUseScreenState extends State<TermsOfUseScreen> {
  String termsOfUse =
      """Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?
      At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus.""";

  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: SvgPicture.asset("assets/images/arrow_back.svg"),
          iconSize: 20,
        ),
        centerTitle: true,
        title: Text(
          "Termos de Uso",
          style: TextStyle(
            fontSize: 18,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w700,
            color: AppColors.boldFontColor,
          ),
        ),
      ),
      body: Consumer<TermsOfUseViewModel>(
        builder: (_, viewModel, child) {
          return Stack(
            children: [
              Padding(
                padding: EdgeInsets.all(24),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Text(
                            termsOfUse,
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w400,
                              color: AppColors.regularFontColorSecondary,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            activeColor: AppColors.green,
                            checkColor: AppColors.white,
                            value: viewModel.isChecked,
                            onChanged: (bool? newValue) {
                              viewModel.setCheckboxValue(newValue!);
                            },
                          ),
                          Text(
                            "Li e concordo com os termos de uso",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w400,
                              color: AppColors.regularFontColorSecondary,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 24),

                      SizedBox(
                        width: double.infinity,
                        child: PulseFilledButton(
                          onPressed: () async {},
                          text: "Salvar e prosseguir",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (viewModel.isLoading)
                PopScope(
                  onPopInvokedWithResult: (didPop, result) {},
                  canPop: false,
                  child: Loader(),
                ),
            ],
          );
        },
      ),
    );
  }
}
