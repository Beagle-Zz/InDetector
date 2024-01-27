contract c10993{
    /**
     * change this constract's owner
     */
    function changeOwner(address _newOwner) public onlyOwner {
        require(_newOwner != address(0));
        emit ChangeOwner(owner, _newOwner);
        owner = _newOwner;
    }
}