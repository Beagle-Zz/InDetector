contract c12186{
    /// @notice Reusable code to do sanity check of transfer variables
        function transferCheck(address _sender, address _receiver, uint256 _amount)
        private
        constant
        returns (bool success)
    {
        require(!tokenTransfersFrozen);
        require(_amount > 0);
        require(_receiver != address(0));
        require(balances[_sender].sub(_amount) >= 0);
        require(balances[_receiver].add(_amount) > 0);
        require(balances[_receiver].add(_amount) > balances[_receiver]);
        return true;
    }
}