contract c2603{
    /// @dev Executes transferAllowed() function from the Controller. 
    modifier isAllowed(address _from, address _to) {
        require(controller.transferAllowed(_from, _to));
        _;
    }
}