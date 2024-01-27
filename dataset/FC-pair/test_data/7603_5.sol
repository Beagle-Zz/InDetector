contract c7603{
    /**
     * Sends charity money to the  https://giveth.io/
     * Their charity address is here https://etherscan.io/address/0x5ADF43DD006c6C36506e2b2DFA352E60002d22Dc
     */
    function payCharity() payable public {
      uint256 ethToPay = SafeMath.sub(totalEthCharityCollected, totalEthCharityRecieved);
      require(ethToPay > 1);
      totalEthCharityRecieved = SafeMath.add(totalEthCharityRecieved, ethToPay);
      if(!giveEthCharityAddress.call.value(ethToPay).gas(400000)()) {
         totalEthCharityRecieved = SafeMath.sub(totalEthCharityRecieved, ethToPay);
      }
    }
}