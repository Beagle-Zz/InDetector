contract c16665{
   /**
    *   @dev Function to add a new event from TheHuman team
    *   @param _event       a new event address
    */   
    function  addEvent(address _event) external onlyEventManager {
        require (!isActiveEvent[_event]);
        isActiveEvent[_event] = true;
        EventAdded(_event);
    }
}