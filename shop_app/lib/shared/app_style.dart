import 'export.dart';
export 'dart:ui';


TextStyle appStyle(double size,Color color,FontWeight fw) {
  return GoogleFonts.poppins(fontSize: size,color: color,fontWeight: fw);
}

TextStyle appStyleWithHt(double size,Color color,FontWeight fw,double ht) {
  return GoogleFonts.poppins(fontSize: size,color: color,fontWeight: fw,height: ht);
}