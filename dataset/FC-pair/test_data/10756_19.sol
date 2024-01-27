contract c10756{
    /**
     * @dev activate token transfers
     */
    function activate() public onlyOwner {
        active = true;
    }
}