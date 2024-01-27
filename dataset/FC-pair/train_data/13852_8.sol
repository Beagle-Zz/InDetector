contract c13852{
    /**
     * @dev Registers a user for NUM_REGISTER_DAYS days
     * @notice Changes state
     * @param _expectedStartDate (unix time: uint32) Start date the user had in mind when submitting the transaction
     */
    function register(uint32 _expectedStartDate) external payable {
        // throw if sent ether doesn't match the total registration fee
        require(REGISTRATION_FEE.mul(NUM_REGISTER_DAYS) == msg.value);
        // can't register more than 100 days in advance
        require(_expectedStartDate <= getDate(uint32(now)).add(NINETY_DAYS));
        uint32 startDate = getStartDate();
        // throw if actual start day doesn't match the user's expectation
        // may happen if a transaction takes a while to get mined
        require(startDate == _expectedStartDate);
        for (uint32 i = 0; i < NUM_REGISTER_DAYS; i++) {
            uint32 date = startDate.add(i.mul(DAY));
            // double check that user already hasn't been registered
            require(userDateToStatus[msg.sender][date] == UserEntryStatus.NULL);
            userDateToStatus[msg.sender][date] = UserEntryStatus.REGISTERED;
            userToDates[msg.sender].push(date);
            dateToUsers[date].push(msg.sender);
            dateToContestStatus[date].numRegistered += 1;
        }
    }
}