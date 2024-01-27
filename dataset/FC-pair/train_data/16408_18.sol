contract c16408{
    /**
    * @dev allows contract owner to mint tokens for presale or non-ETH contributions in batches
     * @param _toList address[] array of the beneficiaries to receive tokens
     * @param _tokenList uint256[] array of the token amounts to mint for the corresponding users
    */
    function batchMintPresaleTokens(address[] _toList, uint256[] _tokenList) external onlyOwner onlyCrowdsaleStage {
        require(_toList.length == _tokenList.length);
        for (uint256 i; i < _toList.length; i = i.add(1)) {
            mintPresaleTokens(_toList[i], _tokenList[i]);
        }
    }
}