contract c10565{
    /**
    * @dev Token Contract burn
    * @param _value - Value to burn
    * "Overloaded" Function of BurnableToken's burn
    */
    function burn(uint256 _value)
        public
    {
        super.burn(_value);
        Transfer(msg.sender, address(0x0), _value);
    }
}