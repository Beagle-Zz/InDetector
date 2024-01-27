contract c12065{
    // Return the registered EOS public key for the passed address
    function getEOSKeyFor(address _address) public view returns (string)
    {
        string memory _eosKey;
        // Get any key registered with EOSclassic
        _eosKey = keys[_address];
        if (bytes(_eosKey).length > 0) {
            // EOSclassic key was registered; return this over the original crowdsale address
            return _eosKey;
        } else {
            // EOSclassic doesn't have an EOS public key registered; return any original crowdsale key
            _eosKey = queryEOSCrowdsaleKey(_address);
            return _eosKey;
        }
    }
}