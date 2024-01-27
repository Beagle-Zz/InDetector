contract c12677{
    /**
     * @dev Calculate typed hash of given data (compare eth_signTypedData).
     * @return Hash of given data.
     */
    function calcHash(
        uint32 _roundId,
        uint8 _gameType,
        uint16 _num,
        uint _value,
        int _balance,
        bytes32 _serverHash,
        bytes32 _playerHash,
        uint _gameId,
        address _contractAddress
    )
        private
        pure
        returns(bytes32)
    {
        bytes32 dataHash = keccak256(abi.encodePacked(
            _roundId,
            _gameType,
            _num,
            _value,
            _balance,
            _serverHash,
            _playerHash,
            _gameId,
            _contractAddress
        ));
        return keccak256(abi.encodePacked(
            TYPE_HASH,
            dataHash
        ));
    }
}