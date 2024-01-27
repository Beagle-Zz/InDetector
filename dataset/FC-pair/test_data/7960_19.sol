contract c7960{
    /**
     * @dev The initialization method.
     *
     * @param _individualMinCap The minimum amount of ether contribution per address.
     * @param _individualMaxCap The maximum amount of ether contribution per address.
     */
    function initializeIndividualCapsFundraiser(uint256 _individualMinCap, uint256 _individualMaxCap) internal {
        individualMinCap = _individualMinCap;
        individualMaxCap = _individualMaxCap;
        individualMaxCapTokens = _individualMaxCap * conversionRate;
    }
}