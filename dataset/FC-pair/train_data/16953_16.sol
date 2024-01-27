contract c16953{
    /**
    * Helper function to calculate (hypothetical) subscription cost for given seconds and price, using current exchange rates.
    * @param subscriptionSeconds length of hypothetical subscription, as a non-scaled integer
    * @param price nominal price scaled by 10^18 ("token wei" or "attodollars")
    * @param unit unit of the number price
    */    
    function getPriceInData(uint subscriptionSeconds, uint price, Currency unit) public view returns (uint datacoinAmount) {
        if (unit == Currency.DATA) {
            return price.mul(subscriptionSeconds);
        }
        return price.mul(dataPerUsd).div(10**18).mul(subscriptionSeconds);
    }
}