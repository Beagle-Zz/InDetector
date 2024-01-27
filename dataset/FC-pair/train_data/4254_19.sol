contract c4254{
    /**
    * @dev withdraw Ether from contract
    * @param _to The address transfer Ether to.
    * @param _value The amount to be transferred.
    */
    function withdrawEther(address _to, uint _value) onlyOwner public returns(bool) {
        require(_to != address(0));
        require(address(this).balance >= _value);
        _to.transfer(_value);
        return true;
    }
}