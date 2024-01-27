contract c18255{
  // Get back all your Ether (fees are also refunded).
  function refund() external {
    require(canRefund());
    require(!claimed[msg.sender]);
    address refunder = msg.sender;
    uint256 refundAmount = weiReceived[refunder].mul(PERCENTAGE_100) / (PERCENTAGE_100.sub(DEVELOPER_FEE_PERCENTAGE)) ;
    claimed[refunder] = true;
    if (collectedFees > 0) {
      collectedFees = 0;
    }
    refunder.transfer(refundAmount);
    Claim(refunder, refundAmount, refundAmount);
  }
}