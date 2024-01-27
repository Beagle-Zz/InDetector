contract c2107{
  /*
   * @notice `doPayment()` is an internal function that sends the ether that this
     contract receives to the `vault` and creates tokens in the address of the
     `_owner` assuming the Campaign is still accepting funds
   * @param _owner The address that will hold the newly created tokens
   */
  function doPayment(address _owner) internal {
//   Calculate token amount
    uint tokenAmount = getTokenAmount(msg.value);
//   Check that the Campaign is allowed to receive this donation
    require ((now >= startFundingTime) &&
            (now <= endFundingTime) &&
            (tokenContract.controller() != 0) &&            //Extra check
            (msg.value != 0) &&
            ((totalTokensSold + tokenAmount) <= volume)
            );
  //Send the ether to the vault
    preValidatePurchase(_owner,msg.value);
    require (vaultAddress.send(msg.value));
    require (tokenContract.transfer(_owner,tokenAmount));
//  Track how much the Campaign has collected
    totalCollected += msg.value;
    totalTokensSold += tokenAmount;
    emit FundTransfer(msg.sender,tokenAmount,true);
    return;
    }
}