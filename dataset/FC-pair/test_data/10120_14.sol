contract c10120{
    /* Override "transfer" */
    function transfer(address _to, uint _amount) public returns (bool success) {
        require(tokensTradeable);
        require(_amount <= unlockedTokensInternal(msg.sender));
        return super.transfer(_to, _amount);
    }
}