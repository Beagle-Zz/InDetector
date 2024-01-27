contract c18583{
    // permission related
    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0));
        require(newOwner != admin);
        owner = newOwner;
        OwnershipTransferred(owner, newOwner);
    }
}