contract c1015{
    // Required for ERC-721 compliance.
    function transfer(address _to, uint256 _gemId) external whenNotPaused {
        require(_to != address(0));
        require(_to != address(this));
        require(_owns(msg.sender, _gemId));
        _transfer(msg.sender, _to, _gemId);
    }
}