contract c18592{
    /// @dev withDraw Ether to a Safe Wallet
    function withDraw(address _etherAddress) public payable onlyOwner {
        require (_etherAddress != address(0));
        address contractAddress = this;
        _etherAddress.transfer(contractAddress.balance);
    }
}