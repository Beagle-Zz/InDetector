contract c16854{
	///@notice Allow another contract to spend some tokens in your behalf
	///@param  spender The address authorized to spend 
	///@param  value The amount to be approved 
    function approve(address spender, uint256 value)
        returns (bool success) {
        allowance[msg.sender][spender] = value;
        return true;
    }
}