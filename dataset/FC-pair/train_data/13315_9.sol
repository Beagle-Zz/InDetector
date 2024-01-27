contract c13315{
    /**
    ** @dev this method is used to GET ALL CrySol Objects in the game
    **/
    function getAllCrySolObjects() external view returns(uint[]) {
        uint[] memory result = new uint[](numberOfCrySolObjects);
        uint counter = 0;
        for (uint i = 0; i < numberOfCrySolObjects; i++) {
                result[counter] = i;
                counter++;
        }
        return result;
    }
}