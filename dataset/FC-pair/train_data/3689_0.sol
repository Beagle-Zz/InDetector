contract c3689{
    // Modifier to ensure generateTokens() is only ran once by the constructor
    modifier onlyController { 
        require(
            msg.sender == controller
            ); 
            _; 
    }
}