contract c16827{
        /**
        * @dev Burn remaining tokens from the ICO balance.
        */
        function burnFromIco() onlyIco public {
            uint256 remainingTokens = balanceOf(addressIco);
            balances[addressIco] = balances[addressIco].sub(remainingTokens);
            totalSupply_ = totalSupply_.sub(remainingTokens);
            Transfer(addressIco, address(0), remainingTokens);
        }
}