contract c18995{
    /**
     * Register a name that's not currently registered
     * @param subnode The hash of the label to register.
     * @param _owner The address of the new owner.
     */
    function register(bytes32 subnode, address _owner) req(admins[msg.sender]) external {
        _setSubnodeOwner(subnode, _owner);
    }
}