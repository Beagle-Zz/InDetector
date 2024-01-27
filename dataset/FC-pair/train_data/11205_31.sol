contract c11205{
  /**
   * @dev Adds single address to whitelist.
   * @param _beneficiary Address to be added to the whitelist
   */
  function addToWhitelist(address _beneficiary,uint256 _stage) external onlyOwner {
      require(_beneficiary != address(0));
      require(_stage>0);  
 if(_stage==1){
     whitelist[_beneficiary].stage=Stage.PROCESS1_FAILED;
     returnInvestoramount(_beneficiary,adminCharge_p1);
     failedWhitelist(_beneficiary);
     investedAmountOf[_beneficiary]=0;
 }else if(_stage==2){
     whitelist[_beneficiary].stage=Stage.PROCESS1_SUCCESS;
 }else if(_stage==3){
     whitelist[_beneficiary].stage=Stage.PROCESS2_FAILED;
     returnInvestoramount(_beneficiary,adminCharge_p2);
     failedWhitelist(_beneficiary);
          investedAmountOf[_beneficiary]=0;
 }else if(_stage==4){
     whitelist[_beneficiary].stage=Stage.PROCESS2_SUCCESS;
 }else if(_stage==5){
     whitelist[_beneficiary].stage=Stage.PROCESS3_FAILED;
     returnInvestoramount(_beneficiary,adminCharge_p3);
     failedWhitelist(_beneficiary);
          investedAmountOf[_beneficiary]=0;
     }else if(_stage==6){
     whitelist[_beneficiary].stage=Stage.PROCESS3_SUCCESS;
     afterWhtelisted( _beneficiary);
 }
 }
}