import 'package:flutter/material.dart';

class FedStateFilter extends StatefulWidget {
const FedStateFilter ({ Key? key }) : super(key: key);

  @override
  State<FedStateFilter> createState() => _FedStateFilterState();

}



class _FedStateFilterState extends State<FedStateFilter> {

    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Berlin"), value: "BE"),
      DropdownMenuItem(child: Text("Brandenburg"), value: "BB"),
      DropdownMenuItem(child: Text("Bremen"), value: "BR"),
      DropdownMenuItem(child: Text("Hamburg"), value: "HH"),
      DropdownMenuItem(child: Text("Hamburg"), value: "HH"),

    ];



    String selectedValue = "BE";

    @override
    Widget build(BuildContext context) {
      return DropdownButton(
          value: selectedValue,
          items: menuItems,
        onChanged: (String? newValue){
            setState(() {
              selectedValue = newValue!;
            });
      },


      );


}}