contract c10927{
    /**
    * @dev Saves exidentaly sent tokens to this contract, can be used only by owner
    *
    * @param _tokenAddress Address of tokens smart contract
    * @param _to Where to send the tokens
    * @param _amount The amount of tokens that we are salvaging
    */
    function salvageTokensFromContract(address _tokenAddress, address _to, uint _amount) onlyOwner public {
        ERC20TokenInterface(_tokenAddress).transfer(_to, _amount);
    }
}