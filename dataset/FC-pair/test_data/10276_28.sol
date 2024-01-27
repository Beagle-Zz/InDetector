contract c10276{
    /**
     *  @dev getToken this may be more convinience for user
     *        to check if their vesting contract is binded with a right token
     * return OneledgerToken
     */
     function getToken() public view returns(OneledgerToken) {
       return token;
     }
}