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
      DropdownMenuItem(child: Text("Brandenburg"), value: FederalState.BB),
      DropdownMenuItem(child: Text("Bremen"), value: FederalState.HB),
      DropdownMenuItem(child: Text("Hamburg"), value: FederalState.HH),

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