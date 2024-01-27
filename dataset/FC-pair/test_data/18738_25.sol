contract c18738{
 /****************** SETTERS *************************/
 /**
  * sets the prices of the character types
  * @param prices the prices in finney
  * */
 function setPrices(uint16[] prices) public onlyOwner {
   for (uint8 i = 0; i < prices.length * 2; i++) {
     costs[i] = uint128(prices[i % numDragonTypes]) * 1 finney;
     values[i] = costs[i] - costs[i] / 100 * fee;
   }
 }
}