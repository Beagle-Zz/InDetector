contract c16666{
    // Allows execution by the controllers only
    modifier onlyControllers { 
        require(isController[msg.sender]);
        _; 
    }
}