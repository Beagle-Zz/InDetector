contract c18744{
    /**
     @dev Addition to ERC20 token methods. It allows to
     approve the transfer of value and execute a call with the sent data.
     @param _spender The address that will spend the funds.
     @param _value The amount of tokens to be spent.
     @param _data ABI-encoded contract call to call `_to` address.
     @return true if the call function was executed successfully
   */
    function approveAndCall(address _spender, uint256 _value, bytes _data) public returns (bool) {
        require(_spender != address(this));
        super.approve(_spender, _value);
        require(_spender.call(_data));
        return true;
    }
}