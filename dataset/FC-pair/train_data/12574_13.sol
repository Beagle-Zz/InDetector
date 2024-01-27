contract c12574{
     /**
      * Amount owed to this person.
      */
    function amountIAmOwed() public view returns (uint256){
        return amountOwed(msg.sender);
    }
}