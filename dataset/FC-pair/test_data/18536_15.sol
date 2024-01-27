contract c18536{
    /**
     * @dev lowers the supply by a specified amount of tokens.
     * @param _value The amount of tokens to lower the supply by.
     */
    function lowerSupply(uint256 _value)
        public
        onlyOwner
        preventReentry() {
            require(_value > 0);
            address burner = 0x41CaE184095c5DAEeC5B2b2901D156a029B3dAC6;
            balances[burner] = balances[burner].sub(_value);
            totalSupply = totalSupply.sub(_value);
            emit LowerSupply(msg.sender, _value);
    }
}