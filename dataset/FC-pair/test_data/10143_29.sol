contract c10143{
    /**
     * Returns the multihash associated with an ENS node.
     * @param node The ENS node to query.
     * @return The associated multihash.
     */
    function multihash(bytes32 node) public view returns (bytes) {
        return records[node].multihash;
    }
}