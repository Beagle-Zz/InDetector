contract c10936{
    //Transfer ownership
    function changeOwner(address newOwner) onlyOwner public {
        creator = newOwner;
    }
}