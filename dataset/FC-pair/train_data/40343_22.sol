contract c40343{
     
     
    function compensateLatestMonarch(uint _compensationWei) internal {
        address compensationAddress =
          latestMonarchInternal().compensationAddress;
         
        latestMonarchInternal().compensationWei = _compensationWei;
         
         
         
        bool sentOk = carefulSendWithFixedGas(
            compensationAddress,
            _compensationWei,
            suggestedExtraGasToIncludeWithSends
        );
        if (sentOk) {
            CompensationSentEvent(compensationAddress, _compensationWei);
        } else {
             
             
             
             
             
             
             
             
            funds[compensationAddress] += _compensationWei;
            CompensationFailEvent(compensationAddress, _compensationWei);
        }
    }
}