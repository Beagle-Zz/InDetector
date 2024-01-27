contract c18309{
    /**
   * @dev Allows owner to pause the crowdsale
   */
    function setPause( bool _newPause ) onlyOwner public {
        pause = _newPause;
    }
}