contract c2853{
    /**
    * @dev Return the total amount of token user received.
    * @return Uint256 total amount of token user received.
    */
    function getTotalAirDroppedAmount() public view returns (uint256) {
        return airDropAmount.mul(arrayAirDropReceivers.length);
    }
}