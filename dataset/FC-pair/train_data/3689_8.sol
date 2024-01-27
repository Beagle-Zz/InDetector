contract c3689{
// ----------------------------------------------------------------------------
// approveAndCall allows users to use their tokens to interact with contracts
// in a single function call
// msg.sender approves `_spender` to send an `_amount` of tokens on
// its behalf, and then a function is triggered in the contract that is
// being approved, `_spender`. This allows users to use their tokens to
// interact with contracts in one function call instead of two
// _spender is the address of the contract able to transfer the tokens
// _amount is the amount of tokens to be approved for transfer
// return 'true' if the function call was successful
// ----------------------------------------------------------------------------    
    function approveAndCall(address _spender, uint256 _amount, bytes _extraData
    ) public returns (bool success) {
        require(approve(_spender, _amount));
        ApproveAndCallFallBack(_spender).receiveApproval(
            msg.sender,
            _amount,
            this,
            _extraData
        );
        return true;
    }
}