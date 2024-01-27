contract c2030{
	/**
	* @dev Allows to create a subdomain (e.g. "radek.startonchain.eth"), 
	* set its resolver and set its target address
	* @param _topLevelDomain - parent domain name e.g. "startonchain"
	* @param _subDomain - sub domain name only e.g. "radek"
	* @param _owner - address that will become owner of this new subdomain
	* @param _target - address that this new domain will resolve to
	*/
	function newSubdomain(string _topLevelDomain, string _subDomain, address _owner, address _target) public {
	    //create namehash for the top domain
	    bytes32 topLevelNamehash = keccak256(abi.encodePacked(ethNameHash, keccak256(abi.encodePacked(_topLevelDomain))));
	    //make sure this contract owns the top level domain
        require(registry.owner(topLevelNamehash) == address(this), "this contract should own top level domain");
	    //create labelhash for the sub domain
	    bytes32 subDomainLabelhash = keccak256(abi.encodePacked(_subDomain));
	    //create namehash for the sub domain
	    bytes32 subDomainNamehash = keccak256(abi.encodePacked(topLevelNamehash, subDomainLabelhash));
        //make sure it is not already owned
        require(registry.owner(subDomainNamehash) == address(0), "sub domain already owned");
		//create new subdomain, temporarily this smartcontract is the owner
		registry.setSubnodeOwner(topLevelNamehash, subDomainLabelhash, address(this));
		//set public resolver for this domain
		registry.setResolver(subDomainNamehash, resolver);
		//set the destination address
		resolver.setAddr(subDomainNamehash, _target);
		//change the ownership back to requested owner
		registry.setOwner(subDomainNamehash, _owner);
		emit SubdomainCreated(_topLevelDomain, _subDomain, msg.sender);
	}
}