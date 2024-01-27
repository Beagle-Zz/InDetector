contract c16408{
    // list of modifers
    modifier onlyManager(){
        require(isManagers[msg.sender]);
        _;
    }
}