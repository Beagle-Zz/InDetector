contract c7962{
    /// @dev Withdraw all Ether from the contract. This includes both the studio fee
    /// and blockpunk fee on every animecard sold and any Ether sent directly to
    /// contract address.
    /// Only the CFO can withdraw the balance or specify the address to send
    /// the balance to.
    function withdrawBalance(address _to) external onlyCFO {
        // We are using this boolean method to make sure that even if one fails it will still work
        if (_to == address(0)) {
            cfoAddress.transfer(this.balance);
        } else {
            _to.transfer(this.balance);
        }
    }
}