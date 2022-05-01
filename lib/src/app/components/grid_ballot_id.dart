import 'package:deso_tss/src/app/providers/ballot_id_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GridBallotId extends StatelessWidget {
  const GridBallotId({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ids = context.watch<BallotIDProvider>().ballotIDObjects;

    return GridView.builder(
      itemCount: ids.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3.5,
      ),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            context.read<BallotIDProvider>().selectBallotID(ids[index].id);
            //get all selected ids
          },
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 5.0,
            ),
            decoration: BoxDecoration(
              color: ids[index].isSelected
                  ? Theme.of(context).colorScheme.primary
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Center(
              child: Text(
                ids[index].id,
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: ids[index].isSelected
                          ? Colors.white
                          : Theme.of(context).colorScheme.primary,
                    ),
              ),
            ),
          ),
        );
      },
    );
  }
}
