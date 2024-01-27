contract c7808{
    // @dev if someone wants to transfer tokens to other account.
    function transferTokens(address _to, uint256 _tokens) lockTokenTransferBeforeStage4 public {
        _transfer(msg.sender, _to, _tokens);
    }
}