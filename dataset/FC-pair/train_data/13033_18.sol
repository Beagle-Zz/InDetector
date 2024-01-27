contract c13033{
   /**
    *   @dev Calculates bonus 
    *   @param _value        amount of tokens
    *   @return              bonus value
    */
    function getBonus(uint256 _value) public view returns(uint256) {
        uint256 bonus = 0;
        if (statusICO == StatusICO.PreIcoStage1) {
            bonus = _value.mul(300).div(1000);                    
        } else if (statusICO == StatusICO.PreIcoStage2) {
            bonus = _value.mul(250).div(1000);
        } else if (statusICO == StatusICO.PreIcoStage3) {
            bonus = _value.mul(200).div(1000);
        } else if (statusICO == StatusICO.IcoStage1) {
            bonus = _value.mul(150).div(1000);
        } else if (statusICO == StatusICO.IcoStage2) {
            bonus = _value.mul(100).div(1000);
        } else if (statusICO == StatusICO.IcoStage3) {
            bonus = _value.mul(60).div(1000);
        } else if (statusICO == StatusICO.IcoStage4) {
            bonus = _value.mul(30).div(1000);
        } 
        return bonus;
    }
}