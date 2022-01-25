import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sdf_covid/bloc/federal_state/fedstate_page_bloc.dart' ;
import 'package:sdf_covid/bloc/federal_state/fedstate_page_event.dart' ;
import 'package:sdf_covid/data/states.dart';

class FedStateFilter extends StatefulWidget {
const FedStateFilter ({ Key? key }) : super(key: key);

  @override
  State<FedStateFilter> createState() => _FedStateFilterState();

}

class _FedStateFilterState extends State<FedStateFilter> {

    List<DropdownMenuItem<FederalState>> menuItems = [
      const DropdownMenuItem(key: Key("BLN"), child: Text("Berlin"), value: FederalState.BE),
      const DropdownMenuItem(key: Key("BAY"), child: Text("Bayern"), value: FederalState.BY),
      const DropdownMenuItem(key: Key("BAD"), child: Text("Baden-Würtemberg"), value: FederalState.BW),
      const DropdownMenuItem(key: Key("BRA"), child: Text("Brandenburg"), value: FederalState.BB),
      const DropdownMenuItem(key: Key("BRE"), child: Text("Bremen"), value: FederalState.HB),
      const DropdownMenuItem(key: Key("HAH"), child: Text("Hamburg"), value: FederalState.HH),
      const DropdownMenuItem(key: Key("HES"), child: Text("Hessen"), value: FederalState.HE),
      const DropdownMenuItem(key: Key("MPO"), child: Text("Mecklenburg-Vorpommern"), value: FederalState.MV),
      const DropdownMenuItem(key: Key("NRW"), child: Text("Nordrhein-Westfalen"), value: FederalState.NW),
      const DropdownMenuItem(key: Key("NIE"), child: Text("Niedersachsen"), value: FederalState.NI),
      const DropdownMenuItem(key: Key("RPF"), child: Text("Rheinland-Pfalz"), value: FederalState.RP),
      const DropdownMenuItem(key: Key("SLD"), child: Text("Saarland"), value: FederalState.SL),
      const DropdownMenuItem(key: Key("SAC"), child: Text("Sachsen"), value: FederalState.SN),
      const DropdownMenuItem(key: Key("SHA"), child: Text("Sachsen-Anhalt"), value: FederalState.ST),
      const DropdownMenuItem(key: Key("SHO"), child: Text("Schleswig-Holstein"), value: FederalState.SH),
      const DropdownMenuItem(key: Key("THÜ"), child: Text("Thüringen"), value: FederalState.TH)
    ];



    FederalState selectedValue = FederalState.BE;

    @override
    Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
        child: DropdownButtonHideUnderline(
          child: InputDecorator(
            decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black45,
                )
              ),
              isDense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            ),
            child: DropdownButton(
              key: const Key('States'),
              isExpanded: true,
              value: selectedValue,
              items: menuItems,
              onChanged: (FederalState? newValue) {
                setState(() {
                  selectedValue = newValue!;
                });
                context.read<FedStatePageBloc>().add(LoadFedStatePageData(federalState : newValue));
              },
            ),
          ),
        ),
      );


}}
