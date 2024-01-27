contract c10404{
    //Hand over the logical layer authority
    function Transfer_of_authority_logic(address newOwner) onlyOwner public{
        logic.Transfer_of_authority(newOwner);
    }
}