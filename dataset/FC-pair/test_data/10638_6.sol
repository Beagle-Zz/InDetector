contract c10638{
    /**
     * @dev Get full contract balance
     */
    function getBalance() public view returns(uint256) {
        return address(this).balance;
    }
}