contract c2003{
    // This sounds like a draconian function, but it actually just ensures that the contract has enough to pay out
    // a jackpot at the rate you've selected (i.e. 1250 ZTH for jackpot on a 50 ZTH roll).
    // We do this by making sure that 25* your wager is no less than 50% of the amount currently held by the contract.
    // If not, you're going to have to use lower betting amounts, we're afraid!
    function jackpotGuard(uint _wager)
        public
        view
        returns (bool)
    {
        uint maxProfit = SafeMath.mul(_wager, 25);
        uint halfContractBalance = SafeMath.div(contractBalance, 2);
        return (maxProfit <= halfContractBalance);
    }
}