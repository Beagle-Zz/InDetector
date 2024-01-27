contract c18474{
    // Indicates whether a given application name has been claimed for official and unofficial applications
    function applicationNameTaken(string applicationName)
        public
        view
        returns (bool officialTaken, bool unofficialTaken)
    {
        bytes32 applicationNameHash = keccak256(applicationName);
        return (
            officialApplicationDirectory[applicationNameHash]._initialized,
            unofficialApplicationDirectory[applicationNameHash]._initialized
        );
    }
}