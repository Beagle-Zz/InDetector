contract c18995{
    /**
     * INTERNAL - Register a name that's not currently registered
     * @param subnode The hash of the label to register.
     * @param _owner The address of the new owner.
     */
    function _setSubnodeOwner(bytes32 subnode, address _owner) internal {
        require(!knownNodes[subnode]);
        knownNodes[subnode] = true;
        ens.setSubnodeOwner(rootNode, subnode, _owner);
    }
}