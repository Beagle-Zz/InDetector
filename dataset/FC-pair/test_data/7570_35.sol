contract c7570{
    /**
    * @dev Stops crowdsale and release of tokens. Transfer remainining tokens back to owner.
    */
    function close() external onlyOwner {
        crowdsaleActive = false;
        isCrowdsaleClosed = true;
        token.transfer(owner, token.balanceOf(address(this)));
        emit Close();
    }
}