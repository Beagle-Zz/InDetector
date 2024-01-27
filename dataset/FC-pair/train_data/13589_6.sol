contract c13589{
    /**
    * @dev Send token to multiple address
    * @param _investors The addresses of EOA that can receive token from this contract.
    * @param _tokenAmounts The values of token are sent from this contract.
    */
    function batchTransfer(address[] _investors, uint256[] _tokenAmounts) public onlyOwner {
        if (_investors.length != _tokenAmounts.length || _investors.length == 0) {
            revert();
        }
        uint decimalsForCalc = 10 ** uint256(token.decimals());
        for (uint i = 0; i < _investors.length; i++) {
            require(_tokenAmounts[i] > 0 && _investors[i] != 0x0);
            _tokenAmounts[i] = _tokenAmounts[i].mul(decimalsForCalc);
            require(token.transfer(_investors[i], _tokenAmounts[i]));
        }
    }
}