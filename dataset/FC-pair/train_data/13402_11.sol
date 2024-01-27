contract c13402{
    /// @notice Redeem smart tokens, get back reserve(ETH/MET) token
    /// @param smartTokenSupply Total supply of smart token
    /// @param smartTokensSent Smart token sent
    /// @param reserveTokenBalance Balance of reserve token in the contract
    /// @return Reserve token redeemed
    function returnForRedemption(uint smartTokenSupply, uint smartTokensSent, uint reserveTokenBalance)
        internal pure returns (uint)
    {
        uint s = smartTokenSupply;
        uint t = smartTokensSent;
        uint r = reserveTokenBalance;
        /// reserveToken (E) = R * (1 - (1 - T/S)**2)
        /// DECMULT is same as 1 for values with 18 decimal places
        return ((fMul(r, (fSub(DECMULT, fSqr(fSub(DECMULT, fDiv(t, s))))))).mul(METDECMULT)).div(DECMULT);
    }
}