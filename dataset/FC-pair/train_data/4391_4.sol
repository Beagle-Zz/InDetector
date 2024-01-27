contract c4391{
    // Value should be a public key.  Read full key import policy.
    // Manually registering requires a base58
    // encoded using the STEEM, BTS, or ONO public key format.
    function register(string key) public {
        assert(currRound() <=  numberOfRounds + 1);
        assert(bytes(key).length <= 64);
        keys[msg.sender] = key;
        emit LogRegister(msg.sender, key);
    }
}