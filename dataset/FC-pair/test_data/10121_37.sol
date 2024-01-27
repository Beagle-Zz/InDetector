contract c10121{
    /**
     * @dev Create lighthouse smart contract
     * @param _minimalFreeze Minimal freeze value of XRT token
     * @param _timeoutBlocks Max time of lighthouse silence in blocks
     * @param _name Lighthouse subdomain,
     *              example: for 'my-name' will created 'my-name.lighthouse.0.robonomics.eth' domain
     */
    function createLighthouse(
        uint256 _minimalFreeze,
        uint256 _timeoutBlocks,
        string  _name
    )
        external
        returns (address lighthouse)
    {
        // Name reservation check
        bytes32 subnode = keccak256(abi.encodePacked(lighthouseNode, keccak256(_name)));
        require(ens.resolver(subnode) == 0);
        // Create lighthouse
        lighthouse = new Lighthouse(lighthouseLib, _minimalFreeze, _timeoutBlocks);
        emit NewLighthouse(lighthouse, _name);
        isLighthouse[lighthouse] = true;
        // Register subnode
        ens.setSubnodeOwner(lighthouseNode, keccak256(_name), this);
        // Register lighthouse address
        ens.setResolver(subnode, resolver);
        resolver.setAddr(subnode, lighthouse);
    }
}