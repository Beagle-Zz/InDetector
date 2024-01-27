contract c4898{
    /// @notice Check is transaction exist
    /// @param _key transaction id
    /// @return bool
    function isTxExist(bytes32 _key) public view returns (bool){
        return txKey2index[_key] != 0;
    }
}