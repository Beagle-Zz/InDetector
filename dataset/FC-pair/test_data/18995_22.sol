contract c18995{
    /**
     * Register a name that's not currently registered
     * @param subnodeStr The label to register.
     * @param _owner The address of the new owner.
     */
    function registerName(string subnodeStr, address _owner) req(admins[msg.sender]) external {
        // labelhash
        bytes32 subnode = keccak256(subnodeStr);
        _setSubnodeOwner(subnode, _owner);
    }
}