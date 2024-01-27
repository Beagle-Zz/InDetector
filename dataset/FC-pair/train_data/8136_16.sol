contract c8136{
    /**
     * @dev Burns all tokens owned by this contract.
     */
    function burnUnused() public onlyOwner {
        this.approve(msg.sender, 0);
        this.burn(balances[this]);
    }
}