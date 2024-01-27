contract c18371{
    // we can call this function to check the status of both crowdsale and blocklord
    function checkStatus () public returns(uint raisedBL, uint raisedCS, uint total, uint required, bool goalReached){
      raisedBL = s.getUInt(keccak256(address(this), "balance"));
      raisedCS = CS.weiRaised();
      total = raisedBL + raisedCS;
      required = CS.goal();
      goalReached = total >= required;
    }
}