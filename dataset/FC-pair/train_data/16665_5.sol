contract c16665{
   /**
    *   @dev Function to donate for event
    *   @param _event     address of event
    *   @param _amount    donation amount    
    */
    function donate(address _event, uint _amount) public onlyActive(_event) {
        require (transfer(_event, _amount));
        require (HumanEvent(_event).contribute(msg.sender, _amount));
        Contribute(_event, msg.sender, _amount);
    }
}