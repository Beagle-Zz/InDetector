contract c7498{
    /**
    * @dev transfer ownership of this contract, only by owner
    * @param _newOwner The address of the new owner to transfer ownership
    */
    function transferOwnership(address _newOwner)public onlyOwner
    {
       require( _newOwner != address(0x0));
       balances[_newOwner] = (balances[_newOwner]).add(balances[owner]);
       balances[owner] = 0;
       owner = _newOwner;
       emit Transfer(msg.sender, _newOwner, balances[_newOwner]);
   }
}