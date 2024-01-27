contract c10739{
    /**
     * @dev activate token transfers
     */
    function activate() public onlyOwner {
        active = true;
    }
}