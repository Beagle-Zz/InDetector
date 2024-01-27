contract c2301{
    /** @dev Compute the amount of jurors to be drawn.
     *  @param _extraData Null for the default number. Other first 16 bits will be used to return the number of jurors.
     *  Note that it does not check that the number of jurors is odd, but users are advised to choose a odd number of jurors.
     */
    function extraDataToNbJurors(bytes _extraData) internal view returns (uint16 nbJurors) {
        if (_extraData.length < 2)
            return defaultNumberJuror;
        else
            return (uint16(_extraData[0]) << 8) + uint16(_extraData[1]);
    }
}