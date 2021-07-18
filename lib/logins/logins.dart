import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqliteflutter/constants.dart';

LoginLibro(TextEditingController t, String label, String hint,
    IconData iconData, String initialValue) {
  return Padding(
    padding: const EdgeInsets.only(
      top: TextFormTop,
    ),
    child: TextFormField(
      validator: (value) {
        if (value.isEmpty) {
          return Campo;
        }
      },
      controller: t,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
          prefixIcon: Icon(iconData),
          hintText: label,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(BordeRadi))), keyboardType: TextInputType.text,
    ),
  );
}

LoginAutor(TextEditingController t, String label, String hint,
    IconData iconData, String initialValue) {
  return Padding(
    padding: const EdgeInsets.only(
      top: TextFormTop,
    ),
    child: TextFormField(
      validator: (value) {
        if (value.isEmpty) {
          return Campo;
        }
      },
      controller: t,

      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
          prefixIcon: Icon(iconData),
          hintText: label,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(BordeRadi))), keyboardType: TextInputType.text,
    ),
  );
}
LoginCategoria(TextEditingController t, String label, String hint,
    IconData iconData, String initialValue) {
  return Padding(
    padding: const EdgeInsets.only(
      top: TextFormTop,
    ),
    child: TextFormField(
      validator: (value) {
        if (value.isEmpty) {
          return Campo;
        }
      },
      controller: t,

      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
          prefixIcon: Icon(iconData),
          hintText: label,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(BordeRadi))),
    ),
  );
}
LoginFecha(TextEditingController t, String label, String hint,
    IconData iconData, String initialValue) {
  return Padding(
    padding: const EdgeInsets.only(
      top: TextFormTop,
    ),
    child:

    TextFormField(

      validator: (value) {
        if (value.isEmpty) {
          return Campo;
        }
      },
      controller: t,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
          prefixIcon: Icon(iconData),
          hintText: label,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(BordeRadi))),keyboardType: TextInputType.datetime,
    ),
  );
}
Loginestado (TextEditingController t, String label, String hint,
    IconData iconData, String initialValue) {
  return Padding(
    padding: const EdgeInsets.only(
      top: TextFormTop,
    ),
    child: TextFormField(
      validator: (value) {
        if (value.isEmpty) {
          return Campo;
        }
      },
      controller: t,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(

          prefixIcon: Icon(iconData),

          hintText: label,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(BordeRadi)))
    ),
  );
}
