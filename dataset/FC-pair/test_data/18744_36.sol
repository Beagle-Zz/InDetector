contract c18744{
    // Transfer ownership of token to a new address need for the next sale
    function transferTokenOwnership(address _newOwner) public onlyOwner {
        require(ended());
        require(_newOwner != 0x0);
        // transfer token ownership
        Ownable(token).transferOwnership(_newOwner);
    }
}