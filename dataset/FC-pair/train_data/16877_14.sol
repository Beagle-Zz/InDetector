contract c16877{
    /**
     * Transfer tokens from the caller to a new holder.
     * There's a small fee here that is redistributed to all token holders
     */
    function transfer(address _to, uint256 _value) public onlyTokenHolders returns(bool) {
        return transferFor_(msg.sender, _to, _value);
    }
}