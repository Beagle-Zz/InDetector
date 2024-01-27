contract c2532{
    /**
     *  Set profile info by string key
     */
    function setProfile(
        string profileKey,
        string profileValue,
        string repKey,
        uint32 repValue
    ) external onlyOwner
    {
        profileMap[profileKey] = profileValue;
        if (bytes(repKey).length != 0) {
            compositeReputationMap[repKey] = repValue;
        }
    }
}