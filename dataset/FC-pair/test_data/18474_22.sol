contract c18474{
    // Internal check for whether an application name has been taken
    function applicationNameHashTaken(bytes32 applicationNameHash, bool official) internal view returns (bool) {
        if (official) {
            return officialApplicationDirectory[applicationNameHash]._initialized;
        } else {
            return unofficialApplicationDirectory[applicationNameHash]._initialized;
        }
    }
}