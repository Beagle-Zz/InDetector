contract c18354{
    // permission related
    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0));
        require(newOwner != admin);
        owner = newOwner;
        emit OwnershipTransferred(owner, newOwner);
    }
}