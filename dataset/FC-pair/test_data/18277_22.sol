contract c18277{
    /**
        @dev sell function implements
    */
    function sell(address _investor, uint256 _amount) internal
    {
        Crowd.tokens = sub(Crowd.tokens, _amount);
        tokenAddress.transfer(_investor, _amount);
        //if(!ethOwner.send(msg.value)) revert();
    }
}