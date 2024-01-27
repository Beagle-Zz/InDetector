contract c12065{
    // EOSclassic developer's note: the registration function is identical
    // to the original EOS crowdsale registration function with only the
    // freeze function removed, and 'emit' added to the LogRegister event,
    // per updated Solidity standards.
    //
    // Value should be a public key.  Read full key import policy.
    // Manually registering requires a base58
    // encoded using the STEEM, BTS, or EOS public key format.
    function register(string key) public {
        assert(bytes(key).length <= 64);
        keys[msg.sender] = key;
        emit LogRegister(msg.sender, key);
    }
}