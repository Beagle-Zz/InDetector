contract c2429{
    /**
    *@dev constructor function for cloned factory
    */
    function init(address _owner) public{
        require(owner == address(0));
        owner = _owner;
    }
}