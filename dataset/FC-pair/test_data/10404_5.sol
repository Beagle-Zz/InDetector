contract c10404{
    //Hand over the view layer authority
    function Transfer_of_authority(address newOwner) onlyOwner public{
        owner=newOwner;
    }
}