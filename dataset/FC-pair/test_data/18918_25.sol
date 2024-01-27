contract c18918{
    /// @notice Returns a list of all Rabbit IDs assigned to an address.
    /// @param _owner The owner whose rabbits we are interested in.
    /// @dev This method MUST NEVER be called by smart contract code. First, it's fairly
    ///  expensive (it walks the entire Rabbit array looking for rabbits belonging to owner),
    ///  but it also returns a dynamic array, which is only supported for web3 calls, and
    ///  not contract-to-contract calls.
    function tokensOfOwner(address _owner) external view returns(uint[] ownerTokens) {
        uint tokenCount = balanceOf(_owner);
        if (tokenCount == 0) {
            // Return an empty array
            return new uint[](0);
        } else {
            uint[] memory result = new uint[](tokenCount);
            uint totalCats = totalSupply();
            uint resultIndex = 0;
            // We count on the fact that all rabbits have IDs starting at 1 and increasing
            // sequentially up to the totalCat count.
            uint rabbitId;
            for (rabbitId = 1; rabbitId <= totalCats; rabbitId++) {
                if (rabbitToOwner[rabbitId] == _owner) {
                    result[resultIndex] = rabbitId;
                    resultIndex++;
                }
            }
            return result;
        }
    }
}