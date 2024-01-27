contract c16921{
    /// @dev Common function to be used also in backend
    function getSigner(
        address _pluginAddress,
        uint40 _signId,
        uint40 _cutieId,
        uint128 _value,
        uint256 _parameter,
        uint8 _v,
        bytes32 _r,
        bytes32 _s
        )
        public pure returns (address)
    {
        bytes32 msgHash = hashArguments(_pluginAddress, _signId, _cutieId, _value, _parameter);
        return ecrecover(msgHash, _v, _r, _s);
    }
}