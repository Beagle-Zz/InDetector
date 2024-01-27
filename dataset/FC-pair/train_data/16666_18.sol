contract c16666{
   // Allows contributing and voting only to human events 
    modifier onlyActive(address _event) {
        require(isActiveEvent[_event]);
        _;
    }
}