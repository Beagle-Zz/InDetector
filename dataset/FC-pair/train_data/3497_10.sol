contract c3497{
    /**
    * @dev Approve the passed address to spend the specified amount of tokens on behalf of msg.sender.
    *
    * Beware that changing an allowance with this method brings the risk that someone may use both the old
    * and the new allowance by unfortunate transaction ordering. One possible solution to mitigate this
    * race condition is to first reduce the spender's allowance to 0 and set the desired value afterwards:
    * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
    * @param _tokenId uint256 is subtoken identifier
    * @param _spender The address which will spend the funds.
    * @param _value The amount of tokens to be spent.
    */
    function approve(uint256 _tokenId, address _spender, uint256 _value) public returns (bool) {
        var _sender = msg.sender;
        allowed[_tokenId][_sender][_spender] = _value;
        Approval(_tokenId, _sender, _spender, _value);
        return true;
    }
}