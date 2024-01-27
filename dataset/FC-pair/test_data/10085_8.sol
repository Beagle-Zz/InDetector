contract c10085{
    /**
     * @dev Destroy this contract and recover any ether to the owner.
     */
    function destroy() public onlyOwner {
        selfdestruct(owner);
    }
}