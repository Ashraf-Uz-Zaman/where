
import 'package:where/utils/ScreenResulationUtils.dart';

class ResponsiveUtils{
  static double marginTop(double value){
    return ScreenResulationUtils.HEIGHT/(ScreenResulationUtils.HEIGHT/value);
  }

  static double marginLeft(double value){
    print( ScreenResulationUtils.WIDTH/(ScreenResulationUtils.HEIGHT/value));
    return ScreenResulationUtils.WIDTH/(ScreenResulationUtils.HEIGHT/value);
  }

  static double marginLefts(double value){
    print( "marginLefts " + (ScreenResulationUtils.WIDTH/(ScreenResulationUtils.HEIGHT/value)).toString());
    return ScreenResulationUtils.WIDTH/(ScreenResulationUtils.HEIGHT/value);
  }

  static double marginBottom(double value){
    return ScreenResulationUtils.HEIGHT/(ScreenResulationUtils.HEIGHT/value);
  }

  static double marginRight(double value){
    return ScreenResulationUtils.WIDTH/(ScreenResulationUtils.HEIGHT/value);
  }

  static double loginLogoImageHeight(){
    return (ScreenResulationUtils.HEIGHT*84.8)/926;
  }

  static double loginLogoImageWidth(){
    return (ScreenResulationUtils.WIDTH*198.4)/428;;
  }
}