import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sdf_covid/bloc/federal_state/fedstate_page_bloc.dart' ;
import 'package:sdf_covid/bloc/federal_state/fedstate_page_event.dart' ;
import 'package:sdf_covid/bloc/federal_state/fedstate_page_state.dart';
import 'package:sdf_covid/data/states.dart';

class FedStateFilter extends StatefulWidget {
const FedStateFilter ({ Key? key }) : super(key: key);

  @override
  State<FedStateFilter> createState() => _FedStateFilterState();

}



class _FedStateFilterState extends State<FedStateFilter> {

    List<DropdownMenuItem<FederalState>> menuItems = [
      DropdownMenuItem(child: Text("Berlin"), value: FederalState.BE),
      DropdownMenuItem(child: Text("Bayern"), value: FederalState.BY),
      DropdownMenuItem(child: Text("Baden-Würtemberg"), value: FederalState.BW),
      DropdownMenuItem(child: Text("Brandenburg"), value: FederalState.BB),
      DropdownMenuItem(child: Text("Bremen"), value: FederalState.HB),
      DropdownMenuItem(child: Text("Hamburg"), value: FederalState.HH),
      DropdownMenuItem(child: Text("Hessem"), value: FederalState.HE),
      DropdownMenuItem(child: Text("Mecklenburg-Vorpommern"), value: FederalState.MV),
      DropdownMenuItem(child: Text("Nordrheom-Westfalen"), value: FederalState.NW),
      DropdownMenuItem(child: Text("Niedersachsen"), value: FederalState.NI),
      DropdownMenuItem(child: Text("Rheinland-Pfalz"), value: FederalState.RP),
      DropdownMenuItem(child: Text("Saarland"), value: FederalState.SL),
      DropdownMenuItem(child: Text("Sachsen"), value: FederalState.SN),
      DropdownMenuItem(child: Text("Sachsen-Anhalt"), value: FederalState.ST),
      DropdownMenuItem(child: Text("Schleswig-Holstein"), value: FederalState.SH),
      DropdownMenuItem(child: Text("Thüringen"), value: FederalState.TH)
    ];



    FederalState selectedValue = FederalState.BE;

    @override
    Widget build(BuildContext context) {
      return DropdownButton(
          value: selectedValue,
          items: menuItems,
        onChanged: (FederalState? newValue){
            setState(() {
              selectedValue = newValue!;
            });
            context.read<FedStatePageBloc>().add(LoadFedStatePageData(federalState : newValue));
      },


      );


}}