contract c7343{
    /**
     * @dev Destroy this contract and recover any ether to the owner.
     */
    function destroy() public onlyOwner {
        selfdestruct(owner);
    }
}