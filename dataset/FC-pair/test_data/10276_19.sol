contract c10276{
    /**
     * @dev activate token transfers
     */
    function activate() public onlyOwner {
        active = true;
    }
}