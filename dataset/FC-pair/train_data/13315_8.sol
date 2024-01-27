contract c13315{
    /**
    ** @dev this method is used to GET CrySol Objects from one OWNER
    **/
    function getCrySolObjectsByOwner(address _owner) external view returns(uint[]) {
        uint256 tokenCount = ownerCrySolObjectsCount[_owner];
        if (tokenCount == 0) {
            return new uint256[](0);
        } else {
            uint[] memory result = new uint[](tokenCount);
            uint counter = 0;
            for (uint i = 0; i < numberOfCrySolObjects; i++) {
            if (crySolObjects[i].owner == _owner) {
                    result[counter] = i;
                    counter++;
                }
            }
            return result;
        }
    }
}