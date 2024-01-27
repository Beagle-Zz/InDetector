contract c12447{
     // after latch all investor, unpause here
     /**
      * withdraw NAC for 
      * run by controller
      */
     function withdrawNacNetfReController(uint _roundIndex, address _investor) onlyController public {
         require(NetfRevenue[_roundIndex].withdrawable == true && isPause == false && _investor != 0x0);
         require(usersNETF[_roundIndex][_investor].stake > 0 && usersNETF[_roundIndex][_investor].isWithdrawn == false);
         require(NetfRevenue[_roundIndex].totalFci > 0);
         // withdraw NAC
         uint nacReturn = ( NetfRevenue[_roundIndex].currentNAC.mul(usersNETF[_roundIndex][_investor].stake) ) / NetfRevenue[_roundIndex].totalFci;
         NamiCrowdSale namiToken = NamiCrowdSale(NamiAddr);
         namiToken.transfer(_investor, nacReturn);
         usersNETF[_roundIndex][_investor].isWithdrawn = true;
     }
}