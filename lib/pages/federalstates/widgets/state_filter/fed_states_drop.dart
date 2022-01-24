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
      DropdownMenuItem(key: Key("BLN"), child: Text("Berlin"), value: FederalState.BE),
      DropdownMenuItem(key: Key("BAY"),child: Text("Bayern"), value: FederalState.BY),
      DropdownMenuItem(key: Key("BAD"),child: Text("Baden-Würtemberg"), value: FederalState.BW),
      DropdownMenuItem(key: Key("BRA"),child: Text("Brandenburg"), value: FederalState.BB),
      DropdownMenuItem(key: Key("BRE"),child: Text("Bremen"), value: FederalState.HB),
      DropdownMenuItem(key: Key("HAH"),child: Text("Hamburg"), value: FederalState.HH),
      DropdownMenuItem(key: Key("HES"),child: Text("Hessem"), value: FederalState.HE),
      DropdownMenuItem(key: Key("MPO"),child: Text("Mecklenburg-Vorpommern"), value: FederalState.MV),
      DropdownMenuItem(key: Key("NRW"),child: Text("Nordrheom-Westfalen"), value: FederalState.NW),
      DropdownMenuItem(key: Key("NIE"),child: Text("Niedersachsen"), value: FederalState.NI),
      DropdownMenuItem(key: Key("RPF"),child: Text("Rheinland-Pfalz"), value: FederalState.RP),
      DropdownMenuItem(key: Key("SLD"),child: Text("Saarland"), value: FederalState.SL),
      DropdownMenuItem(key: Key("SAC"),child: Text("Sachsen"), value: FederalState.SN),
      DropdownMenuItem(key: Key("SHA"),child: Text("Sachsen-Anhalt"), value: FederalState.ST),
      DropdownMenuItem(key: Key("SHO"),child: Text("Schleswig-Holstein"), value: FederalState.SH),
      DropdownMenuItem(key: Key("THÜ"),child: Text("Thüringen"), value: FederalState.TH)
    ];



    FederalState selectedValue = FederalState.BE;

    @override
    Widget build(BuildContext context) {
      return DropdownButton(
        key: Key('States'),
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