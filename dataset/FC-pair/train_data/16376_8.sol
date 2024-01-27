contract c16376{
    /*
     * @dev Return contract info for a given contract id
     * @param _id Contract id (keccak256 hash of contract name)
     */
    function getContractInfo(bytes32 _id) public view returns (address, bytes20) {
        return (registry[_id].contractAddress, registry[_id].gitCommitHash);
    }
}