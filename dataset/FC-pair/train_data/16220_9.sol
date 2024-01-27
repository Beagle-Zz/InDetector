contract c16220{
    /** @dev allow for all who want stand client */
    function newDream(address entityAddress, string dream, string target)
        public
        validatorD(dream, target)
        returns (uint256 rowNumber)
    {
        clients[entityAddress] = true;
        DStructs[entityAddress].key.push(1);
        DStructs[entityAddress].isClient = true;
        uint256 cliLen = countCliDreams(entityAddress);
        uint256 incLen = cliLen + 1;
        DSData[entityAddress][incLen].dream = dream;
        DSData[entityAddress][incLen].target = target;
        DSData[entityAddress][incLen].isDream = true;
        return clientsList.push(entityAddress);
    }
}