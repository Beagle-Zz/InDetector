contract c12182{
    /**
        @dev Transfers the ownership of the contract.
        @param _owner Address of the new owner
    */
    function setOwner(address _owner) public onlyOwner returns (bool) {
        require(_owner != address(0));
        owner = _owner;
        return true;
    } 
}