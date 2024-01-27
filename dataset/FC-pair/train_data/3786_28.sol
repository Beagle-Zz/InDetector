contract c3786{
    // Receive Ether (from Zethr itself or any other source) and purchase tokens at the 33% dividend rate.
    // If the amount is less than 0.01 Ether, the Ether is stored by the contract until the balance
    // exceeds that limit and then purchases all it can.
    function receiveDividends() public payable {
      if (!reEntered) {
        uint ActualBalance = (address(this).balance.sub(NonICOBuyins));
        if (ActualBalance > 0.01 ether) {
          reEntered = true;
          ZTHTKN.buyAndSetDivPercentage.value(ActualBalance)(address(0x0), 33, "");
          emit BankrollInvest(ActualBalance);
          reEntered = false;
        }
      }
    }
}