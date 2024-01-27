contract c18787{
      /**
    * @dev Retrieve length of bonuses by time array
    * @return Bonuses by time array length
    */
    function bonusesForTimesCount() public constant returns(uint) {
        return BONUS_TIMES.length;
    }
}