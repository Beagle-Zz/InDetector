contract c16665{
   /**
    *   @dev Function voting for the success of the event
    *   @param _event     address of event
    *   @param _proposal  true - event completed successfully, false - otherwise
    */
    function vote(address _event, bool _proposal) public onlyActive(_event) {
        require(transfer(_event, voteCost));
        require(HumanEvent(_event).vote(msg.sender, _proposal));
        Vote(_event, msg.sender, _proposal);
    }
}