contract c3031{
    /**
    * @dev get address of first buyer by index
    * @param _index Index of first buyer
    * @return Address of first buyer
    **/
    function getFirstBuyerAddress(uint256 _index) constant public returns(address) {
        return firstBuyerIndex[_index];
    }
}