contract c8984{
	/**
	 * Internal transfers can only be invoked through this contract
	*/
    function _transfer(address _from, address _to, uint _value) internal {
        uint256 f_value = balanceOf(_from);
        uint256 t_value = balanceOf(_to);
        // Prevents transmission to 0x0 address.Call to Burn ()
        require(_to != 0x0);
        // Check that the sender is adequate
        require(f_value >= _value);
        // Check the overflow
        require(t_value + _value > t_value);
        // Save it as a future assertion
        uint previousBalances = f_value + t_value;
        // Minus from the sender
        setBalanceOf(_from, f_value - _value);
        // Add to receiver
        setBalanceOf(_to, t_value + _value);
        // Assertions are used to use static analysis to detect errors in code.They should not fail
        assert(balanceOf(_from) + balanceOf(_to) == previousBalances);
    }
}