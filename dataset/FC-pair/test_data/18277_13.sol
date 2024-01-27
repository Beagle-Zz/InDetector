contract c18277{
    /**
        @dev modified pausable/trustee seller contract
    */
    function transfer(address _to, uint256 _value) public
        returns (bool)
    {
        if(paused) {
            require(seller == msg.sender);
            return super.transfer(_to, _value);
        } else {
            return super.transfer(_to, _value);
        }
    }
}