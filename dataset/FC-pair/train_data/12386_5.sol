contract c12386{
    // external user can release the tokens on their own when the time comes
    function withdrawTokens(uint256 amount) external {
        uint256 held = heldTokens[msg.sender];
        uint heldBlock = heldTimeline[msg.sender];
        require(held >= 0 && held >= amount);
        require(block.number >= heldBlock);
        heldTokens[msg.sender] -= amount;
        heldTimeline[msg.sender] = 0;
        Withdraw(msg.sender, amount);
        Token.transfer(msg.sender, amount);
    }
}