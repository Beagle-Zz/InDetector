contract c13723{
        //bonus calculation for ICO on purchase basis
  function bonuscalico(uint256 y) private returns (uint256 cp){
     x = y/(10**18);
     uint bon;
      if (x>=2 && x <5){
          bon = 1;
      }
      else  if (x>=5 && x <15){
          bon = 2;
      }
      else  if (x>=15 && x <25){
          bon = 3;
      }
      else  if (x>=25 && x <40){
          bon = 4;
      }
      else  if (x>=40 && x <60){
          bon = 5;
      }
      else  if (x>=60 && x <70){
          bon = 6;
      }
      else  if (x>=70 && x <80){
          bon = 7;
      }
      else  if (x>=80 && x <90){
          bon = 8;
      }
     else  if (x>=90 && x <100){
          bon = 9;
      }
      else  if (x>=100){
          bon = 10;
      }
      else{
      bon = 0;
      }
      return bon;
  }
}