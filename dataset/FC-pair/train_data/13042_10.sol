contract c13042{
    // Calculates the amount of ether per token from the balance.
    // This is calculated once by the first account to swap.
    function calulateRate() internal {
        reservedFees = penalty + (_submitted - submittedFeesPaid) * 1530 / 10000;  // fees are 15.3 % total.
        uint256 tokens = _totalSupply / 1 ether;
        payRate = (this.balance - reservedFees);
        payRate = payRate / tokens;
    }
}