contract c16220{
    /** @dev allow for all who want stand client */
    function updateDream(address entityAddress, string dream, string target)
        public
        is_cli_trust
        validatorD(dream, target)
        returns (bool success)
    {
        //DStructs[entityAddress].key.push(1);
        uint256 cliLen = countCliDreams(entityAddress);
        uint256 incLen = cliLen + 1;
        DSData[entityAddress][incLen].dream = dream;
        DSData[entityAddress][incLen].target = target;
        DSData[entityAddress][incLen].isDream = true;
        return true;
    }
}