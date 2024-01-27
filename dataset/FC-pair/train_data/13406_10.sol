contract c13406{
    /// @notice Trade in reserve(ETH/MET) and mint new smart tokens
    /// @param smartTokenSupply Total supply of smart token
    /// @param reserveTokensSent Amount of token sent by caller
    /// @param reserveTokenBalance Balance of reserve token in the contract
    /// @return Smart token minted
    function returnForMint(uint smartTokenSupply, uint reserveTokensSent, uint reserveTokenBalance) 
        internal pure returns (uint)
    {
        uint s = smartTokenSupply;
        uint e = reserveTokensSent;
        uint r = reserveTokenBalance;
        /// smartToken for mint(T) = S * (sqrt(1 + E/R) - 1)
        /// DECMULT is same as 1 for values with 18 decimal places
        return ((fMul(s, (fSub(fSqrt(fAdd(DECMULT, fDiv(e, r))), DECMULT)))).mul(METDECMULT)).div(DECMULT);
    }
}