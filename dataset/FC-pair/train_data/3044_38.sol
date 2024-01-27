contract c3044{
    //ENTRYPOINTS
    /*
     * Public function, can only be called from the outside.
     * Fund an issue, providing a token and value.
     * Requires an allowance > _value of the token.
     */
    function fund(bytes32 _platform, string _platformId, address _token, uint256 _value) external returns (bool success) {
        require(doFunding(_platform, _platformId, _token, _value, msg.sender), "funding with token failed");
        return true;
    }
}