contract c13402{
    /// @notice Find out what the results would be of a prospective purchase
    /// @param _wei Amount of wei the purchaser will pay
    /// @param _timestamp Prospective purchase timestamp
    /// @return weiPerToken expected MET token rate
    /// @return tokens Expected token for a prospective purchase
    /// @return refund Wei refund the purchaser will get if amount is excess and MET supply is less
    function whatWouldPurchaseDo(uint _wei, uint _timestamp) public constant
        returns (uint weiPerToken, uint tokens, uint refund)
    {
        weiPerToken = calcPriceAt(whichTick(_timestamp));
        uint calctokens = METDECMULT.mul(_wei).div(weiPerToken);
        tokens = calctokens;
        if (calctokens > mintable) {
            tokens = mintable;
            uint weiPaying = mintable.mul(weiPerToken).div(METDECMULT);
            refund = _wei.sub(weiPaying);
        }
    }
}