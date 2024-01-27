contract c10225{
    /**** Set Methods ***********/
    /// @param _key The key for the record
    function setAddress(bytes32 _key, address _value) onlyLatestRocketNetworkContract external {
        addressStorage[_key] = _value;
    }
}