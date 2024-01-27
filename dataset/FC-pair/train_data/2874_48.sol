contract c2874{
    // PUBLIC interface: misc getters
    /// @notice get token price in cents depending on the current date
    function getPrice() public view returns (uint) {
        // skip finish date, start from the date of maximum price
        for (uint i = c_priceChangeDates.length - 2; i > 0; i--) {
            if (getTime() >= c_priceChangeDates[i]) {
              return c_tokenPrices[i];
            }
        }
        // default price is the cheapest, used for the initial test as well
        return c_tokenPrices[0];
    }
}