contract c12325{
     /**
      * withdraw NAC for 
      * run by investor
      */
     function withdrawNacNetfRe(uint _roundIndex) public {
         require(NetfRevenue[_roundIndex].withdrawable == true && isPause == false);
         require(usersNETF[_roundIndex][msg.sender].stake > 0 && usersNETF[_roundIndex][msg.sender].isWithdrawn == false);
         require(NetfRevenue[_roundIndex].totalFci > 0);
         // withdraw NAC
         uint nacReturn = ( NetfRevenue[_roundIndex].currentNAC.mul(usersNETF[_roundIndex][msg.sender].stake) ) / NetfRevenue[_roundIndex].totalFci;
         NamiCrowdSale namiToken = NamiCrowdSale(NamiAddr);
         namiToken.transfer(msg.sender, nacReturn);
         usersNETF[_roundIndex][msg.sender].isWithdrawn = true;
     }
}