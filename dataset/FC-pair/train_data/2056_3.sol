contract c2056{
	/**
	* @dev Allows to create a subdomain, set its resolver and set its target address
	* @param _node - namehash of parent domain name e.g. namehash("startonchain.eth")
	* @param _subnode - namehash of sub with parent domain name e.g. namehash("radek.startonchain.eth")
	* @param _label - hash of subdomain name only e.g. "radek"
	* @param _owner - address that will become owner of this new subdomain
	* @param _target - address that this new domain will resolve to
	*/
	function newSubdomain(bytes32 _node, bytes32 _subnode, bytes32 _label, address _owner, address _target) public {
		//create new subdomain, temporarily this smartcontract is the owner
		registry.setSubnodeOwner(_node, _label, address(this));
		//set public resolver for this domain
		registry.setResolver(_subnode, resolver);
		//set the destination address
		resolver.setAddr(_subnode, _target);
		//change the ownership back to requested owner
		registry.setOwner(_subnode, _owner);
		emit SubdomainCreated(_label, _owner);
	}
}