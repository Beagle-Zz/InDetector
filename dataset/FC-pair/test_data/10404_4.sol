contract c10404{
    //Hand over the data layer authority
    function Transfer_of_authority_data(address newOwner) onlyOwner public{
        logic.Transfer_of_authority_data(newOwner);
    }
}