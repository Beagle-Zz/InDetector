contract c13723{
    //bonuc calculation for preico on per day basis
     function bonuscalpre() private returns (uint256 cp)
        {
          uint bon = 30;
             bonusCalculationFactor = (block.timestamp.sub(pre_startdate)).div(86400); //time period in seconds
            if(bonusCalculationFactor == 0)
            {
                bon = 30;
            }
          else if(bonusCalculationFactor >= 15)
            {
              bon = 2;
            }
            else{
                 bon -= bonusCalculationFactor* 2;
            }
            return bon;
        }
}