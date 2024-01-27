contract c11563{
    /// @notice Send `_amount` tokens to `_to` from `_from` on the condition it
    ///  is approved by `_from`
    /// @param _from The address holding the tokens being transferred
    /// @param _to The address of the recipient
    /// @param _amount The amount of tokens to be transferred
    /// @return True if the transfer was successful
    function transferFrom(address _from, address _to, uint256 _amount
    ) public returns (bool success) {
        // Alerts the token controller of the transfer
        if (isContract(controller)) {
            if (!TokenController(controller).onTransfer(_from, _to, _amount))
               throw;
        }
        success = super.transferFrom(_from, _to, _amount);
        if (success && isContract(_to))
        {
            // ERC20 backward compatiability
            if(!_to.call(bytes4(keccak256("tokenFallback(address,uint256)")), _from, _amount)) {
                // do nothing when error in call in case that the _to contract is not inherited from ERC223ReceivingContract
                // revert();
                // bytes memory empty;
                emit ReceivingContractTokenFallbackFailed(_from, _to, _amount);
                // Even the fallback failed if there is such one, the transfer will not be revert since "revert()" is not called.
            }
        }
    }
}