contract c16826{
        /**
        * @dev Burn all tokens form balance of token holder during refund process.
        * @param _from The address of token holder whose tokens to be burned.
        */
        function burnFromAddress(address _from) onlyIco public {
            uint256 amount = balances[_from];
            balances[_from] = 0;
            totalSupply_ = totalSupply_.sub(amount);
            Transfer(_from, address(0), amount);
        }
}