contract c13181{
    /**
     * Amount still owed to an individual address
     */
    function amountOwed(address anAddress) public view returns (uint256) {
        return creditRemaining[anAddress];
    }
}