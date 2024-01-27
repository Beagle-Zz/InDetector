contract c13892{
    /**
     * @dev get the token lock type
     * @param _weiAmount Value in wei to be converted into tokens
     * @return token lock type
     */
    function _getTokenLockType(uint256 _weiAmount) internal view returns (TokenLockType) {
        TokenLockType lockType = TokenLockType.TYPE_NOT_LOCK;
        if (_weiAmount >= 1000 ether) {
            lockType = TokenLockType.TYPE_SEED_INVESTOR;
        } else if (currentPhase == 0 ) {
            lockType = TokenLockType.TYPE_PRE_SALE;
        }
        return lockType;
    }
}