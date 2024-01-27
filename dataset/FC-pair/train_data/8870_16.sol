contract c8870{
    /**
     * @dev Allows the owner to destroy the contract and return the tokens to the owner.
     */
    function destroy() public onlyOwner {
        token.transfer(owner, token.balanceOf(address(this)));
        selfdestruct(owner);
    }
}