contract c12761{
    /**
    * @dev Returns coinage record for the given address and index
    *
    * @param _address address The address for which coinage record will be fetched
    * @param _index index The index of coinage record for that address
    */
    function coinAgeRecordForAddress(address _address, uint256 _index) public view onlyOwner returns (uint256, uint64) {
        if (coinAgeRecordMap[_address].length > _index) {
            return (coinAgeRecordMap[_address][_index].amount, coinAgeRecordMap[_address][_index].time);
        } else {
            return (0, 0);
        }
    }
}