contract c2851{
    /**
    * @dev Get the total number of addresses which received airDrop.
    * @return Uint256 the total number of addresses which received airDrop.
    */
    function getTotalNumberOfAddressesReceivedAirDrop() public view returns (uint256) {
        return arrayAirDropReceivers.length;
    }
}