contract c10120{
    /* Override "transferFrom" */
    function transferFrom(address _from, address _to, uint _amount) public returns (bool success) {
        require(tokensTradeable);
        require(_amount <= unlockedTokensInternal(_from));
        return super.transferFrom(_from, _to, _amount);
    }
}