contract c8683{
    // @dev if someone wants to transfer tokens to other account.
    function transferTokens(address _to, uint256 _tokens) lockTokenTransferBeforeStage4 TeamTransferConditions(_tokens, msg.sender)   public {
        _transfer(msg.sender, _to, _tokens);
    }
}