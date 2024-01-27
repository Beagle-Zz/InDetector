contract c10225{
    /**** Delete Methods ***********/
    /// @param _key The key for the record
    function deleteAddress(bytes32 _key) onlyLatestRocketNetworkContract external {
        delete addressStorage[_key];
    }
}