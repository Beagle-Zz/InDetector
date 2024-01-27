contract c18675{
    /*
     * @dev     Retrieves current LOT token balance of an address.
     *
     * @param _address Address whose balance is to be queried.
     */
    function getLOTBalance(address _address) internal view returns (uint) {
        return LOTContract.balanceOf(_address);
    }
}