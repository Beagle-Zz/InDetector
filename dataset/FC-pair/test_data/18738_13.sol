contract c18738{
 /**
  * allows the owner to collect the accumulated fees
  * sends the given amount to the owner's address if the amount does not exceed the
  * fees (cannot touch the players' balances) minus 100 finney (ensure that oraclize fees can be paid)
  * @param amount the amount to be collected
  * */
 function collectFees(uint128 amount) public onlyOwner {
   uint collectedFees = getFees();
   if (amount + 100 finney < collectedFees) {
     owner.transfer(amount);
   }
 }
}