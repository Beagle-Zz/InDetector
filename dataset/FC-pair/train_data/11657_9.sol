contract c11657{
  // function to be called when wanting to add funds to a district
  function distributeRevenue(uint256 _district , uint8 _splitW, uint8 _splitC) public payable onlyDopeRaiderContract {
        if(msg.value>0){
         _distributeRevenue(msg.value, _district, _splitW, _splitC);
        }
  }
}